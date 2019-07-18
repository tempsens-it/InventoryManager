﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BrandMaster : System.Web.UI.Page
{
    db dbclass = new db();
    protected void Page_Load(object sender, EventArgs e)
    {
        Message.Text = "OnLOad";
    }

    public string getSourceData()
    {
        string data = "";
        SqlDataReader sd = dbclass.SelectAll("Brand");

        if (sd.HasRows)
        {
            while (sd.Read())
            {
                string brandId = sd["BrandId"].ToString();
                string brandName = sd["BrandName"].ToString();

                data += "<tr>";
                data += "<td>" + brandId + "</td>";
                data += "<td>" + brandName + "</td>";
                data += "<td>";
                data += "<a href='#' data-toggle='modal' data-target='#defaultModal_1'><i class='material-icons'>mode_edit</i></a>";
                data += "&nbsp; <a href='javaScript:delete_id(" + brandId + ")'> <i class='material-icons'>delete</i></a>";
                data += "</td></tr>";
            }

        }
        return data;
    }



    protected void btnUpdate(object sender, EventArgs e)
    {
        //dbclass.Update("Brand", "BrandName", "BrandId", "A", 1);
        Message.Text = "Update";

    }


    protected void btnSave(object sender, EventArgs e)
    {
        //dbclass.insert("Brand", "BrandName", TxtBrand.Text);
        Message.Text = "btnsave";
    }

    protected void save(object obj, EventArgs e)
    {
        Message.Text = " save";

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Message.Text = "Extra butoon";
    }
}