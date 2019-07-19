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
            getDataInDBSupplier();
            Delete_data();
            BindID();
            BindIDSupplierCnt();
        }

    }

    private void getDataInDBSupplier()
    {
        string com = "select * from Supplier";
        SqlDataAdapter adpt = new SqlDataAdapter(com, dbclass.Cn);
        DataTable dt = new DataTable();
        adpt.Fill(dt);

        ddlSupplier2.DataSource = dt;
        ddlSupplier2.DataTextField = "SupplierName";
        ddlSupplier2.DataValueField = "SupplierId";
        ddlSupplier2.DataBind();

        ListItem liState = new ListItem("Select Supplier", "0");
        ddlSupplier2.Items.Insert(0, liState);

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
        dbclass.Cn.Open();
        SqlCommand cmd = new SqlCommand("SELECT S.SupplierId, S.SupplierName, S.Address, S.City, S.State, S.PhoneNo, S.GSTIN, S.Pincode, " +
            "S.Email, SC.SuprCntName, SC.Degn, SC.MobileNo, SC.Email AS Expr1 FROM dbo.Supplier AS S LEFT OUTER JOIN dbo.SupplierCnt AS SC ON S.SupplierId = SC.SupplierId", dbclass.Cn);
        SqlDataReader sd = cmd.ExecuteReader();



        if (sd.HasRows)
        {
            while (sd.Read())
            {
                string supplierId = sd["SupplierId"].ToString();
                string supplierName = sd["SupplierName"].ToString();
                string address = sd["Address"].ToString();
                string city = sd["City"].ToString();
                string state = sd["State"].ToString();
                string phoneno = sd["PhoneNo"].ToString();
                string gstNum = sd["GSTIN"].ToString();
                string pincode = sd["Pincode"].ToString();
                string emailSup = sd["Email"].ToString();
                string supName = sd["SuprCntName"].ToString();
                string desg = sd["Degn"].ToString();
                string mobileNo = sd["MobileNo"].ToString();
                string email = sd["Expr1"].ToString();
                data += setData(supplierId, supplierName, city, state, pincode, phoneno, emailSup, gstNum, supName, desg, mobileNo, email);
            }
        }


        dbclass.Cn.Close();
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
        data += "&nbsp; <a href='javascript:delete_id(" + supplierId + ")'><i class='material-icons'>delete</i></a>";
        data += "</td></tr>";

        return data;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        dbclass.UpdateSupplier(tbSupplierName.Text, tbSupAdd.Text, ddlSupCity.SelectedItem.Text, ddlState.SelectedItem.Text, "1", tbSupLandline.Text, tbSupEmail.Text, 1, Convert.ToInt32(tbSupPincode.Text), Convert.ToInt32(ddlIdSupplier.SelectedItem.Value));
        
    }

    protected void btnSubmit2_Click(object sender, EventArgs e)
    {
        dbclass.UpdateSupplierContact(tbName.Text, tbDesignation.Text, tbMobNum.Text, tbEmail.Text, ddlIdSupplierCnt.SelectedItem.Value);
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        dbclass.insertSupplier(tbSupplierName2.Text, tbSupAdd2.Text, ddlSupCity2.SelectedItem.Text, ddlState2.SelectedItem.Text, tbSupLandline2.Text, tbSupEmail2.Text, 1, tbSupPincode2.Text, tbGST2.Text);

        tbSupplierName2.Text = null;
        tbSupAdd2.Text = null;
        ddlSupCity2.SelectedIndex = 0;
        ddlState2.SelectedIndex = 0;
        tbSupPincode2.Text = null;
        tbSupLandline2.Text = null;
        tbSupEmail2.Text = null;
        tbGST2.Text = null;
    }

    protected void btnSave2_Click(object sender, EventArgs e)
    {

        dbclass.insertSupplierContact(ddlSupplier2.SelectedItem.Value, tbName2.Text, tbDesignation2.Text, tbMobNum2.Text, tbEmail2.Text);

        ddlSupplier2.SelectedIndex = 0;
        tbName2.Text = null;
        tbDesignation2.Text = null;
        tbMobNum2.Text = null;
        tbEmail2.Text = null;

    }

    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlSupCity.Items.Clear();
        ddlSupCity.Items.Add("Select City");
        SqlCommand cmd = new SqlCommand("select * from City where StateCode =" + ddlState.SelectedItem.Value, dbclass.Cn);
        SqlDataAdapter sn = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sn.Fill(dt);
        ddlSupCity.DataSource = dt;
        ddlSupCity.DataTextField = "CityName";
        ddlSupCity.DataValueField = "CityCode";
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

    protected void ddlIdSupplier_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("select * from  Supplier where SupplierId = @Id", dbclass.Cn);
            cmd.Parameters.AddWithValue("@Id", ddlIdSupplier.SelectedValue);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            dbclass.Cn.Open();
            cmd.ExecuteNonQuery();
            ddlIdSupplier.SelectedValue = dt.Rows[0]["SupplierId"].ToString();
            //TxtCompany.Text = dt.Rows[0]["CompName"].ToString();
            tbSupplierName.Text = dt.Rows[0]["SupplierName"].ToString();
            tbSupAdd.Text = dt.Rows[0]["Address"].ToString();
            string state = dt.Rows[0]["State"].ToString();
            string stateId = getId("State", "StateName", "StateCode", state);
            ddlState.SelectedValue = stateId;
            //ddlState.Items.FindByText(state).Selected = true;
            string city = dt.Rows[0]["City"].ToString();

            String cmd2 = "select * from City where StateCode =" + ddlState.SelectedItem.Value;
            SqlDataAdapter sn = new SqlDataAdapter(cmd2, dbclass.Cn);
            DataTable dt2 = new DataTable();
            sn.Fill(dt2);
            ddlSupCity.DataSource = dt2;
            ddlSupCity.DataTextField = "CityName";
            ddlSupCity.DataValueField = "CityCode";
            ddlSupCity.DataBind();

            string cityId = getId("City", "CityName", "CityCode", city);
            ddlSupCity.SelectedValue = cityId;
            //ddlSupCity.Items.FindByText(city).Selected = true;
            tbSupPincode.Text = dt.Rows[0]["Pincode"].ToString();
            tbSupLandline.Text = dt.Rows[0]["PhoneNo"].ToString();
            tbSupEmail.Text = dt.Rows[0]["Email"].ToString();
            tbGST.Text = dt.Rows[0]["GSTIN"].ToString();
            dbclass.Cn.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private string getId(string tableName, string colName, string colIdName, string name)
    {
        string id = " ";
        try
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select " + colIdName + " from " + tableName + "  where CONVERT(varchar, " + colName + " ) = @Id", con);
            cmd.Parameters.AddWithValue("@Id", name);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Open();
            cmd.ExecuteNonQuery();
            id = dt.Rows[0][colIdName].ToString();
            //ddlId.SelectedValue = dt.Rows[0]["CompId"].ToString();
            //TxtCompany.Text = dt.Rows[0]["CompName"].ToString();
            //con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return id;
    }

    protected void ddlIdSupplierCnt_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("select * from SupplierCnt where SupplierCntId= @Id", dbclass.Cn);
            cmd.Parameters.AddWithValue("@Id", ddlIdSupplierCnt.SelectedValue);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            dbclass.Cn.Open();
            cmd.ExecuteNonQuery();
            ddlIdSupplierCnt.SelectedValue = dt.Rows[0]["SupplierCntId"].ToString();
            //TxtCompany.Text = dt.Rows[0]["CompName"].ToString();
            tbName.Text = dt.Rows[0]["SuprCntName"].ToString();
            tbDesignation.Text = dt.Rows[0]["Degn"].ToString();
            tbMobNum.Text = dt.Rows[0]["MobileNo"].ToString();
            tbEmail.Text = dt.Rows[0]["Email"].ToString();
            string supplierId = dt.Rows[0]["SupplierId"].ToString();
            tbSupplier.Text = getName("Supplier", "SupplierName", "SupplierId", supplierId);
            dbclass.Cn.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private string getName(string tableName, string colName, string colId, string supplierId)
    {
        string name = " ";
        try
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select " + colName + " from " + tableName + "  where " + colId + " = @Id", con);
            cmd.Parameters.AddWithValue("@Id", supplierId);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Open();
            cmd.ExecuteNonQuery();
            name = dt.Rows[0][colName].ToString();
            //ddlId.SelectedValue = dt.Rows[0]["CompId"].ToString();
            //TxtCompany.Text = dt.Rows[0]["CompName"].ToString();
            //con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return name;
    }

    private void BindID()
    {
        try
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select SupplierId from Supplier order by SupplierId ASC", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddlIdSupplier.DataSource = dt;
            ddlIdSupplier.DataTextField = "SupplierId";
            ddlIdSupplier.DataValueField = "SupplierId";
            ddlIdSupplier.DataBind();
            ddlIdSupplier.Items.Insert(0, new ListItem("--Select Id No.--", "0"));
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void BindIDSupplierCnt()
    {
        try
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select SupplierCntId from SupplierCnt order by SupplierCntId ASC", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddlIdSupplierCnt.DataSource = dt;
            ddlIdSupplierCnt.DataTextField = "SupplierCntId";
            ddlIdSupplierCnt.DataValueField = "SupplierCntId";
            ddlIdSupplierCnt.DataBind();
            ddlIdSupplierCnt.Items.Insert(0, new ListItem("--Select Id No.--", "0"));
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


}