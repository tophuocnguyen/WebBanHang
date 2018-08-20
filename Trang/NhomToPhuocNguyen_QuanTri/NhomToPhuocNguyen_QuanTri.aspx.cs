using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Trang_NhomToPhuocNguyen_QuanTri_NhomToPhuocNguyen_QuanTri : System.Web.UI.Page
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
    private void Fill()
    {

        SqlDataAdapter adap1 = new SqlDataAdapter("Select s.Ten as 'Tên',s.LuotXem as 'Lượt xem', s.Gia as 'Giá', s.DaMua as 'DaMua', s.Anh as 'ảnh',  s.ChiTiet as 'Chi Tiết' from SanPham s", connStr);
        DataTable ds1 = new DataTable();
        adap1.Fill(ds1);
        GridView2.DataSource = ds1;
        GridView2.DataBind();

        SqlDataAdapter adap2 = new SqlDataAdapter("SanPham_DS", connStr);
        DataTable ds2 = new DataTable();
        adap2.Fill(ds2);
        GridView1.DataSource = ds2;
        GridView1.DataBind();

        SqlDataAdapter adap3 = new SqlDataAdapter("HoaDon_DS", connStr);
        DataTable ds3 = new DataTable();
        adap3.Fill(ds3);
        GridView3.DataSource = ds3;
        GridView3.DataBind();



        SqlDataAdapter adap4 = new SqlDataAdapter("NguoiDUng_DS", connStr);
        DataTable ds4 = new DataTable();
        adap4.Fill(ds4);
        GridView4.DataSource = ds4;
        GridView4.DataBind();
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
                Fill();
                Page.SetFocus(this.DynamicHyperLink2.ClientID);
            }
        }
        if (flag == 0)
            Response.Redirect("~/Trang/NhomToPhuocNguyen.aspx");
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
    }
    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
    }
    protected void GridView3_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView3.PageIndex = e.NewPageIndex;
    }
    protected void GridView4_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView4.PageIndex = e.NewPageIndex;
    }
}