using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EmployeeMaster : System.Web.UI.Page
{
    db dbclass = new db();

    protected void Page_Load(object sender, EventArgs e)
    {
        dbclass.MSSQl_conn();
        if (!Page.IsPostBack)
        {
            getDataInDropBoxCompany();
            Delete_data();
        }
    }

    public string getSourceData()
    {
        string data = "";
        SqlDataReader sd = dbclass.SelectAll("Employee");

        //data += "<tr><td>" + Company ID +  "</td><td>" + Name + "</td><td>" + Action + "</td></tr>";

        if (sd.HasRows)
        {
            while (sd.Read())
            {
                string empId = sd["EmpId"].ToString();
                string empName = sd["EmpName"].ToString();
                string deptId = sd["DeptId"].ToString();
                string compId = sd["CompId"].ToString();
                bool active = Convert.ToBoolean(sd["IsActive"]);
                string desig = sd["Desig"].ToString();
                string mobileNum = sd["MobileNum"].ToString();
                string intEmail = sd["Email_Int"].ToString();
                string extEmail = sd["Email_Ext"].ToString();

                data += "<tr><td>";
                data += empId;
                data += "</td><td>";
                data += empName;
                data += "</td><td>";
                data += desig;
                data += "</td><td>";
                data += returnName(deptId, "Department", "DeptName");
                 data += "</td><td>";
                data += returnName(compId, "Company", "CompName");
                data += "</td><td>";
                data += mobileNum;
                data += "</td><td>";
                data += intEmail;
                data += "</td><td>";
                data += extEmail;
                data += "</td><td>";
                data += active;
                data += "</td><td>";
                data += "<a href='#' data-toggle='modal' data-target='#defaultModal_1'><i class='material-icons'>mode_edit</i></a>";
                data += "&nbsp; <a href='javascript:delete_id(" + empId + ")'><i class='material-icons'>delete</i></a>";
                data += "</td></tr>";
            }
        }

        return data;
    }



    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //dbclass.Update("Company", "CompName", "CompId", TxtCompany.Text, 1);
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (CheckBoxActive1.Checked)
        {
            dbclass.insertEmp(TextBoxName.Text, TextBoxContact2.Text, DropDepartment2.SelectedItem.Value, DropCompany2.SelectedItem.Value, 1, TextBoxDesignation2.Text, TextBoxIntMail2.Text, TextBoxExtMail2.Text);

            TextBoxContact2.Text = "";
            TextBoxDesignation2.Text = "";
            TextBoxExtMail2.Text = "";
            TextBoxIntMail2.Text = "";
            TextBoxName.Text = "";
            DropCompany2.ClearSelection();
            DropDepartment2.ClearSelection();
            CheckBoxActive1.Checked = false;

        }
        else
        {
            dbclass.insertEmp(TextBoxName.Text, TextBoxContact2.Text, DropDepartment2.SelectedItem.Value, DropCompany2.SelectedItem.Value, 0, TextBoxDesignation2.Text, TextBoxIntMail2.Text, TextBoxExtMail2.Text);

            TextBoxContact2.Text = "";
            TextBoxDesignation2.Text = "";
            TextBoxExtMail2.Text = "";
            TextBoxIntMail2.Text = "";
            TextBoxName.Text = "";
            DropCompany2.ClearSelection();
            DropDepartment2.ClearSelection();
            CheckBoxActive1.Checked = false;
        }

        //dbclass.insert("Company", "CompId", "CompName", TextBoxCompanyName.Text);
        //dbclass.insertEmp(TextBoxName.Text, TextBoxContact2.Text, DropDepartment2.SelectedItem.Value, DropCompany2.SelectedItem.Value, Convert.ToBoolean(CheckBoxActive1), TextBoxDesignation2.Text, TextBoxIntMail2.Text, TextBoxExtMail2.Text);


    }

    protected void getDataInDropBoxCompany()
    {
        SqlConnection Cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString);
        string com = "select * from Company";
        string com2 = "select * from Department";
        SqlDataAdapter adpt = new SqlDataAdapter(com, Cn);
        SqlDataAdapter adpt2 = new SqlDataAdapter(com2, Cn);
        DataTable dt = new DataTable();
        adpt.Fill(dt);

        //For edit tab
        DropCompany.DataSource = dt;
        DropCompany.DataBind();
        DropCompany.DataTextField = "CompName";
        DropCompany.DataValueField = "CompId";
        DropCompany.DataBind();

        //for add Tab
        DropCompany2.DataSource = dt;
        DropCompany2.DataBind();
        DropCompany2.DataTextField = "CompName";
        DropCompany2.DataValueField = "CompId";
        DropCompany2.DataBind();

        DataTable dt2 = new DataTable();
        adpt2.Fill(dt2);

        //For edit tab
        DropDepartment.DataSource = dt2;
        DropDepartment.DataBind();
        DropDepartment.DataTextField = "DeptName";
        DropDepartment.DataValueField = "DeptId";
        DropDepartment.DataBind();

        //for add Tab
        DropDepartment2.DataSource = dt2;
        DropDepartment2.DataBind();
        DropDepartment2.DataTextField = "DeptName";
        DropDepartment2.DataValueField = "DeptId";
        DropDepartment2.DataBind();

        ListItem liCompany = new ListItem("Select a Company", "-1");
        DropCompany2.Items.Insert(0, liCompany);
        DropCompany.Items.Insert(0, liCompany);

        ListItem liDepartment = new ListItem("Select a Department", "-1");
        DropDepartment.Items.Insert(0, liCompany);
        DropDepartment2.Items.Insert(0, liCompany);

        
    }

    protected string returnName(string id, string tableName, string colName)
    {
        String compName = "";

        try
        {
            SqlConnection Cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString);
            Cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = Cn;
            cmd.CommandText = "Select " + colName + " from " + tableName + " where CompId =" + id;
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                compName = dr[colName].ToString();
            }
            Cn.Close();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        return compName;
    }

    protected void Delete_data()
    {
        try
        {
            string get_id = Request.QueryString["delete_id"];
            if (get_id != null)
            {
                dbclass.Delete("Employee", "EmpId", get_id);
                Response.Redirect("EmployeeMaster.aspx");
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}