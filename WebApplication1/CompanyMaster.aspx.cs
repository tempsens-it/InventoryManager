using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class CompanyMaster : System.Web.UI.Page
{
    db dbcalss = new db();



    protected void Page_Load(object sender, EventArgs e)
    {
        dbcalss.MSSQl_conn();

        if (!Page.IsPostBack)
        {
            Delete_data();

        }
    }

    

    public string getSourceData()
    {
        string data = "";
        SqlDataReader sd = dbcalss.SelectAll("Company");

        //data += "<tr><td>" + Company ID +  "</td><td>" + Name + "</td><td>" + Action + "</td></tr>";

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
                data += "<a href='#' data-toggle='modal' data-target='#defaultModal_1'><i class='material-icons'>mode_edit</i></a>";
                data += "&nbsp; <a  href='javascript:delete_id(" + compId + ")'><i class='material-icons' >delete</i></a>";
                data += "</td></tr>";
                // data += "&nbsp; <a href='#' runat='server' onServerClick='deleteCalling(" + compId + ")'><i class='material-icons'>delete</i></a>"; //call the function deleteCalling(compId) and pass the Company ID
            }
        }
        return data;
    }



    //protected void btnSubmit_Click(object sender, EventArgs e)
    //{
    //    Message.Text = "Update";
    //    dbcalss.Update("Company", "CompName", "CompId", "Ar4e", 1);

    //}

    protected void btnSave_Click(object sender, EventArgs e)
    {
        Message.Text = "Save";

        dbcalss.insert("Company", "CompId", "CompName", TextBoxCompanyName.Text);

        TextBoxCompanyName.Text = "";
    }

    protected void deleteCalling(int compId)
    {
        Message.Text = "Delete";
        dbcalss.Delete("Company", "CompId", compId.ToString());

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection Con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString);

            //DateTime dt = DateTime.Now;
            //String ModifiedOn = "";
            //ModifiedOn = dt.ToString("MM/dd/yyyy hh:mm tt");
            SqlCommand cmd = new SqlCommand("Update Company set CompName = @CompName where CompId = 1", Con);
            cmd.Parameters.AddWithValue("@CompName", TxtCompany.Text);
            //cmd.Parameters.AddWithValue("@CompId", Session["CompId"]);
            Con.Open();
            cmd.ExecuteScalar();
            Con.Close();

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
            //SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString);
            string get_id = Request.QueryString["delete_id"];
            if (get_id != null)
            {
                //SqlCommand cmd = new SqlCommand("Delete from Company where CompId = @compId", Cn);
                //cmd.Parameters.AddWithValue("@compId", get_id);
                //con.Open();
                //cmd.ExecuteNonQuery();
                //con.Close();
                // Response.Redirect("Dashboard_User.aspx");
                dbcalss.Delete("Company", "CompId", get_id);
                Response.Redirect("Dashboard_User.aspx");
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }



}
