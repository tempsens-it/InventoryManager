﻿using System;
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
        //getDataInDropBoxCompany();

        if (!Page.IsPostBack)
        {
            getDataInDropBoxCompany();
            Delete_data();
            //Edit_data();
        }
    }

    //private void Edit_data()
    //{
    //    string get_id = Request.QueryString["edit_id"];
    //    if(get_id != null)
    //    {
            
    //    }
    //}

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
                data += "<a href='javascript:edit_id(" + deptId + ")' data-toggle='modal' data-target='#defaultModal_1'><i class='material-icons'>mode_edit</i></a>";
                data += "&nbsp; <a  href='javascript:delete_id(" + deptId + ")'><i class='material-icons'>delete</i></a>";
                data += "</td></tr>";
            }
        }

        return data;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (DropCompany.SelectedItem.Value != "-1")
        {
            try
            {
                SqlConnection Con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString);
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = Con;
                string get_id = Request.QueryString["edit_id"];
                cmd.CommandText = "Update Department set DeptName = @DeptName, CompId = @CompId where DeptId = 1";
                cmd.Parameters.AddWithValue("@DeptName", TxtDepartment.Text);
                cmd.Parameters.AddWithValue("@CompId", DropCompany.SelectedItem.Value);
                //cmd.Parameters.AddWithValue("@DeptId", get_id);
                Con.Open();
                cmd.ExecuteScalar();

                Con.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
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



}