using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Collections;
public partial class Trang_NhomToPhuocNguyen_TrangChu : System.Web.UI.Page
{
    private string connStr = ConfigurationManager.ConnectionStrings["csdlToPhuocNguyen"].ToString();

    public DataTable GetAllSanPham()
    {
        using (SqlConnection cnn = new SqlConnection(connStr))
        {
            cnn.Open();
            string sql = "Select * from SanPham";
            SqlCommand cmd = new SqlCommand(sql, cnn);

            DataTable table = new DataTable();
            table.Load(cmd.ExecuteReader());
            cnn.Close();
            return table;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataAdapter adapq;
        adapq = new SqlDataAdapter("select * from SanPham ", connStr);
        DataTable qq = new DataTable();
        adapq.Fill(qq);
        
        DataTable KQ = new DataTable();
        KQ = qq.Clone();
        DataRow[] x;
        x = qq.Select();
        for(int i = 0; i< qq.Rows.Count; i++)
        {
            DataRow row = KQ.NewRow();
            
                row["ID"]=x[i][0].ToString();
                if (x[i][1].ToString().Length>32)
                row["Ten"] = x[i][1].ToString().Substring(0, 32) + "...";
                else
                    row["Ten"] = x[i][1].ToString().Substring(0, x[i][1].ToString().Length-1) + "...";
                row["LuotXem"]=x[i][2].ToString();
                row["Gia"]=x[i][3].ToString();
                row["DaMua"]=x[i][4].ToString();
                row["Anh"]=x[i][5].ToString();
                row["ChiTiet"]=x[i][6].ToString();
                row["ID_LSP"] = x[i][7].ToString();
                KQ.Rows.Add(row);
           
        }
        if(!IsPostBack)
        {
            DataList2.DataSource = KQ;
            DataList2.DataBind();
            pager.DataSource = GetAllSanPham().DefaultView;

            pager.BindToControl = DataList2;

            DataList2.DataSource = pager.DataSourcePaged;
        }
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Trang/NhomToPhuocNguyen_MatHang.aspx?id="+((ImageButton)sender).CommandArgument);
    }
}