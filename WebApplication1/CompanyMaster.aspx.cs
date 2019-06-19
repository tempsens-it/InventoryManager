using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CompanyMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string getSourceData()
    {
        string data = "";

        //data += "<tr><td>" + Company ID +  "</td><td>" + Name + "</td><td>" + Action + "</td>";
        
        data += "<td>";
        data += "<a href='#' data-toggle='modal' data-target='#defaultModal_1'><i class='material-icons'>mode_edit</i></a>";
        data += "</td></tr>";

        return data;
    }



    protected void btnSubmit_Click(object sender, EventArgs e)
    {

    }
}
