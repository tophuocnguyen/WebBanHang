using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Trang_NhomToPhuocNguyen_Taikhoankhach : System.Web.UI.Page
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
    public DataTable HoaDon(string Username)
    {
        string SQL = "select CD.ID AS 'Mã Hóa Đơn', P.ID as 'Mã Mặt Hàng', P.Ten as 'Tên Mặt Hàng',P.Gia as 'Giá',CD.SL as 'Số Lượng',C.NgayLap as 'Ngày Đặt Hàng' from	NguoiDung U join HoaDon C on U.Username = C.ID_NguoiDung 	join ChiTietHD CD on C.ID = CD.ID_HD 	join SanPham P on P.ID = CD.ID_SP where U.Username='" + Username + "' ORDER BY C.ID asc";
        SqlDataAdapter adap = new SqlDataAdapter(SQL, connStr);
        DataTable ds = new DataTable();
        adap.Fill(ds);
        return ds;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        int flag = 0;
        if (Request.Cookies["Login"] != null)
        {
            string User, Pass;
            User = Server.HtmlEncode(Request.Cookies["Login"]["User"]);
            Pass = Server.HtmlEncode(Request.Cookies["Login"]["Password"]);
            if (kiemTraThongTinDangNhap(User, Pass) > 0)
            {
                flag = 1;
                GridView1.DataSource = HoaDon(User);
                GridView1.DataBind();
                string sql = "select Ho, Ten, GT, DC, SDT, Email, Anh from NguoiDung where Username='" + User + "'";
                SqlDataAdapter adap = new SqlDataAdapter(sql, connStr);
                DataTable ds = new DataTable();
                adap.Fill(ds);
                DataRow[] foundRows;
                foundRows = ds.Select();
                if (!IsPostBack)
                {
                    TxtHo.Text = foundRows[0][0].ToString();
                    TxtTen.Text = foundRows[0][1].ToString();
                    RadioButtonList1.SelectedValue = foundRows[0][2].ToString();
                    TxtDC.Text = foundRows[0][3].ToString();
                    TxtDT.Text = foundRows[0][4].ToString();
                    Anh.ImageUrl = foundRows[0][5].ToString();
                }
        
                
            }
        }

        if (flag == 0)
            Page.ClientScript.RegisterStartupScript(this.GetType(), "DieuKien", "DieuKien()", true);
    }
    public void PassUserInformation(string Username, string Password)
    {
        SqlConnection connDB = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("PassND", connDB);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@Username", SqlDbType.NVarChar).Value = Username;
        cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = Password;
        connDB.Open();
        cmd.ExecuteNonQuery();
        connDB.Close();
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        try
        {
            if (TxtMkc.Text != Server.HtmlEncode(Request.Cookies["Login"]["Password"]) || TxtMkm.Text.Length <= 5 || TxtMkm.Text != TxtMkm1.Text)
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ThatBai", "ThatBai()", true);
            else
            {
                string User, Pass;
                User = Request.Cookies["Login"]["User"];
                Pass = TxtMkm.Text;
                PassUserInformation(User, Pass);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "", "ThanhCong()", true);
            }
        }
        catch
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ThatBai", "ThatBai()", true);
        }
    }
    public void UpdateUserInformation(string Ho, string Ten, string GT,string DC, string DT, string Email, string Anh)
    {
        string Username = Request.Cookies["Login"]["User"];
        SqlConnection connDB = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("SuaND  '" + Username + "','" + Ho + "','" + Ten + "','" + GT + "''" + DC + "','" + DT + "','" + Email + "','" + Anh + "'", connDB);
        connDB.Open();
        cmd.ExecuteNonQuery();
        connDB.Close();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        if (TxtHo.Text.Length == 0 || TxtTen.Text.Length == 0 || TxtDC.Text.Length == 0 || TxtDT.Text.Length <= 5 || TxtEmail.Text.Length == 0)
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ThatBai", "ThatBai()", true);
        else
            try
            {
                string TenFile = "";
                string DuongDan = "";
                if (FileAnh.HasFile)
                {
                    TenFile = FileAnh.FileName;
                    DuongDan = Server.MapPath("~/css/images/");
                    FileAnh.SaveAs(DuongDan + TenFile);
                    TenFile = "~/css/images/" + FileAnh.FileName;
                }
                else TenFile = Anh.ImageUrl;

                UpdateUserInformation(TxtHo.Text, TxtTen.Text, RadioButtonList1.SelectedValue, TxtDC.Text, TxtDT.Text, TxtEmail.Text, TenFile );
                Page.ClientScript.RegisterStartupScript(this.GetType(), "", "ThanhCong()", true);

            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ThatBai", "ThatBai()", true);
            }
    }
}