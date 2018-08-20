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


public partial class Trang_NhomToPhuocNguyen_Timkiem : System.Web.UI.Page
{
    private string connStr = ConfigurationManager.ConnectionStrings["csdlToPhuocNguyen"].ToString();
    public static string KhongDau(string s)
    {
        Regex regex = new Regex("\\p{IsCombiningDiacriticalMarks}+");
        string temp = s.Normalize(NormalizationForm.FormD);
        return regex.Replace(temp, String.Empty).Replace('\u0111', 'd').Replace('\u0110', 'D');
    }

    public DataTable ProductSearch_DS()
    {
        try
        {
            string tukhoa = "";
            string loaisanpham = "";
            string giadau = "";
            string giasau = "";
            string proc = "select s.* from SanPham s join LoaiSP l on s.ID_LSP = l.ID where 1=1";
            if (!String.IsNullOrWhiteSpace(Request.QueryString["tukhoa"]))
            {
                tukhoa = Request.QueryString["tukhoa"];
                proc += "and  s.Ten like N'%" + tukhoa + "%' ";

            }
            if (!String.IsNullOrWhiteSpace(Request.QueryString["loaisanpham"]))
            {
                loaisanpham = Request.QueryString["loaisanpham"];
                if (loaisanpham != "-1")
                    proc += "and l.ID=" + loaisanpham;

            }
            if (!String.IsNullOrWhiteSpace(Request.QueryString["giadau"]))
            {

                giadau = Request.QueryString["giadau"];
                proc += " and s.Gia >=" + giadau; ;
            }
            if (!String.IsNullOrWhiteSpace(Request.QueryString["giasau"]))
            {
                giasau = Request.QueryString["giasau"];
                proc += " and s.Gia <=" + giasau; ;
            }
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
            DataList2.DataSource = ProductSearch_DS();
            DataList2.DataBind();

            pager.DataSource = ProductSearch_DS().DefaultView;

            pager.BindToControl = DataList2;

            DataList2.DataSource = pager.DataSourcePaged;
        }
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Trang/NhomToPhuocNguyen_MatHang.aspx?id=" + ((ImageButton)sender).CommandArgument);
    }
}