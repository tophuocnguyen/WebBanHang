using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Trang_NhomToPhuocNguyen_MuaHang : System.Web.UI.Page
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
        DataHienthi.DataSource = ds;
        DataHienthi.DataBind();
        LbTong.Text = tongTien.ToString();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        int flag = 0;

        if (Request.Cookies["Max"] != null)
        {
            //string User, Pass;
            //User = Server.HtmlEncode(Request.Cookies["Login"]["User"]);
            //Pass = Server.HtmlEncode(Request.Cookies["Login"]["Password"]);
            if ((Request.Cookies["Login"] == null) || (Request.Cookies["Login"] != null && kiemTraThongTinDangNhap(Server.HtmlEncode(Request.Cookies["Login"]["User"]), Server.HtmlEncode(Request.Cookies["Login"]["Password"])) > 0))
            {
                flag = 1;
                //do some thing
                Fill_DataTable();
                if (!IsPostBack)
                {
                    DropSP.DataSource = ds;
                    DropSP.DataTextField = "TenSP";
                    DropSP.DataValueField = "IDSP";
                    DropSP.DataBind();
                }
            }
        }
        //
        if (flag == 0)
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Rỗng", "returnHome()", true);
    }
    protected void ImgUpdate_Click(object sender, ImageClickEventArgs e)
    {
        string id = DropSP.SelectedValue;
        int n = Int16.Parse(Server.HtmlEncode(Request.Cookies["Max"]["i"]));
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
                    Response.Cookies[i.ToString()]["Amount"] = TxtSL.Text;
                    Response.Cookies[i.ToString()].Expires = DateTime.Now.AddDays(15);
                    break;
                }
            }
        }
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Update thành công", "UpdateThanhCong()", true);
    }
    protected void ImgDelete_Click(object sender, ImageClickEventArgs e)
    {
        string id = DropSP.SelectedValue;
        int n = Int16.Parse(Server.HtmlEncode(Request.Cookies["Max"]["i"]));
        for (int i = 1; i <= n; i++)
        {
            if ((Request.Cookies[i.ToString()] != null))
            {
                string istring;
                istring = Server.HtmlEncode(Request.Cookies[i.ToString()]["ID"]);
                if (istring == id)
                {
                    //ko quan tam may ten j
                    Response.Cookies[i.ToString()].Expires = DateTime.Now.AddDays(-1);
                    break;
                }
            }
        }
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Xóa thành công", "XoaThanhCong()", true);
    }
    public void TaoHD(string UserID)
    {
        SqlConnection connDB = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("TaoHD", connDB);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@ID_NguoiDung", SqlDbType.NVarChar).Value = UserID;
        connDB.Open();
        cmd.ExecuteNonQuery();
        connDB.Close();
    }

    public void TaochitietHD(string IDHD, string ProductID, string Amount)
    {
        SqlConnection connDB = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("TaoChiTietHD", connDB);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@ID_HD", SqlDbType.NVarChar).Value = IDHD;
        cmd.Parameters.Add("@ID_SP", SqlDbType.NVarChar).Value = ProductID;
        cmd.Parameters.Add("@SL", SqlDbType.NVarChar).Value = Amount;
        connDB.Open();
        cmd.ExecuteNonQuery();
        connDB.Close();
    }
    public DataTable MaxCart()
    {
        SqlDataAdapter b = new SqlDataAdapter("MaxHD", connStr);
        DataTable a = new DataTable();
        b.Fill(a);
        return a;
    }
    protected void BtnThanhtoan_Click(object sender, EventArgs e)
    {
        try
        {
            string User = Server.HtmlEncode(Request.Cookies["Login"]["User"]);
            TaoHD(User);
            //////////////////////////////////////////////////////////////////////
            DataTable x = new DataTable();
            x = MaxCart();
            DataRow[] foundRows = x.Select();
            string IDHD = foundRows[0][0].ToString().ToString();
            //////////////////////////////////////////////////////////////////

            //////////////////////////////////////////////////////////////////
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
                    TaochitietHD(IDHD, ID, Amount);
                }
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "DatHangThanhCong", "DatHangThanhCong()", true);
        }
        catch
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "BanChuaDangNhap", "BanChuaDangNhap()", true);
        }
        }
}