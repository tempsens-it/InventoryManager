using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class ConfigurationalMaster : System.Web.UI.Page
{
    db dbclass = new db();
    protected void Page_Load(object sender, EventArgs e)
    {
        dbclass.MSSQl_conn();
        if (!IsPostBack)
        {
            Delete_data();
            BindSpec1();
            BindSpec2();
            BindSpec3();
            BindPartName();
        }

    }

    public void Delete_data()
    {
        try
        {
            string get_id = Request.QueryString["delete_id"];
            if (get_id != null)
            {
                dbclass.Delete("PartConfig", "PartConfigId", get_id);
                Response.Redirect("ConfigurationalMaster.aspx");
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void BindPartName()
    {
        try
        {

            SqlCommand cmd = new SqlCommand("select PartId,partname from PartMaster", dbclass.Cn);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddlPart.DataSource = dt;
            ddlPart.DataTextField = "partname";
            ddlPart.DataValueField = "PartId";
            ddlPart.DataBind();
            ddlPart.Items.Insert(0, new ListItem("--Select PartName--", "0"));
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
        SqlCommand cmd = new SqlCommand("select PC.PartConfigId ,P.PartName,PC.Spec1,PC.Spec2,PC.Spec3,PC.Description from PartConfig PC,PartMaster P where P.PartId=PC.PartId", dbclass.Cn);
        dbclass.Cn.Open();
        SqlDataReader sd = cmd.ExecuteReader();
        if (sd.HasRows)
        {
            while (sd.Read())
            {
                string partConfigId = sd["PartConfigId"].ToString();
                string partName = sd["PartName"].ToString();
                string spec1 = sd["Spec1"].ToString();
                string spec2 = sd["Spec2"].ToString();
                string spec3 = sd["Spec3"].ToString();
                string desc = sd["Description"].ToString();

                data += "<tr><td>";
                data += partConfigId;
                data += "</td><td>";
                data += partName;
                data += "</td><td>";
                data += spec1;
                data += "</td><td>";
                data += spec2;
                data += "</td><td>";
                data += spec3;
                data += "</td><td>";
                data += desc;
                data += "</td><td>";
                data += "&nbsp; <a href='javascript:delete_id(" + partConfigId + ")'><i class='material-icons'>delete</i></a>";
                data += "</td></tr>";

            }


        }
        //data += "<a href='#' data-toggle='modal' data-target='#defaultModal_1'><i class='material-icons'>mode_edit</i></a>";
        dbclass.Cn.Close();

        return data;
    }
    
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        //dbclass.insertPartConfig("PartId", "Spec1", "Spec2", "Spec3","Description", ddlPart.SelectedItem.Value, ddlSpec1.SelectedItem.Value, ddlSpec2.SelectedItem.Value, ddlSpec3.SelectedItem.Value,txtDesc2.Text);
        dbclass.insertPartConfig(ddlPart.SelectedIndex,ddlSpec1.SelectedItem.Value,ddlSpec2.SelectedItem.Value,ddlSpec3.SelectedItem.Value,txtDesc2.Text);

        ddlPart.SelectedIndex = 0;
        txtDesc2.Text = null;
        ddlSpec1.SelectedIndex = 0;
        ddlSpec2.SelectedIndex = 0;
        ddlSpec3.SelectedIndex = 0;
        

    }

    private void BindSpec1()
    {
        try
        {

            SqlCommand cmd = new SqlCommand("select spec1 from PartConfig order by spec1 ASC", dbclass.Cn);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddlSpec1.DataSource = dt;
            ddlSpec1.DataTextField = "spec1";
            ddlSpec1.DataValueField = "spec1";
            ddlSpec1.DataBind();
            ddlSpec1.Items.Insert(0, new ListItem("--Select Id No.--", "0"));
            dbclass.Cn.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void BindSpec2()
    {
        try
        {

            SqlCommand cmd = new SqlCommand("select spec2 from PartConfig order by spec2 ASC", dbclass.Cn);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddlSpec2.DataSource = dt;
            ddlSpec2.DataTextField = "spec2";
            ddlSpec2.DataValueField = "spec2";
            ddlSpec2.DataBind();
            ddlSpec2.Items.Insert(0, new ListItem("--Select Id No.--", "0"));
            dbclass.Cn.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void BindSpec3()
    {
        try
        {

            SqlCommand cmd = new SqlCommand("select spec3 from PartConfig order by spec3 ASC", dbclass.Cn);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddlSpec3.DataSource = dt;
            ddlSpec3.DataTextField = "spec3";
            ddlSpec3.DataValueField = "spec3";
            ddlSpec3.DataBind();
            ddlSpec3.Items.Insert(0, new ListItem("--Select Id No.--", "0"));
            dbclass.Cn.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    

}