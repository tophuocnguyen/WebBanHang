using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Text;
using System.Web.UI.WebControls;

public partial class Trang_NhomToPhuocNguyen_DanhMuc : System.Web.UI.Page
{
    private string connStr = ConfigurationManager.ConnectionStrings["csdlToPhuocNguyen"].ToString();
    public DataTable HienThiDanhMucSanPham()
    {
        try
        {
            string danhmucsanpham = "";
            string proc = "select sp.* from SanPham sp join LoaiSP lsp on sp.ID_LSP = lsp.ID  	join DanhMucSP dm on lsp.ID_DMSP = dm.ID where dm.ID='{x}'";
            if (!String.IsNullOrWhiteSpace(Request.QueryString["Categories"]))
            {
                danhmucsanpham = Request.QueryString["Categories"];
                proc = proc.Replace("{x}", danhmucsanpham);

            }
            else Response.Redirect("~/Trang/NhomToPhuocNguyen_TrangChu.aspx");

            SqlDataAdapter adapq;
            adapq = new SqlDataAdapter(proc, connStr);
            DataTable qq = new DataTable();
            adapq.Fill(qq);
            return qq;
        }
        catch
        {
            Response.Redirect("~/Trang/NhomToPhuocNguyen_TrangChu.aspx");

        }
        return null;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataList2.DataSource = HienThiDanhMucSanPham();
            DataList2.DataBind();

            pager.DataSource = HienThiDanhMucSanPham().DefaultView;

            pager.BindToControl = DataList2;

            DataList2.DataSource = pager.DataSourcePaged;
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Trang/NhomToPhuocNguyen_MatHang.aspx?id=" + ((ImageButton)sender).CommandArgument);
    }
}