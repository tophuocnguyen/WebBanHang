using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Trang_NhomToPhuocNguyen_HoTro : System.Web.UI.Page
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
        if (Request.Cookies["Login"] != null)
        {
            string User, Pass;
            User = Server.HtmlEncode(Request.Cookies["Login"]["User"]);
            Pass = Server.HtmlEncode(Request.Cookies["Login"]["Password"]);
            if (kiemTraThongTinDangNhap(User, Pass) > 0)
            {
                //
                SqlDataAdapter adap = new SqlDataAdapter("NguoiDung_Select " + User + "," + Pass, connStr);
                DataTable dtmp = new DataTable();
                adap.Fill(dtmp);
                DataRow[] foundRows;
                foundRows = dtmp.Select();
                TxtHo.Text = foundRows[0][0].ToString();
                TxtTen.Text = foundRows[0][1].ToString();
                Label1.Text = foundRows[0][2].ToString();
                TxtDC.Text = foundRows[0][3].ToString();
                TxtDT.Text = foundRows[0][4].ToString();
                TxtEmail.Text = foundRows[0][5].ToString();

                if (Label1.Text == "Nam")
                {
                    RNam.Checked = true;
                }
                else
                    RNu.Checked = true;

                //   FullName,Sex,Know,SuccessTimes,Visit,Email,Job,Comment,Pleased 

            }

        }
    }
    public void PhanHoi_Them(string Ho, string Ten, string GT, string NGT, string DC, string SDT, string Email, string NhanXet, string Hailong)
    {
        SqlConnection connDB = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("PhanHoi_Them", connDB);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@Ho", SqlDbType.NVarChar).Value = Ho;
        cmd.Parameters.Add("@Ten", SqlDbType.NVarChar).Value = Ten;
        cmd.Parameters.Add("@GT", SqlDbType.NVarChar).Value = GT;
        cmd.Parameters.Add("@NGT", SqlDbType.NVarChar).Value = NGT;        
        cmd.Parameters.Add("@DC", SqlDbType.NVarChar).Value = DC;
        cmd.Parameters.Add("@SDT", SqlDbType.NVarChar).Value = SDT;
        cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = Email;
        cmd.Parameters.Add("@NhanXet", SqlDbType.NVarChar).Value = NhanXet;
        cmd.Parameters.Add("@HaiLong", SqlDbType.NVarChar).Value = Hailong;
        connDB.Open();
        cmd.ExecuteNonQuery();
        connDB.Close();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {

        string GT;
        if (RNam.Checked == true)
        {
            GT = RNam.Text;
        }
        else
            GT = RNu.Text;

        if (TxtHo.Text.Length == 0 || TxtTen.Text.Length == 0 || TxtEmail.Text.Length == 0 || TxtNX.Text.Length == 0)
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Loi", "Loi()", true);
        else
        {
            PhanHoi_Them(TxtHo.Text, TxtTen.Text , GT, TxtNGT.Text, TxtDC.Text, TxtDT.Text, TxtEmail.Text, TxtNX.Text, RadioButtonList1.SelectedValue);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "GuiPhanHoiThanhCong", "GuiPhanHoiThanhCong()", true);
        }
    }
}