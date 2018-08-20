using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Trang_NhomToPhuocNguyen_Dangky : System.Web.UI.Page
{
    private string connStr = ConfigurationManager.ConnectionStrings["csdlToPhuocNguyen"].ToString();
    string GT;
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    public void Taotaikhoan(string User, string Pass, string Ho, string Ten, string GT, string DC, string SDT, string Email, string Anh)
    {
        SqlConnection connDB = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("TaoND", connDB);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@Username", SqlDbType.NVarChar).Value = User;
        cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = Pass;
        cmd.Parameters.Add("@Ho", SqlDbType.NVarChar).Value = Ho;
        cmd.Parameters.Add("@ten", SqlDbType.NVarChar).Value = Ten;
        cmd.Parameters.Add("@GT", SqlDbType.NVarChar).Value = GT;
        cmd.Parameters.Add("@DC", SqlDbType.NVarChar).Value = DC;
        cmd.Parameters.Add("@SDT", SqlDbType.NVarChar).Value = SDT;
        cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = Email;
        cmd.Parameters.Add("@Anh", SqlDbType.NVarChar).Value = Anh;
        cmd.Parameters.Add("@QuyenTruyCap", SqlDbType.NVarChar).Value = "1";
        connDB.Open();
        cmd.ExecuteNonQuery();
        connDB.Close();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        try
        {
            
            if(RNam.Checked){
                GT = RNam.Text;
            }
            if(RNu.Checked){
                GT = RNu.Text;
            }
            string TenFile = "";
            string DuongDan = "";
            if (FileAnh.HasFile)
            {
                TenFile = FileAnh.FileName;
                DuongDan = Server.MapPath("~/css/images/");
                FileAnh.SaveAs(DuongDan + TenFile);
            }

            Taotaikhoan(TxtUser.Text, TxtPass.Text, TxtHo.Text, TxtTen.Text, GT, TxtDC.Text, TxtSDT.Text, TxtEmail.Text, "~/NhomNguyenNhuY_Anh/" + TenFile);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "TaoTaiKhoanThanhCong", "TaoTaiKhoanThanhCong()", true);
        
        }
        catch
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "TaoTaiKhoanThatBai", "TaoTaiKhoanThatBai()", true);
        }
    }
}