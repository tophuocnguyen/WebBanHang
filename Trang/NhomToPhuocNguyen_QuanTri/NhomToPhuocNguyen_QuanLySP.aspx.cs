using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Trang_NhomToPhuocNguyen_QuanTri_NhomToPhuocNguyen_QuanLySP : System.Web.UI.Page
{
    private string connStr = ConfigurationManager.ConnectionStrings["csdlToPhuocNguyen"].ToString();
    private int kiemTraThongTinDangNhap(string User, string Pass)
    {

        try
        {
            SqlDataAdapter adap = new SqlDataAdapter("NguoiDung_Level " + User + "," + Pass, connStr);
            DataTable ds = new DataTable();
            adap.Fill(ds);
            DataRow[] foundRows;
            foundRows = ds.Select();
            return Int32.Parse(foundRows[0][0].ToString());
        }
        catch
        {
            return -1;
        }

    }
    public void Product_Add(string TID, string Name, string Price, string De, string Image)
    {
        SqlConnection connDB = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("SanPham_Them", connDB);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@ID_LSP", SqlDbType.NVarChar).Value = TID;
        cmd.Parameters.Add("@Ten", SqlDbType.NVarChar).Value = Name;
        cmd.Parameters.Add("@Gia", SqlDbType.NVarChar).Value = Price;
        cmd.Parameters.Add("@NhanXet", SqlDbType.NVarChar).Value = De;
        cmd.Parameters.Add("@Anh", SqlDbType.NVarChar).Value = Image;
        connDB.Open();
        cmd.ExecuteNonQuery();
        connDB.Close();
    }
    public DataTable ProductTypes_DS2()
    {
        SqlDataAdapter adap = new SqlDataAdapter("LoaiSP_DS2", connStr);
        DataTable ds = new DataTable();
        adap.Fill(ds);
        return ds;
    }

    public DataTable Product_DS()
    {
        SqlDataAdapter adap = new SqlDataAdapter("SanPham_DS", connStr);
        DataTable ds = new DataTable();
        adap.Fill(ds);
        return ds;
    }
    public void Product_Update(string ID, string Name, string Price, string De, string Image)
    {
        SqlConnection connDB = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("SanPham_Sua", connDB);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@ID", SqlDbType.NVarChar).Value = ID;
        cmd.Parameters.Add("@Ten", SqlDbType.NVarChar).Value = Name;
        cmd.Parameters.Add("@Gia", SqlDbType.NVarChar).Value = Price;
        cmd.Parameters.Add("@ChiTiet", SqlDbType.NVarChar).Value = De;
        cmd.Parameters.Add("@Anh", SqlDbType.NVarChar).Value = Image;
        connDB.Open();
        cmd.ExecuteNonQuery();
        connDB.Close();
    }

    public void Product_Delete(string ID)
    {
        SqlConnection connDB = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("SanPham_Xoa", connDB);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@ID", SqlDbType.NVarChar).Value = ID;
        connDB.Open();
        cmd.ExecuteNonQuery();
        connDB.Close();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        int flag = 0;
        if (Request.Cookies["Login"] != null)
        {
            string User, Pass;
            User = Server.HtmlEncode(Request.Cookies["Login"]["User"]);
            Pass = Server.HtmlEncode(Request.Cookies["Login"]["Password"]);
            if (kiemTraThongTinDangNhap(User, Pass) == 0)
            {
                flag = 1;
                //
                SqlDataAdapter adap2 = new SqlDataAdapter("SanPham_DS", connStr);
                DataTable ds2 = new DataTable();
                adap2.Fill(ds2);
                GridView1.DataSource = ds2;
                GridView1.DataBind();

                if (!IsPostBack)
                {
                    DropLoaiSP.DataSource = ProductTypes_DS2();
                    DropLoaiSP.DataTextField = "Ten";
                    DropLoaiSP.DataValueField = "ID";
                    DropLoaiSP.DataBind();
                    Page.SetFocus(this.Button3.ClientID);
                }

            }
        }
        if (flag == 0)
            Response.Redirect("~/Trang/NhomToPhuocNguyen_TrangChu.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        if (TxtTenSP.Text.Length == 0 || TxtGia.Text.Length == 0 || TxtChitiet.Text.Length == 0 || FileAnh.FileName.Length == 0)
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Loi", "Loi()", true);
        else
        {
            try
            {
                string TenFile = "";
                string DuongDan = "";
                if (FileAnh.HasFile)
                {
                    TenFile = FileAnh.FileName;
                    DuongDan = Server.MapPath("~/css/images/");
                    FileAnh.SaveAs(DuongDan + TenFile);
                }
                Product_Add(DropLoaiSP.SelectedValue, TxtTenSP.Text, TxtGia.Text, TxtChitiet.Text, "~/css/images/" + TenFile);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Thêm thành công", "ThemThanhCong()", true);
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Loi", "Loi()", true);
            }
        }
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        if (TxtTenSP1.Text.Length == 0 || TxtGia1.Text.Length == 0 || TxtChitiet1.Text.Length == 0 || lbID.Text.Length == 0)
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Loi", "Loi()", true);
        else
        {
            try
            {
                string TenFile = "";
                string DuongDan = "";

                if (FileAnh1.HasFile)
                {
                    TenFile = FileAnh1.FileName;
                    DuongDan = Server.MapPath("~/css/images/");
                    FileAnh1.SaveAs(DuongDan + TenFile);
                }
                else
                {

                    SqlDataAdapter adap = new SqlDataAdapter("SanPham_Select " + lbID.Text, connStr);
                    DataTable dtmp = new DataTable();
                    adap.Fill(dtmp);
                    DataRow[] foundRows;
                    foundRows = dtmp.Select();
                    TenFile = foundRows[0][5].ToString();
                }
                Product_Update(lbID.Text, TxtTenSP1.Text, TxtGia1.Text, TxtChitiet1.Text, "~/css/images/" + TenFile);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Sửa thành công", "SuaThanhCong()", true);
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Loi", "Loi()", true);
            }
        }
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        try
        {
            if (lbID.Text.Length != 0)
            {
                Product_Delete(lbID.Text);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Xóa TC", "XoaThanhCong()", true);

            }
            else
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Loi", "Loi()", true);

        }
        catch
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Loi", "Loi()", true);
        }
    }

    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        GridViewRow r;
        r = GridView1.Rows[e.NewSelectedIndex];
        TxtTenSP1.Text = Server.HtmlDecode(r.Cells[3].Text);
        TxtGia1.Text = Server.HtmlDecode(r.Cells[4].Text);
        TxtChitiet1.Text = Server.HtmlDecode(r.Cells[5].Text);
        lbID.Text = Server.HtmlDecode(r.Cells[1].Text);
        Page.SetFocus(this.Button3.ClientID);
    }
}