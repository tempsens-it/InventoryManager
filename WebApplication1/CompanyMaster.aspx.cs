using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class CompanyMaster : System.Web.UI.Page
{
    db dbcalss = new db();



    protected void Page_Load(object sender, EventArgs e)
    {
        dbcalss.MSSQl_conn();
    }

    public string getSourceData()
    {
        string data = "";
        SqlDataReader sd = dbcalss.SelectAll("Company");

        //data += "<tr><td>" + Company ID +  "</td><td>" + Name + "</td><td>" + Action + "</td></tr>";

        if (sd.HasRows)
        {
            while (sd.Read())
            {
                string compId = sd["CompId"].ToString();
                string compName = sd["CompName"].ToString();

                data += "<tr><td>";
                data += compId;
                data += "</td><td>";
                data += compName;
                data += "</td><td>";
                data += "<a href='#' data-toggle='modal' data-target='#defaultModal_1'><i class='material-icons'>mode_edit</i></a>";
                data += "&nbsp; <a href='#' runat='server' onServerClick='deleteCalling(" + compId + ")'><i class='material-icons'>delete</i></a>"; //call the function deleteCalling(compId) and pass the Company ID
               
                data += "</td></tr>";

            }
        }
        return data;
    }



    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Message.Text = "Update";
        dbcalss.Update("Company", "CompName", "CompId", "Ar4e", 1);

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        Message.Text = "Save";

        dbcalss.insert("Company", "CompId", "CompName", TextBoxCompanyName.Text);

        TextBoxCompanyName.Text = "";
    }

    protected void deleteCalling(int compId)
    {
        Message.Text = "Delete";
        dbcalss.Delete("Company", "CompId", compId.ToString());

    }

}
