using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string getSourceData()
    {
        string data = "";

        data += "<tr><td>";
        data += "1";
        data += "</td><td>";
        data += "Laptop";
        data += "</td><td>";
        data += "Intel i5<br>8GB RAM <br>1 TB HDD";
        data += "</td><td>";
        data += "Unit 1 ";
        data += "</td><td>";
        data += "2";
        data += "</td></tr>";

        return data;
    }
}
