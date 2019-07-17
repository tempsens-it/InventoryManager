using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;
public partial class Main_Dashboard_User : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ITCOMP"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }

        if (!Page.IsPostBack)
        {
            BindCAT();
            BindPRIORITY();
            BindTicketNo();
            BindSubCAT();
            TotalComplain();
            SolveComplain();
            PendingComplain();
            ComplainAssign();
            BindTicketNoTraking();
        }
        Delete_data();
        Verified_Complain();
    }
    private void TotalComplain()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("select count('COMPLID') as COMPLID from ComplainTrans where ACTIVE = 'O' and USERID = @User_id", con);
            cmd.Parameters.AddWithValue("@User_id", Session["User_id"]);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Open();
            cmd.ExecuteNonQuery();
            lblTotalComplain.Text = dt.Rows[0]["COMPLID"].ToString();
             
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
     }
    private void SolveComplain()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("select count('COMPLID') as COMPLID from ComplainTrans where ACTIVE = 'C' and USERID = @User_id", con);
            cmd.Parameters.AddWithValue("@User_id", Session["User_id"]);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Open();
            cmd.ExecuteNonQuery();
            lblsolveComplain.Text = dt.Rows[0]["COMPLID"].ToString();
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public void Delete_data()
    {
        try
        {
            string get_id = Request.QueryString["delete_id"];
            if (get_id != null)
            {
                SqlCommand cmd = new SqlCommand("Delete from ComplainTrans where COMPLID = @id", con);
                cmd.Parameters.AddWithValue("@id", get_id);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("Dashboard_User.aspx");
            }
          }
        catch (Exception ex)
        {
            throw ex;
        }
      }

    public void Verified_Complain()
    {
        try
        {
            string get_id = Request.QueryString["veri_id"];
            if (get_id != null)
            {
                //DateTime dt1 = DateTime.Now;
                //String CompletedOn = "";
                //CompletedOn = dt1.ToString("MM/dd/yyyy");
                SqlCommand cmd = new SqlCommand("update ComplainTrans set ACTIVE = 'C' , COMPLETEDON = getdate()  where COMPLID = @id", con);
                cmd.Parameters.AddWithValue("@id", get_id);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("Dashboard_User.aspx");
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    private void PendingComplain()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("select count('COMPLID') as COMPLID from ComplainTrans where ACTIVE = 'P' and USERID = @User_id", con);
            cmd.Parameters.AddWithValue("@User_id", Session["User_id"]);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Open();
            cmd.ExecuteNonQuery();
            lblPendingComplain.Text = dt.Rows[0]["COMPLID"].ToString();
            lblpending.Text = "Pending: " + dt.Rows[0]["COMPLID"].ToString();



            SqlCommand cmd1 = new SqlCommand("select count('COMPLID') as COMPLID from ComplainTrans where ACTIVE = 'S' and USERID = @User_id", con);
            cmd1.Parameters.AddWithValue("@User_id", Session["User_id"]);
            SqlDataAdapter sda1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            sda1.Fill(dt1);
        
            cmd1.ExecuteNonQuery();
            lblsolve.Text = "Solve: " + dt1.Rows[0]["COMPLID"].ToString();
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }




    private void ComplainAssign()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("select count('ASSIGNTO') as ASSIGNTO from ComplainTrans where ACTIVE = 'P' and ASSIGNTO = @User_id", con);
            cmd.Parameters.AddWithValue("@User_id", Session["User_id"]);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Open();
            cmd.ExecuteNonQuery();
            lbltaskAssign.Text = dt.Rows[0]["ASSIGNTO"].ToString();
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public string getSourceData()
    {
        string data = "";
        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ITCOMP"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand("select CT.COMPLID as COMPLID,CM.CATEGORY as Category, " +
               " SM.SUBCATEGORY as Subcategory," +
               " CT.ACTIVE as ACTIVE,CONVERT(VARCHAR, CT.CREATED_ON, 105) as CreatedOn,CT.DESCRIPTION as DESCRIPTION from " +
               " CategMaster CM,SubCategMaster SM,ComplainTrans CT where " +
               " CT.CATID = CM.CATID And " +
               " CT.SUBCATID = SM.SUBCATID And " +
               " CT.USERID='" + Session["User_id"] + "' AND CT.ACTIVE = 'O'", conn))
            {
                cmd.Connection.Open();
                using (SqlDataReader sqlRdr = cmd.ExecuteReader())
                {
                    if (sqlRdr.HasRows)
                    {
                        while (sqlRdr.Read())
                        {
                            string Id = sqlRdr["COMPLID"].ToString();
                            string Category = sqlRdr["Category"].ToString();
                            string Subcategory = sqlRdr["Subcategory"].ToString();
                            string ACTIVE = sqlRdr["ACTIVE"].ToString();
                            string Remarks = sqlRdr["DESCRIPTION"].ToString();
                            string CreatedOn = sqlRdr["CreatedOn"].ToString();
                            string id = Id.ToString();

                            data += "<tr><td> Ticket No-" + id + "</td><td>" + Category + "</td><td>" + Subcategory + "</td>";
                            data += "<td>" + CreatedOn + "</td>";
                            data += "<td>" + Remarks + "</td>";
                            if (ACTIVE == "O")
                            {
                                data += "<td><a href='#'><i class='btn bg-purple btn-block btn-xs waves-effect'>Open</i></a></td>";
                            }
                             
                            //data += "<a href='Resume/" + id + "'><i class='material-icons'>search</i>";
                            data += "<td><a  href='javascript:delete_id(" + id + ")'><i class='material-icons' >delete_forever</i></a></td>";
                            data += "</tr>";
                        }
                    }
                }
            }
            return data;
        }
    }
    public string getSourceData_1()
      {
          string data = "";
          using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ITCOMP"].ConnectionString))
          {
              using (SqlCommand cmd = new SqlCommand("select CT.COMPLID as COMPLID,CM.CATEGORY as Category, " +
                 " SM.SUBCATEGORY as Subcategory," +
                 " CT.ACTIVE as ACTIVE,CONVERT(VARCHAR, CT.CREATED_ON, 105) as CreatedOn,CT.DESCRIPTION as DESCRIPTION from " +
                 " CategMaster CM,SubCategMaster SM,ComplainTrans CT where " +
                 " CT.CATID = CM.CATID And " +
                 " CT.SUBCATID = SM.SUBCATID And " +
                 " CT.USERID='" + Session["User_id"] + "' AND CT.ACTIVE IN ('P','S')", conn))
              {
                  cmd.Connection.Open();
                  using (SqlDataReader sqlRdr = cmd.ExecuteReader())
                  {
                      if (sqlRdr.HasRows)
                      {
                          while (sqlRdr.Read())
                          {
                              string Id = sqlRdr["COMPLID"].ToString();
                              string Category = sqlRdr["Category"].ToString();
                              string Subcategory = sqlRdr["Subcategory"].ToString();
                              string ACTIVE = sqlRdr["ACTIVE"].ToString();
                              string Remarks = sqlRdr["DESCRIPTION"].ToString();
                              string CreatedOn = sqlRdr["CreatedOn"].ToString();
                              string id = Id.ToString();

                              data += "<tr><td> Ticket No-" + id + "</td><td>" + Category + "</td><td>" + Subcategory + "</td>";
                              data += "<td>" + CreatedOn + "</td>";
                              data += "<td>" + Remarks + "</td>";
                              if (ACTIVE == "P")
                              {
                                  data += "<td><a href='#'><i class='btn bg-orange btn-block btn-xs waves-effect'>Pending...</i></a></td>";
                                  data += "<td><i class='material-icons'>lock_open</i></td>";
                              }
                              else if (ACTIVE == "S")
                              {
                                  data += "<td><a href='#'><i class='btn bg-lime btn-block btn-xs waves-effect''>Solved...</i></a></td>";
                                  data += "<td><a  href='javascript:Edit_id(" + id + ")'><i class='material-icons'>done</i></a></td>";
                              }
                                //data += "<a href='Resume/" + id + "'><i class='material-icons'>search</i>";
                              //data += "<a  href='javascript:delete_id(" + id + ")'  data-toggle='modal' data-target='#defaultModal_1'><i class='material-icons' >mode_edit</i></a>";
                              data += "</tr>";
                          }
                      }
                  }
              }
              return data;
          }
      }
    public string getSourceData_2()
      {
          string data = "";
          using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ITCOMP"].ConnectionString))
          {
              using (SqlCommand cmd = new SqlCommand("select CT.COMPLID as COMPLID,CM.CATEGORY as Category, " +
                 " SM.SUBCATEGORY as Subcategory," +
                 " CT.ACTIVE as ACTIVE,CONVERT(VARCHAR, CT.CREATED_ON, 105) as CreatedOn,CT.DESCRIPTION as DESCRIPTION from " +
                 " CategMaster CM,SubCategMaster SM,ComplainTrans CT where " +
                 " CT.CATID = CM.CATID And " +
                 " CT.SUBCATID = SM.SUBCATID And " +
                 " CT.USERID='" + Session["User_id"] + "' AND CT.ACTIVE = 'C'  order by CreatedOn desc", conn))
              {
                  cmd.Connection.Open();
                  using (SqlDataReader sqlRdr = cmd.ExecuteReader())
                  {
                      if (sqlRdr.HasRows)
                      {
                          while (sqlRdr.Read())
                          {
                              string Id = sqlRdr["COMPLID"].ToString();
                              string Category = sqlRdr["Category"].ToString();
                              string Subcategory = sqlRdr["Subcategory"].ToString();
                              string ACTIVE = sqlRdr["ACTIVE"].ToString();
                              string CreatedOn = sqlRdr["CreatedOn"].ToString();
                              string Remarks = sqlRdr["DESCRIPTION"].ToString();
                              string id = Id.ToString();

                              data += "<tr><td> Ticket No-" + id + "</td><td>" + Category + "</td><td>" + Subcategory + "</td>";
                              data += "<td>" + CreatedOn + "</td>";
                              data += "<td>" + Remarks + "</td>";
                              if (ACTIVE == "C")
                              {
                                  data += "<td><a href='#'><i class='btn bg-green btn-block btn-xs waves-effect'>Closed</i></a></td>";
                              }
                            data += "<td><a href='User_ComplainTraking.aspx?id=" + id+"'><i class='material-icons'>track_changes</i></a></td>";
                            //data += "<a href='Resume/" + id + "'><i class='material-icons'>search</i>";
                            //data += "<a  href='javascript:delete_id(" + id + ")'  data-toggle='modal' data-target='#defaultModal_1'><i class='material-icons' >mode_edit</i></a>";
                            data += "</tr>";
                          }
                      }
                  }
              }
              return data;
          }
      }

     public string getTraking()
    {
        string data = "";
        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ITCOMP"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT TOP (100) PERCENT TL.COMPID, CONVERT(VARCHAR, TL.CREATED_ON, 105) AS CREATED_ON, " +
                    "  TL.REMARKS, ISNULL(AT.ASSIGNNAME, 0) AS AssignTo, CONVERT(VARCHAR, TL.RESOLUTIONDT, " +
                    "  105) AS RESOLUTIONDT, TL.ACTIVE AS ACTIVE, ISNULL(UM.FNAME, '') + ' ' + ISNULL(UM.LNAME, '') AS AssignFrom " +
                    "  FROM dbo.TransLog AS TL RIGHT OUTER JOIN " +
                    "  dbo.UserMaster AS UM ON TL.USERID = UM.USERID LEFT OUTER JOIN " +
                    "  dbo.AssignTo AS AT ON TL.ASSIGNTO = AT.USERID " +
                    "  WHERE (TL.COMPID = '"+ ddltick.SelectedValue +"') " +
                    "  ORDER BY TL.TRANSID", conn))
            {
                cmd.Connection.Open();
                using (SqlDataReader sqlRdr = cmd.ExecuteReader())
                {
                    if (sqlRdr.HasRows)
                    {
                        while (sqlRdr.Read())  
                        {
                            string Id = sqlRdr["COMPID"].ToString();
                            string CreatedOn = sqlRdr["CREATED_ON"].ToString();
                            string AssignFrom = sqlRdr["AssignFrom"].ToString();
                            string AssignTo = sqlRdr["AssignTo"].ToString();
                            string ResolutionsDt = sqlRdr["RESOLUTIONDT"].ToString();
                            string Remarks = sqlRdr["REMARKS"].ToString();
                            string ACTIVE = sqlRdr["ACTIVE"].ToString();
                            string id = Id.ToString();

                            data += "<tr><td> Ticket No-" + id + "</td><td>" + CreatedOn + "</td><td>" + AssignFrom + "</td><td>" + AssignTo + "</td>";
                            data += "<td>" + ResolutionsDt + "</td>";
                            data += "<td>" + Remarks + "</td>";
                            if (ACTIVE == "O")
                            {
                                data += "<td><a href=''><i class='btn bg-purple btn-block btn-xs waves-effect'>Open..</i></a></td>";
                            }
                            if (ACTIVE == "P")
                            {
                                data += "<td><a href=''><i class='btn bg-orange btn-block btn-xs waves-effect'>Pending..</i></a></td>";
                            }
                            if (ACTIVE == "S")
                            {
                                data += "<td><a href=''><i class='btn bg-lime btn-block btn-xs waves-effect'>Slove..</i></a></td>";
                            }
                            if (ACTIVE == "C")
                            {
                                data += "<td><a href=''><i class='btn bg-green btn-block btn-xs waves-effect'>Closed..</i></a></td>";
                               
                            }
                            //data += "<a href='Resume/" + id + "'><i class='material-icons'>search</i>";
                             data += "</tr>";
                        }
                    }
                }
            }
            return data;
        }
    }
    private void BindCAT()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("select CATID,CATEGORY from CategMaster", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DDLCAT.DataSource = dt;
            DDLCAT.DataTextField = "CATEGORY";
            DDLCAT.DataValueField = "CATID";
            DDLCAT.DataBind();
            DDLCAT.Items.Insert(0, new ListItem("--Select Category--", "0"));
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    private void BindSubCAT()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("select SUBCATID,SUBCATEGORY from SubCategMaster", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DDLSUBCAT.DataSource = dt;
            DDLSUBCAT.DataTextField = "SUBCATEGORY";
            DDLSUBCAT.DataValueField = "SUBCATID";
            DDLSUBCAT.DataBind();
            DDLSUBCAT.Items.Insert(0, new ListItem("--Select SubCategory--", "0"));
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    private void BindPRIORITY()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("select PRIORITYID,PRIORITY from PriorityMaster", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddlpriority.DataSource = dt;
            ddlpriority.DataTextField = "PRIORITY";
            ddlpriority.DataValueField = "PRIORITYID";
            ddlpriority.DataBind();
            ddlpriority.Items.Insert(0, new ListItem("--Select Priority--", "0"));
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    private void BindTicketNo()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("select COMPLID from ComplainTrans where USERID = '" + Session["User_id"] + "' AND ACTIVE = 'O'", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddlticketno.DataSource = dt;
            ddlticketno.DataTextField = "COMPLID";
            ddlticketno.DataValueField = "COMPLID";
            ddlticketno.DataBind();
            ddlticketno.Items.Insert(0, new ListItem("--Select Ticket No.--", "0"));
             con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    private void BindTicketNoTraking()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("select COMPLID from ComplainTrans where USERID = '" + Session["User_id"] + "' and ACTIVE NOT IN('C') ORDER BY COMPLID ASC", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
             ddltick.DataSource = dt;
            ddltick.DataTextField = "COMPLID";
            ddltick.DataValueField = "COMPLID";
            ddltick.DataBind();
            ddltick.Items.Insert(0, new ListItem("--Select Ticket No.--", "0"));
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }



    protected void DDLCAT_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
           SqlCommand cmd = new SqlCommand("select SUBCATID,SUBCATEGORY from SubCategMaster where CATID ='" + DDLCAT.SelectedValue + "'", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DDLSUBCAT.DataSource = dt;
            DDLSUBCAT.DataTextField = "SUBCATEGORY";
            DDLSUBCAT.DataValueField = "SUBCATID";
            DDLSUBCAT.DataBind();
            con.Close();
          }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected void ddlticketno_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            btnSubmit.Visible = true;
            DDLCAT.Visible = true;
            DDLSUBCAT.Visible = true;
            ddlpriority.Visible = true;
            Txtdescription.Visible = true;
            SqlCommand cmd = new SqlCommand("select COMPLID ,CATID ,SUBCATID,PRIORITYID ,DESCRIPTION  from  ComplainTrans  where COMPLID= @TicketId", con);
            cmd.Parameters.AddWithValue("@TicketId", ddlticketno.SelectedValue);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Open();
            cmd.ExecuteNonQuery();
            DDLCAT.SelectedValue = dt.Rows[0]["CATID"].ToString();
            DDLSUBCAT.SelectedValue = dt.Rows[0]["SUBCATID"].ToString();
            ddlpriority.SelectedValue = dt.Rows[0]["PRIORITYID"].ToString();
            Txtdescription.Text = dt.Rows[0]["DESCRIPTION"].ToString();
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
                DateTime dt = DateTime.Now;
                String ModifiedOn = "";
                ModifiedOn = dt.ToString("MM/dd/yyyy hh:mm tt");
                SqlCommand cmd = new SqlCommand("Update ComplainTrans set CATID = @CATID,SUBCATID = @SUBCATID,PRIORITYID = @PRIORITY,DESCRIPTION = @DESCRIPTION,MODIFIED_ON = @MODIFIED_ON,MODIFIED_BY = @MODIFIED_BY where COMPLID = @CompID", con);
                cmd.Parameters.AddWithValue("@CATID", DDLCAT.SelectedValue);
                cmd.Parameters.AddWithValue("@SUBCATID", DDLSUBCAT.SelectedValue);
                cmd.Parameters.AddWithValue("@PRIORITY", ddlpriority.SelectedValue);
                cmd.Parameters.AddWithValue("@DESCRIPTION", Txtdescription.Text);
                cmd.Parameters.AddWithValue("@MODIFIED_ON", ModifiedOn);
                cmd.Parameters.AddWithValue("@MODIFIED_BY", Session["User_id"]);
                cmd.Parameters.AddWithValue("@CompID", ddlticketno.SelectedValue);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("Dashboard_User.aspx");
           }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected void ddltick_SelectedIndexChanged(object sender, EventArgs e)
    {
        getTraking();
         }
    
}