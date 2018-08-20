using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

public partial class Trang_NhomToPhuocNguyen_Laylaimatkhau : System.Web.UI.Page
{
    private string connStr = ConfigurationManager.ConnectionStrings["csdlToPhuocNguyen"].ToString();
    int KiemTraThongtin(string Username, string Email)
    {
        try
        {
            SqlDataAdapter adapq;
            string proc = "select u.Email from NguoiDung as u where u.Username='" + Username + "' and u.Email='" + Email + "'";
            adapq = new SqlDataAdapter(proc, connStr);
            DataTable qq = new DataTable();
            adapq.Fill(qq);
            DataRow[] foundRows;
            foundRows = qq.Select();
            string E = foundRows[0][0].ToString();
            if (E.Length == Email.Length)
                return 1;
        }
        catch
        {
            return -1;
        }
        return -1;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["Login"] != null)
            Response.Redirect("~/Trang/NhomToPhuocNguyen_TrangChu.aspx");
    }
    string PopulateBody(string user, string pass)
    {
        string body = string.Empty;
        using (StreamReader reader = new StreamReader(Server.MapPath("~/EmailTemplate.htm")))
        {
            body = reader.ReadToEnd();
        }
        body = body.Replace("{user}", user);
        body = body.Replace("{pass}", pass);
        return body;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        if (KiemTraThongtin(TxtU.Text, TxtEmail.Text) == 1)
        {
            try
            {
                SqlDataAdapter adapq;
                string proc = "select u.Password from NguoiDung as u where u.Username='" + TxtU.Text + "' and u.Email='" + TxtEmail.Text + "'";
                adapq = new SqlDataAdapter(proc, connStr);
                DataTable qq = new DataTable();
                adapq.Fill(qq);
                DataRow[] foundRows;
                foundRows = qq.Select();
                string Password = foundRows[0][0].ToString();
                using (MailMessage mailMessage = new MailMessage())
                {
                    mailMessage.From = new MailAddress("tophuocnguyenntu@gmail.com");
                    mailMessage.Subject = "Khôi phục mật khẩu tài khoản người dùng shop Nguyên Fashion";
                    mailMessage.Body = PopulateBody(TxtU.Text,Password);
                    mailMessage.IsBodyHtml = true;
                    mailMessage.To.Add(new MailAddress(TxtEmail.Text));
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.EnableSsl = true;
                    System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
                    NetworkCred.UserName = "tophuocnguyenntu@gmail.com";
                    NetworkCred.Password = "knight12";
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = NetworkCred;
                    smtp.Port = 587;
                    smtp.Send(mailMessage);
                }
                Page.ClientScript.RegisterStartupScript(this.GetType(), "", "ThanhCong()", true);
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "", "LoiMang()", true);
            }
        }
        else
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "Loi()", true);

    }
    }
