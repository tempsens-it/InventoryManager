using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SupplierMaster : System.Web.UI.Page
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

    private void Delete_data()
    {
        try
        {
            string get_id = Request.QueryString["delete_id"];
            if (get_id != null)
            {
                dbclass.Delete("SupplierCnt", "SupplierCntId", get_id);
                Response.Redirect("SupplierMaster.asppx");
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void getDataInDropBoxCompany()
    {

        SqlConnection Cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString);
        string com = "select * from State";
        SqlDataAdapter adpt = new SqlDataAdapter(com, Cn);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        DataTable dt2 = new DataTable();
        adpt.Fill(dt2);

        ddlState2.DataSource = dt2;
        ddlState2.DataTextField = "StateName";
        ddlState2.DataValueField = "StateCode";
        ddlState2.DataBind();

        ddlState.DataSource = dt;
        ddlState.DataTextField = "StateName";
        ddlState.DataValueField = "StateCode";
        ddlState.DataBind();


        ListItem liState = new ListItem("Select State", "-1");
        ddlState.Items.Insert(0, liState);
        ddlState2.Items.Insert(0, liState);

        ListItem liCity = new ListItem("Select City", "-1");
        ddlSupCity.Items.Insert(0, liCity);
        ddlSupCity2.Items.Insert(0, liCity);



    }

    public string getSourceData()
    {
        string data = "";
        SqlDataReader sd = dbclass.SelectAll("Supplier");
        SqlDataReader sd2 = dbclass.SelectAll("SupplierCnt");


        //data += "<tr><td>" + Company ID +  "</td><td>" + Name + "</td><td>" + Action + "</td></tr>";

        if (sd.HasRows || sd2.HasRows)
        {
            while (sd.Read())
            {
                string supplierId = sd["SupplierId"].ToString();
                string supplierName = sd["SupplierName"].ToString();
                string address = sd["Address"].ToString();
                string city = sd["City"].ToString();
                string state = sd["State"].ToString();
                string phoneno = sd["PhoneNo"].ToString();
                //string gstNum = sd["GSTNo"].ToString();
                string gstNum = "1";
                string pincode = sd["Pincode"].ToString();
                string emailSup = sd["Email"].ToString();
                int flag = 0;

                while (sd2.Read())
                {
                    string supCntId = sd2["SupplierCntId"].ToString();
                    string suppId = sd2["SupplierId"].ToString();
                    string supName = sd2["SuprCntName"].ToString();
                    string desg = sd2["Degn"].ToString();
                    string mobileNo = sd2["MobileNo"].ToString();
                    string email = sd2["Email"].ToString();

                    if (suppId == supplierId)
                    {
                        data += setData(supplierId, supplierName, city, state, pincode, phoneno, emailSup, gstNum, supName, desg, mobileNo, email);
                        flag = 1;
                    }
                }
                if (flag == 0)
                    data += setData(supplierId, supplierName, city, state, pincode, phoneno, emailSup, gstNum, "-", "-", "-", "-");

            }
        }

        return data;
    }

    protected string setData(string supplierId, string supplierName, string city, string state, string pincode, string phoneno, string emailSup, string gstNum, string supName, string desg, string mobileNo, string email)
    {
        string data = "";

        data += "<tr><td>";
        data += supplierId;
        data += "</td><td>";
        data += supplierName;
        data += "</td><td>";
        data += city;
        data += "</td><td>";
        data += state;
        data += "</td><td>";
        data += pincode;
        data += "</td><td>";
        data += phoneno;
        data += "</td><td>";
        data += emailSup;
        data += "</td><td>";
        data += gstNum;
        data += "</td><td>";
        data += supName;
        data += "</td><td>";
        data += desg;
        data += "</td><td>";
        data += mobileNo;
        data += "</td><td>";
        data += email;
        data += "</td><td>";
        data += "<a href='#' data-toggle='modal' data-target='#defaultModal_1'><i class='material-icons'>mode_edit</i></a>";
        data += "&nbsp; <a href='javascript:delete_id(" + supplierId + ")'><i class='material-icons'>delete</i></a>";
        data += "</td></tr>";

        return data;
    }



    protected void btnSubmit_Click(object sender, EventArgs e)
    {

    }

    protected void btnSubmit2_Click(object sender, EventArgs e)
    {

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        dbclass.insertSupplier(tbSupplierName2.Text, tbSupAdd2.Text, ddlSupCity2.SelectedItem.Text, ddlState2.SelectedItem.Text, "123", tbSupLandline2.Text, tbSupEmail2.Text, 1, tbSupPincode2.Text);

        tbSupplierName2.Text = "";
        tbSupAdd2.Text = "";
        ddlSupCity2.ClearSelection();
        ddlSupCity2.ClearSelection();
        tbSupPincode2.Text = "";
        tbSupLandline2.Text = "";
        tbSupEmail2.Text = "";
        tbGST.Text = "";
    }

    protected void btnSave2_Click(object sender, EventArgs e)
    {

        dbclass.insertSupplierContact(ddlSupplier2.SelectedItem.Value, tbName2.Text, tbDesignation2.Text, "1", tbMobNum2.Text, "1", tbEmail2.Text, 1, 1);

        ddlSupplier2.ClearSelection();
        tbName2.Text = "";
        tbDesignation2.Text = "";
        tbMobNum2.Text = "";
        tbEmail2.Text = "";

    }

    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlSupCity.Items.Clear();
        ddlSupCity.Items.Add("Select City");

        SqlConnection Cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select * from City where StateCode =" + ddlState.SelectedItem.Value, Cn);
        SqlDataAdapter sn = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sn.Fill(dt);
        ddlSupCity.DataSource = dt;
        ddlSupCity.DataBind();

    }

    protected void ddlState2_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlSupCity2.Items.Clear();
        ddlSupCity2.Items.Add("Select City");

        SqlConnection Cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString);

        String cmd = "select * from City where StateCode =" + ddlState2.SelectedItem.Value;

        SqlDataAdapter sn = new SqlDataAdapter(cmd, Cn);
        DataTable dt = new DataTable();
        sn.Fill(dt);
        ddlSupCity2.DataSource = dt;
        ddlSupCity2.DataTextField = "CityName";
        ddlSupCity2.DataValueField = "CityCode";
        ddlSupCity2.DataBind();

    }
}