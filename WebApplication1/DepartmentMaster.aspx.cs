using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class DepartmentMaster : System.Web.UI.Page
{
    db dbclass = new db();
    protected void Page_Load(object sender, EventArgs e)
    {
        dbclass.MSSQl_conn();
        getDataInDropBoxCompany();
    }

    public string getSourceData()
    {
        string data = "";
        SqlDataReader sd = dbclass.SelectAll("Department");

        //data += "<tr><td>" + Department ID +  "</td><td>" +  Department Name + "</td><td>" +  Company Name + "</td><td>" + Action + "</td></tr>";

        if(sd.HasRows)
        {
            while(sd.Read())
            {
                string deptId = sd["DeptId"].ToString();
                string deptName = sd["DeptName"].ToString();
                string compId = sd["CompId"].ToString();

                data += "<tr><td>";
                data += deptId;
                data += "</td><td>";
                data += deptName;
                data += "</td><td>";
                data += compId;
                data += "</td><td>";
                data += "<a href='#' data-toggle='modal' data-target='#defaultModal_1'><i class='material-icons'>mode_edit</i></a>";
                data += "&nbsp; <a href='#' data-toggle='modal' data-target='#defaultModal_1'><i class='material-icons'>delete</i></a>";
                data += "</td></tr>";


            }
        }

        return data;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        dbclass.Update("Department", "DeptName", "CompId",  "DeptId", "Ar4e", 3, 1);
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        
        dbclass.insert("Department", "DeptId", "DeptName", "CompId" , TextBoxDeptName.Text, "1");

        TextBoxDeptName.Text = "";
    }

    protected void getDataInDropBoxCompany()
    {
        SqlConnection Cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString);
        string com = "select * from Company";
        SqlDataAdapter adpt = new SqlDataAdapter(com, Cn);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        DropCompany.DataSource = dt;
        DropCompany.DataBind();
        DropCompany.DataTextField = "CompName";
        DropCompany.DataValueField = "CompId";
        DropCompany.DataBind();

    }
}