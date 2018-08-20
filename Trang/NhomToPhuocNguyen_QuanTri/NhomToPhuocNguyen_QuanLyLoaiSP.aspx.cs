using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Trang_NhomToPhuocNguyen_QuanTri_NhomToPhuocNguyen_QuanLyLoaiSP : System.Web.UI.Page
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
    public DataTable ProductTypes_DS2()
    {
        SqlDataAdapter adap = new SqlDataAdapter("LoaiSP_DS2", connStr);
        DataTable ds = new DataTable();
        adap.Fill(ds);
        return ds;
    }
    public void LoaiSP_Them(string Name)
    {
        SqlConnection connDB = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("LoaiSP_Them", connDB);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@Ten", SqlDbType.NVarChar).Value = Name;
        connDB.Open();
        cmd.ExecuteNonQuery();
        connDB.Close();
    }
    public void LoaiSP_Sua(string ID, string Name)
    {
        SqlConnection connDB = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("LoaiSP_Sua", connDB);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@ID", SqlDbType.NVarChar).Value = ID;
        cmd.Parameters.Add("@Ten", SqlDbType.NVarChar).Value = Name;
        connDB.Open();
        cmd.ExecuteNonQuery();
        connDB.Close();
    }
    public void LoaiSP_Xoa(string ID)
    {
        SqlConnection connDB = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("LoaiSP_Xoa", connDB);
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
                GridView1.DataSource = ProductTypes_DS2();
                GridView1.DataBind();
                if (!IsPostBack)
                {
                    DropTen.DataSource = ProductTypes_DS2();
                    DropTen.DataTextField = "Name";
                    DropTen.DataValueField = "ID";
                    DropTen.DataBind();

                }
            }
        }
        if (flag == 0)
            Response.Redirect("~/Trang/NhomToPhuocNguyen_TrangChu.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        try
        {
            if (TxtTen.Text.Length == 0)
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Loi", "Loi()", true);
            else
            {
                LoaiSP_Them(TxtTen.Text);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Them thành công", "ThemThanhCong()", true);
            }
        }
        catch
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Loi", "Loi()", true);
        }
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        try
        {
            if (TxtTen1.Text.Length == 0)
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Loi", "Loi()", true);
            else
            {
                LoaiSP_Sua(DropTen.SelectedValue, TxtTen1.Text);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "sửa thành công", "SuaThanhCong()", true);
            }
        }
        catch
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Loi", "Loi()", true);
        }
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        try
        {
            if (DropTen.SelectedValue.Length != 0)
            {
                LoaiSP_Xoa(DropTen.SelectedValue);
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
}