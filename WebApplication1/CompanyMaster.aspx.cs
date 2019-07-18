using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class CompanyMaster : System.Web.UI.Page
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

    public string getSourceData()
    {
        string data = "";
        SqlDataReader sd = dbcalss.SelectAll("Company");
        if (sd.HasRows)
        {
            while (sd.Read())
            {
                string compId = sd["CompId"].ToString();
                string compName = sd["CompName"].ToString();

                data += "<tr><td>";
                data += compId;
                data += "</td><td>";
                data += compName;
                data += "</td><td>";
                data += "&nbsp; <a  href='javascript:delete_id(" + compId + ")'><i class='material-icons' >delete</i></a>";
                data += "</td></tr>";
            }
        }
        return data;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        dbcalss.insert("Company", "CompId", "CompName", TextBoxCompanyName.Text);

        TextBoxCompanyName.Text = " ";

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
       
        try
        {
            
            SqlCommand cmd = new SqlCommand("Update Company set CompName = @CompName where CompId = @CompId",dbcalss.Cn);
            cmd.Parameters.AddWithValue("@CompName", TxtCompany.Text);
            cmd.Parameters.AddWithValue("@CompId", ddlId.SelectedItem.Value);
            dbcalss.Cn.Open();
            cmd.ExecuteScalar();
            dbcalss.Cn.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void Delete_data()
    {
        try
        {
            string get_id = Request.QueryString["delete_id"];
            if (get_id != null)
            {
                dbcalss.Delete("Company", "CompId", get_id);
                Response.Redirect("CompanyMaster.aspx");
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void ddlId_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
           
            SqlCommand cmd = new SqlCommand("select CompId, CompName from  Company  where CompId= @Id", dbcalss.Cn);
            cmd.Parameters.AddWithValue("@Id", ddlId.SelectedValue);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            dbcalss.Cn.Open();
            cmd.ExecuteNonQuery();
            ddlId.SelectedValue = dt.Rows[0]["CompId"].ToString();
            TxtCompany.Text = dt.Rows[0]["CompName"].ToString();
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
           
            SqlCommand cmd = new SqlCommand("select  CompId from Company order by CompId ASC", dbcalss.Cn);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddlId.DataSource = dt;
            ddlId.DataTextField = "CompId";
            ddlId.DataValueField = "CompId";
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
