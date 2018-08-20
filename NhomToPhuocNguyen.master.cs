using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class NhomToPhuocNguyen : System.Web.UI.MasterPage
{
    private string connStr = ConfigurationManager.ConnectionStrings["csdlToPhuocNguyen"].ToString();
    DataTable ds = new DataTable();
    long tongTien = 0;
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
    public void Fill_DataTable()
    {
        
        ds.Columns.Add("IDSP", typeof(string));
        ds.Columns.Add("TenSP", typeof(string));
        ds.Columns.Add("SoluongSP", typeof(string));
        ds.Columns.Add("AnhSP", typeof(string));
        ds.Columns.Add("GiaSP", typeof(string));
        ds.AcceptChanges();
        //Max != null
        int n = Int16.Parse(Server.HtmlEncode(Request.Cookies["Max"]["i"]));
        Response.Cookies["Max"].Expires = DateTime.Now.AddDays(-1);
        int nTmp = 0;
        for (int i = 1; i <= n; i++)
        {
            if ((Request.Cookies[i.ToString()] != null))
            {
                nTmp += 1;
                string ID, Amount;
                ID = Server.HtmlEncode(Request.Cookies[i.ToString()]["ID"]);
                Amount = Server.HtmlEncode(Request.Cookies[i.ToString()]["Amount"]);
                Response.Cookies[i.ToString()].Expires = DateTime.Now.AddDays(-1);

                SqlDataAdapter adap = new SqlDataAdapter("SanPham_Select " + ID, connStr);
                DataTable dtmp = new DataTable();
                adap.Fill(dtmp);
                DataRow[] foundRows;
                foundRows = dtmp.Select();
                string IDSP = ID;
                string AnhSP = foundRows[0][5].ToString();
                string TenSP = foundRows[0][1].ToString();
                string GiaSP = foundRows[0][3].ToString();
                string SoluongSP = Amount;
                ds.Rows.Add(IDSP, TenSP, SoluongSP, AnhSP, GiaSP);
                ds.AcceptChanges();
            }
        }

        if (nTmp > 0)
        {
            Response.Cookies["Max"]["i"] = nTmp.ToString();
            Response.Cookies["Max"].Expires = DateTime.Now.AddDays(15);
            for (int i = 1; i <= nTmp; i++)
            {
                //tại vì bắt đàu từ 0 nên trừ 1 là đúng
                DataRow[] foundRows;
                foundRows = ds.Select();
                Response.Cookies[i.ToString()]["ID"] = foundRows[i - 1][0].ToString();
                Response.Cookies[i.ToString()]["Amount"] = foundRows[i - 1][2].ToString();
                Response.Cookies[i.ToString()].Expires = DateTime.Now.AddDays(15);
                long a = long.Parse(foundRows[i - 1][4].ToString());
                long b = 0;
                try
                {
                    b = long.Parse(foundRows[i - 1][2].ToString());
                }
                catch
                {
                    Response.Cookies[i.ToString()]["Amount"] = "1";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "", "QuaLon()", true);
                }
                tongTien += a * b;
            }
        }
        
        LbTong.Text = tongTien.ToString();
    }
    public DataTable LoaiSP_DS()
    {
        SqlDataAdapter adapq;
        adapq = new SqlDataAdapter("SELECT * FROM LoaiSP ", connStr);
        DataTable qq = new DataTable();
        adapq.Fill(qq);
        return qq;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {



            DataTable ds = new DataTable();
            ds = LoaiSP_DS();
            DataTable KQ = new DataTable();
            KQ = ds.Clone();
           
            DataRow row = KQ.NewRow();
            row["ID"] = "-1";
            row["Ten"] = "Tất cả";
            KQ.Rows.Add(row);
            KQ.Merge(ds);
            DropLSP.DataSource = KQ;
            DropLSP.DataTextField = "Ten";
            DropLSP.DataValueField = "ID";
            DropLSP.DataBind();
        }

        long[] amount = new long[11];
        for (int i = 0; i < 11; i++)
            amount[i] = (i) * 100000;


        
        if(!IsPostBack)
        {
            DropMin.DataSource = amount;
            DropMin.AppendDataBoundItems = true;
            DropMin.DataBind();

            DropMax.DataSource = amount;
            DropMax.AppendDataBoundItems = true;
            DropMax.DataBind();
            DropMin.Text = "0";
            DropMax.Text = "1000000";
        }



        HyperLink1.Visible = true;
        HyperLink6.Visible = true;
        HyperLink2.Visible = true;
        HyperLink3.Visible = true;
        HyperLink5.Visible = true;
        HyperLink4.Visible = false;
        Lbuser.Visible = false;
        Lbuser0.Visible = false;
        Button1.Visible = false;
        if (Request.Cookies["Login"] != null)
        {
            string User, Pass;
            User = Server.HtmlEncode(Request.Cookies["Login"]["User"]);
            Pass = Server.HtmlEncode(Request.Cookies["Login"]["Password"]);

            if (kiemTraThongTinDangNhap(User, Pass) == 0)
            {
                HyperLink1.Visible = true;
                HyperLink6.Visible = false;
                HyperLink2.Visible = false;
                HyperLink3.Visible = false;
                HyperLink5.Visible = false;
                HyperLink4.Visible = true;
                Lbuser.Visible = true;
                Lbuser.Text = User;
                Lbuser0.Visible = true;
                Button1.Visible = true;

                HyperLink6.Text = "Phản hồi của khách";
                HyperLink6.NavigateUrl = "~/Trang/NhomToPhuocNguyen_Quanlyphanhoi.aspx";
                HyperLink6.Visible = true;
            }
            else if (kiemTraThongTinDangNhap(User, Pass) > 0)
            {
                HyperLink1.Visible = true;
                HyperLink6.Visible = true;
                Lbuser0.Visible = true;
                Lbuser.Visible = true;
                Button1.Visible = true;
                HyperLink2.Visible = true;
                HyperLink3.Visible = false;
                 HyperLink6.Visible = false;
                HyperLink5.Visible = true;
                HyperLink4.Visible = false;
                Lbuser.Text = User;
                //
                HyperLink3.NavigateUrl = "~/NhomNguyenNhuY_Pages/NhomToPhuocNguyen_Taikhoankhach.aspx";
                HyperLink3.Text = "Account";
                HyperLink3.Visible = true;
            }
            else if (kiemTraThongTinDangNhap(User, Pass) == -1)
                Response.Cookies["Login"].Expires = DateTime.Now.AddDays(-1);
        }
        if (Request.Cookies["Max"] == null)
            LbTong.Text = "0";
        else
        Fill_DataTable();
       
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Cookies["Login"].Expires = DateTime.Now.AddDays(-1);
        Response.Redirect("~/Trang/NhomToPhuocNguyen_Trangchu.aspx");
    }
    protected void DropMin_TextChanged(object sender, EventArgs e)
    {

        if(IsPostBack)
        {
            DropMax.Items.Clear();
            DropMax.DataBind();
            long n = long.Parse(DropMin.SelectedValue);
            n = n / 100000;
            long[] amount = new long[11 - n];
            int x = 0;
            for (long i = n; i < 11; i++, x++)
                amount[x] = (i) * 100000;
            DropMax.DataSource = amount;
            DropMax.DataBind();
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string tukhoa = TxtTen.Text; ;
        string loaisanpham =  DropLSP.SelectedValue;
        string giadau =  DropMin.SelectedValue;
        string giasau = DropMax.SelectedValue;
        string link = "~/Trang/NhomToPhuocNguyen_Timkiem.aspx?";
        link += "tukhoa=" + tukhoa;
        link += "&loaisanpham=" + loaisanpham;
        link += "&giadau=" + giadau;
        link += "&giasau=" + giasau;
            Response.Redirect(link);
    }
}
