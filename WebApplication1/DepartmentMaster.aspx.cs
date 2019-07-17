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
            getDataInDropBoxCompany();
            getDataInDropBoxID();
            Delete_data();


        }
    }

    private string getDataById(string tableName, string colName, string idColName, string get_id)
    {
        string data = "";
        try
        {
            SqlConnection Cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString);
            Cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = Cn;
            cmd.CommandText = "Select " + colName + " from " + tableName + " where " + idColName + " = " + get_id;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
                data = dr[colName].ToString();
            Cn.Close();
        }
        catch (Exception ex) { Console.Write(ex.Message); }
        return data;


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
        SqlDataReader sd = dbclass.SelectAll("Department");

        //data += "<tr><td>" + Department ID +  "</td><td>" +  Department Name + "</td><td>" +  Company Name + "</td><td>" + Action + "</td></tr>";

        if (sd.HasRows)
        {
            while (sd.Read())
            {
                string deptId = sd["DeptId"].ToString();
                string deptName = sd["DeptName"].ToString();
                string compId = sd["CompId"].ToString();

                data += "<tr><td>";
                data += deptId;
                data += "</td><td>";
                data += deptName;
                data += "</td><td>";
                data += returnName(compId);
                data += "</td><td>";

                // data += "<a href='#' data-toggle='modal' data-target='#defaultModal_1'><i class='material-icons'>mode_edit</i></a>";
                //data += "<a onclick='edit(" + deptId + ")' runat='server' data-toggle='modal' data-target='#defaultModal_1'><i class='material-icons'>edit</i></a>";

                data += "<a href='#' data-toggle='modal' data-target='#defaultModal_1'><i class='material-icons'>mode_edit</i></a>";
                data += "&nbsp; <a  href='javascript:delete_id(" + deptId + ")'><i class='material-icons'>delete</i></a>";
                data += "</td></tr>";
            }
        }

        return data;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //string id = Edit_data();
        if (DropCompany.SelectedItem.Value != "-1")
        {
            try
            {
                SqlConnection Con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString);
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = Con;

                cmd.CommandText = "Update Department set DeptName = @DeptName, CompId = @CompId where DeptId = @DeptId";
                cmd.Parameters.AddWithValue("@DeptName", TxtDepartment.Text);
                cmd.Parameters.AddWithValue("@CompId", DropCompany.SelectedItem.Value);
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
        else
        {

        }
        TxtDepartment.Text = " ";
        DropCompany.ClearSelection();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (DropCompany1.SelectedItem.Value != "-1")
        {
            dbclass.insert("Department", "DeptId", "DeptName", "CompId", TextBoxDeptName.Text, DropCompany1.SelectedItem.Value);

            TextBoxDeptName.Text = "";
            DropCompany1.ClearSelection();
        }
    }

    protected void getDataInDropBoxCompany()
    {
        SqlConnection Cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString);
        string com = "select * from Company";
        SqlDataAdapter adpt = new SqlDataAdapter(com, Cn);
        DataTable dt = new DataTable();
        adpt.Fill(dt);

        //For edit tab
        DropCompany.DataSource = dt;
        DropCompany.DataBind();
        DropCompany.DataTextField = "CompName";
        DropCompany.DataValueField = "CompId";
        DropCompany.DataBind();

        //for add Tab
        DropCompany1.DataSource = dt;
        DropCompany1.DataBind();
        DropCompany1.DataTextField = "CompName";
        DropCompany1.DataValueField = "CompId";
        DropCompany1.DataBind();

        ListItem liCompany = new ListItem("Select a Company", "-1");
        DropCompany1.Items.Insert(0, liCompany);
        DropCompany.Items.Insert(0, liCompany);
    }

    protected void getDataInDropBoxID()
    {
        SqlConnection Cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString);
        string com = "select * from Department";
        SqlDataAdapter adpt = new SqlDataAdapter(com, Cn);
        DataTable dt = new DataTable();
        adpt.Fill(dt);

        ddlId.DataSource = dt;
        ddlId.DataTextField = "DeptId";
        ddlId.DataValueField = "DeptId";
        ddlId.DataBind();


        ListItem liId = new ListItem("Select an ID", "-1");
        ddlId.Items.Insert(0, liId);


    }

    protected string returnName(string compId)
    {
        String compName = "";

        try
        {
            SqlConnection Cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString);
            Cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = Cn;
            cmd.CommandText = "Select CompName from Company where CompId =" + compId;
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                compName = dr["CompName"].ToString();
            }
            Cn.Close();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        return compName;
    }


    protected void ddlId_SelectedIndexChanged(object sender, EventArgs e)
    {

        Response.Write("<script>alert('message') </script>");
        try
        {
            SqlConnection Cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString);

            SqlCommand cmd = new SqlCommand("Select DeptName from Department where DeptId = @id", Cn);
            cmd.Parameters.AddWithValue("@id", ddlId.SelectedValue);
            SqlDataAdapter dept = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            dept.Fill(dt);

            SqlCommand cmd2 = new SqlCommand("Select CompId from Department where DeptId = @id", Cn);
            cmd2.Parameters.AddWithValue("@id", ddlId.SelectedValue);
            SqlDataAdapter comp = new SqlDataAdapter(cmd2);
            DataTable dt2 = new DataTable();
            comp.Fill(dt2);
            Cn.Open();
            cmd.ExecuteNonQuery();
            cmd2.ExecuteNonQuery();
            TxtDepartment.Text = dt.Rows[0]["DeptName"].ToString();
            string compId = dt2.Rows[0]["CompId"].ToString();

            SqlCommand cmd3 = new SqlCommand("Select CompName from Company where CompId = @id", Cn);
            cmd3.Parameters.AddWithValue("@id", compId);
            SqlDataAdapter compName = new SqlDataAdapter(cmd3);
            DataTable dt3 = new DataTable();
            compName.Fill(dt3);
            cmd3.ExecuteNonQuery();
            //ddlId.SelectedValue = dt3.Rows[0]["CompName"].ToString();
            //ddlId.Items.FindByValue(dt3.Rows[0]["CompName"].ToString()).Selected = true;
            ddlId.DataValueField = compId;
            ddlId.DataTextField = dt3.Rows[0]["CompName"].ToString();
            Cn.Close();

            //TxtDepartment.Text = getDataById("Department", "DeptName", "DeptId", get_id);
            //string comp = getDataById("Department", "CompId", "DeptId", get_id);
            //DropCompany.Items.FindByValue(comp).Selected = true;
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
    }
}