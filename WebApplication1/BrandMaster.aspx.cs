using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BrandMaster : System.Web.UI.Page
{
    db dbclass = new db();
    protected void Page_Load(object sender, EventArgs e)
    {
        Message.Text = "OnLOad";

        if (!Page.IsPostBack)
        {
            Delete_data();
           

        }
    }

    public string getSourceData()
    {
        string data = "";
        SqlDataReader sd = dbclass.SelectAll("Brand");

        if (sd.HasRows)
        {
            while (sd.Read())
            {
                string brandId = sd["BrandId"].ToString();
                string brandName = sd["BrandName"].ToString();

                data += "<tr>";
                data += "<td>" + brandId + "</td>";
                data += "<td>" + brandName + "</td>";
                data += "<td>";
                //data += "<a href='#' data-toggle='modal' data-target='#defaultModal_1'><i class='material-icons'>mode_edit</i></a>";
                data += "&nbsp; <a href='javaScript:delete_id(" + brandId + ")'> <i class='material-icons'>delete</i></a>";
                data += "</td></tr>";
            }

        }
        return data;
    }



    protected void btnUpdate(object sender, EventArgs e)
    {
        //dbclass.Update("Brand", "BrandName", "BrandId", "A", 1);
        Message.Text = "Update";

    }


    protected void btnSave(object sender, EventArgs e)
    {
        //dbclass.insert("Brand", "BrandName", TxtBrand.Text);
        Message.Text = "btnsave";
    }

    protected void save(object obj, EventArgs e)
    {
        Message.Text = " save";

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Message.Text = "Extra butoon";
    }

    protected void Delete_data()
    {
        try
        {
            string get_id = Request.QueryString["delete_id"];
            if (get_id != null)
            {
                dbclass.Delete("Brand", "BrandId", get_id);
                Response.Redirect("BrandMaster.aspx");
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
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select BrandId ,BrandName from  Brand  where BrandId= @Id", con);
            cmd.Parameters.AddWithValue("@Id", ddlId.SelectedValue);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Open();
            cmd.ExecuteNonQuery();
            ddlId.SelectedValue = dt.Rows[0]["BrandId"].ToString();
            TxtBrand.Text = dt.Rows[0]["BrandName"].ToString();
            //ddlCompany.SelectedValue = dt.Rows[0]["CompId"].ToString();
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

}