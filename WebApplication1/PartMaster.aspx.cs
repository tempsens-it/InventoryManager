using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PartMaster : System.Web.UI.Page
{
    db dbclass = new db();


    protected void Page_Load(object sender, EventArgs e)
    {
        dbclass.MSSQl_conn();
        if (!IsPostBack)
        {
            Delete_data();
            BindId();
            BindCategory();

        }

    }

    public void Delete_data()
    {
        try
        {
            string get_id = Request.QueryString["delete_id"];
            if (get_id != null)
            {
                dbclass.Delete("PartMaster", "PartId", get_id);
                Response.Redirect("PartMaster.aspx");
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void BindId()
    {
        try
        {

            SqlCommand cmd = new SqlCommand("select PartId from PartMaster order by PartId ASC", dbclass.Cn);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddlId.DataSource = dt;
            ddlId.DataTextField = "PartId";
            ddlId.DataValueField = "PartId";
            ddlId.DataBind();
            ddlId.Items.Insert(0, new ListItem("--Select Id No.--", "0"));
            dbclass.Cn.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public string getSourceData()
    {
        string data = "";
        SqlCommand cmd = new SqlCommand("select P.PartId, P.PartName, C.CatName, P.Description from PartMaster P,Category C where P.CatId=C.CatId", dbclass.Cn);
        dbclass.Cn.Open();
        SqlDataReader sd = cmd.ExecuteReader();
        if (sd.HasRows)
        {
            while (sd.Read())
            {
                string partId = sd["PartId"].ToString();
                string partName = sd["PartName"].ToString();
                string catId = sd["CatName"].ToString();
                string desc = sd["Description"].ToString();

                data += "<tr><td>";
                data += partId;
                data += "</td><td>";
                data += partName;
                data += "</td><td>";
                data += catId;
                data += "</td><td>";
                data += desc;
                data += "</td><td>";
                //data += "<a href='#' data-toggle='modal' data-target='#defaultModal_1'><i class='material-icons'>mode_edit</i></a>";
                data += "&nbsp; <a href='javascript:delete_id(" + partId + ")'><i class='material-icons'>delete</i></a>";
                data += "</td></tr>";
            }
        }
        dbclass.Cn.Close();
        return data;
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        dbclass.UpdatePartMaster(tbPartName.Text, tbDesc.Text, Convert.ToInt32(ddlCategory.SelectedItem.Value), Convert.ToInt32(ddlId.SelectedItem.Value));

        tbPartName.Text = null;
        tbDesc.Text = null;
        ddlCategory.SelectedIndex = 0;
        ddlId.SelectedIndex = 0;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        dbclass.insertPartMaster(tbPartName2.Text, tbDesc2.Text, Convert.ToInt32(ddlCategory2.SelectedItem.Value));

        tbPartName2.Text = null;
        tbDesc2.Text = null;
        ddlCategory2.SelectedIndex = 0;
    }

    protected void ddlId_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("select * from PartMaster where PartId= @Id", dbclass.Cn);
            cmd.Parameters.AddWithValue("@Id", ddlId.SelectedValue);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            dbclass.Cn.Open();
            cmd.ExecuteNonQuery();
            ddlId.SelectedValue = dt.Rows[0]["PartId"].ToString();
            tbPartName.Text = dt.Rows[0]["PartName"].ToString();
            tbDesc.Text = dt.Rows[0]["Description"].ToString();
            ddlCategory.SelectedValue = dt.Rows[0]["CatId"].ToString();
            dbclass.Cn.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void BindCategory()
    {
        try
        {

            SqlCommand cmd = new SqlCommand("select CatId,CatName from Category order by CatId ASC", dbclass.Cn);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddlCategory.DataSource = dt;
            ddlCategory.DataTextField = "CatName";
            ddlCategory.DataValueField = "CatId";
            ddlCategory.DataBind();
            ddlCategory.Items.Insert(0, new ListItem("--Select Category--", "0"));

            ddlCategory2.DataSource = dt;
            ddlCategory2.DataTextField = "CatName";
            ddlCategory2.DataValueField = "CatId";
            ddlCategory2.DataBind();
            ddlCategory2.Items.Insert(0, new ListItem("--Select Category--", "0"));

            dbclass.Cn.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


}