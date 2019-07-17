using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Diagnostics;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class DepartmentMaster : System.Web.UI.Page
{
    db dbclass = new db();
    protected void Page_Load(object sender, EventArgs e)
    {
        dbclass.MSSQl_conn();


        if (!Page.IsPostBack)
        {
            // getDataInDropBoxCompany();
            // getDataInDropBoxID();
            Delete_data();
            BindCompany();
            BindTicketNo();


        }
    }

    

    protected void Delete_data()
    {
        try
        {
            string get_id = Request.QueryString["delete_id"];
            if (get_id != null)
            {
                dbclass.Delete("Department", "DeptId", get_id);
                Response.Redirect("DepartmentMaster.aspx");
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

        //SqlDataReader sd = dbclass.SelectAll("Department");
        using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand("select D.DeptId,D.DeptName,C.CompName from Department D,Company c where D.CompId=c.CompId", con))
            {

                cmd.Connection.Open();
                using (SqlDataReader sqlrdr = cmd.ExecuteReader())
                {
                    if (sqlrdr.HasRows)
                    {
                        while (sqlrdr.Read())
                        {
                            string deptId = sqlrdr["DeptId"].ToString();
                            string deptName = sqlrdr["DeptName"].ToString();
                            string compId = sqlrdr["CompName"].ToString();

                            data += "<tr><td>";
                            data += deptId;
                            data += "</td><td>";
                            data += deptName;
                            data += "</td><td>";
                            data += compId;
                            data += "</td><td>";
                            data += "<a href='#' data-toggle='modal' data-target='#defaultModal_1'><i class='material-icons'>mode_edit</i></a>";
                            data += "&nbsp; <a  href='javascript:delete_id(" + deptId + ")'><i class='material-icons'>delete</i></a>";
                            data += "</td></tr>";
                        }
                    }
            }
        }
           
        }

        return data;
    }
   

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (ddlCompany1.SelectedItem.Value != "0")
        {
            dbclass.insert("Department", "DeptId", "DeptName", "CompId", TextBoxDeptName.Text, ddlCompany1.SelectedItem.Value);

            TextBoxDeptName.Text = "";
            ddlCompany1.ClearSelection();
        }
    }
    

    protected void ddlId_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select DeptId ,DeptName, CompId from  Department  where DeptId= @Id", con);
            cmd.Parameters.AddWithValue("@Id", ddlId.SelectedValue);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Open();
            cmd.ExecuteNonQuery();
            ddlId.SelectedValue = dt.Rows[0]["DeptId"].ToString();
            TxtDepartment.Text = dt.Rows[0]["DeptName"].ToString();
            ddlCompany.SelectedValue = dt.Rows[0]["CompId"].ToString();
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    private void BindCompany()
    {
        try
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select * from Company", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            SqlDataAdapter sda2 = new SqlDataAdapter(cmd);
            DataTable dt2 = new DataTable();
            sda.Fill(dt2);

            ddlCompany.DataSource = dt;
            ddlCompany.DataTextField = "CompName";
            ddlCompany.DataValueField = "CompId";
            ddlCompany.DataBind();
            ddlCompany.Items.Insert(0, new ListItem("--Select Company--", "0"));

            ddlCompany1.DataSource = dt2;
            ddlCompany1.DataTextField = "CompName";
            ddlCompany1.DataValueField = "CompId";
            ddlCompany1.DataBind();
            ddlCompany1.Items.Insert(0, new ListItem("--Select Company--", "0"));

            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void BindTicketNo()
    {
        try
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select  DeptId from Department ", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddlId.DataSource = dt;
            ddlId.DataTextField = "DeptId";
            ddlId.DataValueField = "DeptId";
            ddlId.DataBind();
            ddlId.Items.Insert(0, new ListItem("--Select Id No.--", "0"));
            con.Close();
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
            SqlConnection Con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = Con;

            cmd.CommandText = "Update Department set DeptName = @DeptName, CompId = @CompId where DeptId = @DeptId";
            cmd.Parameters.AddWithValue("@DeptName", TxtDepartment.Text);
            cmd.Parameters.AddWithValue("@CompId", ddlCompany.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@DeptId", ddlId.SelectedItem.Value);
            //cmd.Parameters.AddWithValue("@DeptId", id);
            Con.Open();
            cmd.ExecuteScalar();

            Con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}

    