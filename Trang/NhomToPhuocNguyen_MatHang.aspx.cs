using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Trang_NhomToPhuocNguyen_MatHang : System.Web.UI.Page
{
    private string connStr = ConfigurationManager.ConnectionStrings["csdlToPhuocNguyen"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"];
        int[] amount = Enumerable.Range(1, 20).ToArray();

        DropSoluong.DataSource = amount;
        DropSoluong.AppendDataBoundItems = true;
        DropSoluong.DataBind();
        SqlDataAdapter adap = new SqlDataAdapter("SanPham_Select " + id, connStr);
        DataTable ds = new DataTable();
        adap.Fill(ds);
        DataRow[] foundRows;
        foundRows = ds.Select();
        ImgSP.ImageUrl = foundRows[0][5].ToString();
        LbTen.Text = foundRows[0][1].ToString();
        LbGia.Text = foundRows[0][3].ToString();
        LbLuotxem.Text = foundRows[0][2].ToString();
        LbDamua.Text = foundRows[0][4].ToString();
        LbThongtin.Text = foundRows[0][6].ToString();
    }

    protected void ImageBtbDatHang_Click(object sender, ImageClickEventArgs e)
    {
        string id = Request.QueryString["id"];
        if (Request.Cookies["Max"] == null)
        {
            Response.Cookies["Max"]["i"] = "0";
            Response.Cookies["Max"].Expires = DateTime.Now.AddDays(15);
        }
        int n = Int16.Parse(Server.HtmlEncode(Request.Cookies["Max"]["i"]));


        int flag = 1;
        for (int i = 1; i <= n; i++)
        {
            if ((Request.Cookies[i.ToString()] != null))
            {
                string istring;
                istring = Server.HtmlEncode(Request.Cookies[i.ToString()]["ID"]);

                if (istring == id)
                {
                    //ko quan tam may ten j
                    Response.Cookies[i.ToString()]["ID"] = id;
                    Response.Cookies[i.ToString()]["Amount"] = DropSoluong.SelectedValue;
                    Response.Cookies[i.ToString()].Expires = DateTime.Now.AddDays(15);
                    flag = 0;
                    break;
                }
            }
            //khong else vi neu co nhieu null cung se ko giai quyet dc van de
        }
        if (flag == 1)
        {
            n += 1;
            Response.Cookies["Max"]["i"] = n.ToString();
            Response.Cookies[n.ToString()]["ID"] = id;
            Response.Cookies[n.ToString()]["Amount"] = DropSoluong.SelectedValue;
            Response.Cookies[n.ToString()].Expires = DateTime.Now.AddDays(15);
        }
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Thành công", "ThanhCong()", true);
        Response.Redirect("~/Trang/NhomToPhuocNguyen_Muahang.aspx" + ((ImageButton)sender).CommandArgument);
    }
}