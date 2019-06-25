using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for db
/// </summary>
public class db
{

    public SqlConnection Cn = new SqlConnection();
    public SqlCommand cmd = new SqlCommand();
    public void MSSQl_conn(string servername, string dbname, string uname, string pwd)
    {

        Cn = new SqlConnection("server=ASTUSER1/SQLEXPRESS;user id= sa1;password=admin@123;database=AutoCal");
        try
        {
            Cn.Open();
        }
        catch (Exception ex)
        {

        }

        var st = Cn.State;
        if (st == ConnectionState.Open)
        {

        }

    }

    public void insert(ref string tableName, ref string columnName, ref string value)
    {
        cmd.CommandText = "INSERT INTO " + tableName + "(" + columnName + " , createDate,UserID) Values (" + value + ", ' " + DateTime.Now + "', 1)";
        cmd.ExecuteNonQuery();

    }

    public void Update(ref string tableName, ref string columnName, ref string value)
    {
        cmd.CommandText = "Update " + tableName + "SET" + columnName + " = " + value + "";
        cmd.ExecuteNonQuery();

    }

    public void Delete(ref string tableName, ref string columnName, ref string value)
    {
        cmd.CommandText = "Delete From " + tableName + "Where" + columnName + " = " + value + "";
        cmd.ExecuteNonQuery();
    }


    public void Select(ref string tableName, ref string columnName, ref string columnName1, ref string value)
    {
        DataTable dt = new DataTable();
        cmd.CommandText = "Select" + columnName + " From " + tableName + "Where" + columnName1 + " = " + value + "";
        SqlDataReader reader = cmd.ExecuteReader();
        dt.Load(reader);
    }


    public void insertEmp(ref string empNAme, ref string contact, ref int deptId, ref int CompId, ref int isActive, ref string desgn, ref string emailInt, ref string emailExt)
    {
        cmd.CommandText = "INSERT INTO[dbo].[Emp] ([EmpName] , [Contact] , [DeptId] , [CompId] , [IsActive] , [Degn] , [Email_Int] , [Email_Ex] , [CreateDate] , [UserId] ) VALUES(" + empNAme + ", " + contact + "," + deptId + "," + CompId + "," + isActive + ",' " + desgn + ", " + emailInt + "," + emailExt + ", " + DateTime.Now + "', 1)";
        cmd.ExecuteNonQuery();

    }
    public void UpdateEmp(ref string empNAme, ref string contact, ref int deptId, ref int CompId, ref int isActive, ref string desgn, ref string emailInt, ref string emailExt, ref int empid)
    {

       cmd.CommandText = "UPDATE [dbo].[Emp] SET [EmpName] = " + empNAme + ", [Contact] = " + contact + ", [DeptId] = " + deptId + ", [CompId] = " + CompId + ", [IsActive] = " + isActive + ", [Degn] = " + desgn + ", [Email_Int] = " + emailInt + ", [Email_Ex] = " + emailExt + " WHERE empID = ' " + empid + " ";
       cmd.ExecuteNonQuery();

    }

    public void SelectAllById(ref string tableName, ref string columnName, ref string value)
    {
        DataTable dt = new DataTable();
        cmd.CommandText = "Select * From " + tableName + "Where" + columnName + " = " + value + "";
        SqlDataReader reader = cmd.ExecuteReader();
        dt.Load(reader);
    }


}
