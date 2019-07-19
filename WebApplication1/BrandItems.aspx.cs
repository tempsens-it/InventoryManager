using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class BrandItems : System.Web.UI.Page
{
    db dbcalss = new db();
    protected void Page_Load(object sender, EventArgs e)
    {
        dbcalss.MSSQl_conn();
        if (!Page.IsPostBack)
        {
            Delete_data();
            BindID();
        }
    }

    public void Delete_data()
    {
        try
        {
            string get_id = Request.QueryString["delete_id"];
            if (get_id != null)
            {
                dbcalss.Delete("Brand", "BrandId", get_id);
                Response.Redirect("BrandItems.aspx");
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public string getSourceData()
    {
        string data = "";
        SqlDataReader sd = dbcalss.SelectAll("Brand");
        if (sd.HasRows)
        {
            while (sd.Read())
            {
                string BrandId = sd["BrandId"].ToString();
                string BrandName = sd["BrandName"].ToString();

                data += "<tr><td>";
                data += BrandId;
                data += "</td><td>";
                data += BrandName;
                data += "</td><td>";
                data += "&nbsp; <a  href='javascript:delete_id(" + BrandId + ")'><i class='material-icons' >delete</i></a>";
                data += "</td></tr>";
            }
        }
        return data;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        dbcalss.insert("Brand", "BrandId", "BrandName", txtBrandName.Text);

        txtBrandName.Text = " ";

    }

    protected void ddlId_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {

            SqlCommand cmd = new SqlCommand("select BrandId, BrandName from  Brand  where BrandId= @Id", dbcalss.Cn);
            cmd.Parameters.AddWithValue("@Id", ddlId.SelectedValue);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            dbcalss.Cn.Open();
            cmd.ExecuteNonQuery();
            ddlId.SelectedValue = dt.Rows[0]["BrandId"].ToString();
            TxtBrand.Text = dt.Rows[0]["BrandName"].ToString();
            dbcalss.Cn.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {

            SqlCommand cmd = new SqlCommand("Update Brand set BrandName = @BrandName where BrandId = @BrandId", dbcalss.Cn);
            cmd.Parameters.AddWithValue("@BrandName", TxtBrand.Text);
            cmd.Parameters.AddWithValue("@BrandId", ddlId.SelectedItem.Value);
            dbcalss.Cn.Open();
            cmd.ExecuteScalar();
            dbcalss.Cn.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void BindID()
    {
        try
        {

            SqlCommand cmd = new SqlCommand("select  BrandId from Brand order by BrandId ASC", dbcalss.Cn);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddlId.DataSource = dt;
            ddlId.DataTextField = "BrandId";
            ddlId.DataValueField = "BrandId";
            ddlId.DataBind();
            ddlId.Items.Insert(0, new ListItem("--Select Id--", "0"));
            dbcalss.Cn.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}