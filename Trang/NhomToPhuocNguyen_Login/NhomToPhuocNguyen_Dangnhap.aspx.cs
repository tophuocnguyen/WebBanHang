using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class NhomToPhuocNguyen_Dangnhap : System.Web.UI.Page
{


    private string connStr = ConfigurationManager.ConnectionStrings["csdlToPhuocNguyen"].ToString();
	
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["Login"] != null)
        {
            Response.Cookies["Login"].Expires = DateTime.Now.AddDays(-1);
        }
    }
    private int kiemTraThongTinDangNhap(string User, string Pass)
    {
        try {
            SqlDataAdapter adap = new SqlDataAdapter("NguoiDung_Level " + User + "," + Pass, connStr);
            DataTable ds = new DataTable();
            adap.Fill(ds);
            DataRow[] foundRows;
            foundRows = ds.Select();
            return Int32.Parse(foundRows[0][0].ToString());
        }
        catch {
            return -1;
        }
         
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (kiemTraThongTinDangNhap(txtUsername.Text, txtPassword.Text) != -1)
        {
            HttpCookie MaxCookie = new HttpCookie("Login");
            MaxCookie.Values["User"] = txtUsername.Text;
            MaxCookie.Values["Password"] = txtPassword.Text;

            Response.Cookies.Add(MaxCookie);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Thành công", "ThanhCong()", true);
        }
        else
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Không Thành công", "KhongThanhCong()", true);
    }
}