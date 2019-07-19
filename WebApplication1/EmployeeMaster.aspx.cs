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
            BindId();
            BindCompany();
            Delete_data();
            
        }
    }

    private void BindId()
    {
        try
        {

            SqlCommand cmd = new SqlCommand("select EmpId from Employee order by EmpId ASC", dbclass.Cn);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddlId.DataSource = dt;
            ddlId.DataTextField = "EmpId";
            ddlId.DataValueField = "EmpId";
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
        SqlCommand cmd = new SqlCommand("select E.EmpId, E.EmpName, C.CompName, D.DeptName, E.Desig, E.MobileNum, E.Email_Int, E.Email_Ext, E.IsActive  from Employee E,  Company C, Department D  where C.CompId = E.CompId and D.DeptId = E.DeptId and C.CompId = D.CompId;", dbclass.Cn);
        dbclass.Cn.Open();
        SqlDataReader sd = cmd.ExecuteReader();

        //data += "<tr><td>" + Company ID +  "</td><td>" + Name + "</td><td>" + Action + "</td></tr>";

        if (sd.HasRows)
        {
            while (sd.Read())
            {
                data += "<tr><td>";
                data += sd["EmpId"].ToString();
                data += "</td><td>";
                data += sd["EmpName"].ToString();
                data += "</td><td>";
                data += sd["Desig"].ToString();
                data += "</td><td>";
                data += sd["DeptName"].ToString();
                data += "</td><td>";
                data += sd["CompName"].ToString();
                data += "</td><td>";
                data += sd["MobileNum"].ToString();
                data += "</td><td>";
                data += sd["Email_Int"].ToString();
                data += "</td><td>";
                data += sd["Email_Ext"].ToString();
                data += "</td><td>";
                data += Convert.ToBoolean(sd["IsActive"]);
                data += "</td><td>";
                data += "&nbsp; <a href='javascript:delete_id(" + sd["EmpId"].ToString() + ")'><i class='material-icons'>delete</i></a>";
                data += "</td></tr>";
            }
        }

        return data;
    }



    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if(cbIsActive.Checked)
        {
            dbclass.UpdateEmp(tbEmpName.Text, tbContact.Text, Convert.ToInt32(ddlDepartment.SelectedItem.Value), Convert.ToInt32(ddlCompany.SelectedItem.Value), 1, tbDesig.Text, tbIntMail.Text, tbExtMail.Text, Convert.ToInt32(ddlId.SelectedItem.Value));
        }
        else
        {
            dbclass.UpdateEmp(tbEmpName.Text, tbContact.Text, Convert.ToInt32(ddlDepartment.SelectedItem.Value), Convert.ToInt32(ddlCompany.SelectedItem.Value), 0, tbDesig.Text, tbIntMail.Text, tbExtMail.Text, Convert.ToInt32(ddlId.SelectedItem.Value));
        }
        
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (cbIsActive2.Checked)
        {
            dbclass.insertEmp(tbEmpName2.Text, tbContact2.Text, ddlDepartment2.SelectedItem.Value, ddlCompany2.SelectedItem.Value, 1, tbDesig2.Text, tbIntMail2.Text, tbExtMail2.Text);

            tbContact2.Text = null;
            tbDesig2.Text = null;
            tbExtMail2.Text = null;
            tbIntMail2.Text = null;
            tbEmpName.Text = null;
            ddlCompany2.SelectedIndex = 0;
            ddlDepartment2.SelectedIndex = 0;
            cbIsActive2.Checked = false;

        }
        else
        {
            dbclass.insertEmp(tbEmpName2.Text, tbContact2.Text, ddlDepartment2.SelectedItem.Value, ddlCompany2.SelectedItem.Value, 0, tbDesig2.Text, tbIntMail2.Text, tbExtMail2.Text);

            tbContact2.Text = null;
            tbDesig2.Text = null;
            tbExtMail2.Text = null;
            tbIntMail2.Text = null;
            tbEmpName.Text = null;
            ddlCompany2.SelectedIndex = 0;
            ddlDepartment2.SelectedIndex = 0;
            cbIsActive2.Checked = false;
            tbEmpName2.Text = null;
        }
        

    }

    protected void BindCompany()
    {
        SqlConnection Cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString);
        string com = "select * from Company";
        SqlDataAdapter adpt = new SqlDataAdapter(com, Cn);
        DataTable dt = new DataTable();
        adpt.Fill(dt);

        //For edit tab
        ddlCompany.DataSource = dt;
        ddlCompany.DataBind();
        ddlCompany.DataTextField = "CompName";
        ddlCompany.DataValueField = "CompId";
        ddlCompany.DataBind();

        //for add Tab
        ddlCompany2.DataSource = dt;
        ddlCompany2.DataBind();
        ddlCompany2.DataTextField = "CompName";
        ddlCompany2.DataValueField = "CompId";
        ddlCompany2.DataBind();
        
        ddlCompany2.Items.Insert(0, new ListItem("Select a Company", "0"));
        ddlCompany.Items.Insert(0, new ListItem("Select a Company", "0"));

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

    protected void ddlId_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("select EmpId, EmpName, CompId, DeptId, Desig, MobileNum, Email_Int, Email_Ext, IsActive from Employee where EmpId= @Id", dbclass.Cn);
            cmd.Parameters.AddWithValue("@Id", ddlId.SelectedValue);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            dbclass.Cn.Open();
            cmd.ExecuteNonQuery();
            ddlId.SelectedValue = dt.Rows[0]["EmpId"].ToString();
            tbEmpName.Text = dt.Rows[0]["EmpName"].ToString();
            string compId = dt.Rows[0]["CompId"].ToString();
            ddlCompany.SelectedValue = compId;
            
            tbDesig.Text = dt.Rows[0]["Desig"].ToString();
            tbContact.Text = dt.Rows[0]["MobileNum"].ToString();
            tbExtMail.Text = dt.Rows[0]["Email_Ext"].ToString();
            tbIntMail.Text = dt.Rows[0]["Email_Int"].ToString();
            cbIsActive.Checked = Convert.ToBoolean(dt.Rows[0]["IsActive"].ToString());

            string deptId = dt.Rows[0]["DeptId"].ToString();
            SqlCommand cmd2 = new SqlCommand("select DeptId, DeptName from Department where CompId = @id", dbclass.Cn);
            cmd2.Parameters.AddWithValue("@id", compId);
            SqlDataAdapter sd = new SqlDataAdapter(cmd2);
            DataTable dt2 = new DataTable();
            sd.Fill(dt2);

            ddlDepartment.DataSource = dt2;
            ddlDepartment.DataTextField = "DeptName";
            ddlDepartment.DataValueField = "DeptId";
            ddlDepartment.DataBind();

            ddlDepartment.Items.Insert(0, new ListItem("Select Department", "0"));
            ddlDepartment.SelectedValue = deptId;

            dbclass.Cn.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void ddlCompany_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("select DeptId, DeptName from Department where CompId = @id", dbclass.Cn);
            cmd.Parameters.AddWithValue("@id", ddlCompany.SelectedValue);
            dbclass.Cn.Open();
            SqlDataAdapter sd = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sd.Fill(dt);

            ddlDepartment.DataSource = dt;
            ddlDepartment.DataTextField = "DeptName";
            ddlDepartment.DataValueField = "DeptId";
            ddlDepartment.DataBind();

            ddlDepartment.Items.Insert(0, new ListItem("Select Department", "0"));

            dbclass.Cn.Close();
        }
        catch(Exception ex)
        {
            throw ex;
        }
    }

    protected void ddlCompany2_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("select DeptId, DeptName from Department where CompId = @id", dbclass.Cn);
            cmd.Parameters.AddWithValue("@id", ddlCompany2.SelectedValue);
            dbclass.Cn.Open();
            SqlDataAdapter sd = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sd.Fill(dt);

            ddlDepartment2.DataSource = dt;
            ddlDepartment2.DataTextField = "DeptName";
            ddlDepartment2.DataValueField = "DeptId";
            ddlDepartment2.DataBind();


            //ListItem liDepartment = new ListItem("Select a Department", "0");
            //ddlDepartment.Items.Insert(0, liCompany);

            ddlDepartment2.Items.Insert(0, new ListItem("Select Department", "0"));

            dbclass.Cn.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}