using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TranscationInward : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string getSourceData()
    {
        string data = "";

        //data += "<tr><td>" + Company ID +  "</td><td>" + Name + "</td><td>" + Action + "</td></tr>";

        data += "<tr><td>";
        data += " ";
        data += "</td><td>";
        data += " ";
        data += "</td><td>";
        data += " ";
        data += "</td><td>";
        data += " ";
        data += "</td><td>";
        data += " ";
        data += "</td><td>";
        data += " ";
        data += "</td><td>";
        data += " ";
        data += "</td><td>";
        data += " ";
        data += "</td><td>";
        data += " ";
        data += "</td><td>";
        data += " ";
        data += "</td><td>";
        data += " ";
        data += "</td><td>";
        data += "<a href='#' data-toggle='modal' data-target='#defaultModal_1'><i class='material-icons'>mode_edit</i></a>";
        data += "&nbsp; <a href='#' data-toggle='modal' data-target='#'><i class='material-icons'>delete</i></a>";
        data += "&nbsp; <a href='#' data-toggle='modal' data-target='#'><i class='material-icons'>add_circle</i></a>";
        data += "</td></tr>";

        return data;
    }

    protected string addTaxes()
    {
        String data = "";

        data += "<tr><td>";
        data += " ";
        data += "</td><td>";
        data += " CGST 9% <br> SGST 9%";
        data += "</td><td>";
        data += " ";
        data += "</td><td>";
        data += " ";
        data += "</td><td>";
        data += " ";
        data += "</td><td>";
        data += " ";
        data += "</td><td>";
        data += " ";
        data += "</td><td>";
        data += "9 <br> 9";
        data += "</td><td>";
        data += "% <br> %";
        data += "</td><td>";
        data += " ";
        data += "</td><td>";
        data += " 123 <br> 123";
        data += "</td><td>";
        data += " ";
        data += "</td></tr>";

        return data;
    }

    
    protected string getTotalAmount()
    {
        String data = "";

        data += "<tr><td>";
        data += " ";
        data += "</td><td>";
        data += " Total";
        data += "</td><td>";
        data += " ";
        data += "</td><td>";
        data += " ";
        data += "</td><td>";
        data += " ";
        data += "</td><td>";
        data += " ";
        data += "</td><td>";
        data += " Quantity ";
        data += "</td><td>";
        data += " ";
        data += "</td><td>";
        data += " ";
        data += "</td><td>";
        data += " ";
        data += "</td><td>";
        data += "31241234 ";
        data += "</td><td>";
        data += " ";
        data += "</td></tr>";

        return data;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {

    }
}