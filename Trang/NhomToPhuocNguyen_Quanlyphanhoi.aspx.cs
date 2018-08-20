using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Trang_NhomToPhuocNguyen_Phanhoi : System.Web.UI.Page
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
                SqlDataAdapter adap = new SqlDataAdapter("select P.Ho as 'Họ', P.Ten as 'Tên' , P.GT as 'Giới tính', P.NGT as 'Người giới thiệu', P.Email as 'Email', P.HaiLong as 'Hài lòng', P.NhantXet as 'Nhận xét' from PhanHoi P", connStr);
                DataTable ds = new DataTable();
                adap.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }
        if (flag == 0)
            Response.Redirect("~/Trang/NhomToPhuocNguyen_TrangChu.aspx");
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
    }
}