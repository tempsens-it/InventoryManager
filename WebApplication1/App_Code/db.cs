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
    public void MSSQl_conn()
    {

        Cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString);

    }

    public void insert(string tableName, string columnName, string columnName2, string value)
    {
        int maxid = 0;
        String date = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss.sss");
        try
        {
            Cn.Open();
            maxid = SelectMaxId(tableName, columnName);

            cmd.CommandText = "INSERT INTO " + tableName + "(" + columnName + " ," + columnName2 + " , createDate,UserID) Values (" + maxid + ",'" + value + "', ' " + date + "', 1)";
            cmd.Connection = Cn;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);

        }
        Cn.Close();

    }

    public void insert(string tableName, string columnName, string columnName2, string columnName3, string value, string value2)
    {
        int maxid = 0;
        String date = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss.sss");
        try
        {
            //  Cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString);
            Cn.Open();
            maxid = SelectMaxId(tableName, columnName);

            cmd.CommandText = "INSERT INTO " + tableName + "(" + columnName + " ," + columnName2 + " ," + columnName3 + " , createDate,UserID) Values (" + maxid + ",'" + value + "'," + Convert.ToInt16(value2) + ", ' " + date + "', 1)";
            cmd.Connection = Cn;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();
    }

    public void Update(string tableName, string columnName, string columnName2, string value, int value2)
    {
        try
        {
            Cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString);
            Cn.Open();
            cmd.CommandText = "Update " + tableName + " SET  " + columnName + " = '" + value + "'  where  " + columnName2 + " = " + value2 + "";
            cmd.Connection = Cn;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();
    }

    public void Update(string tableName, string columnName, string columnName2, string columnName3, string value, int value2, int value3)
    {
        try
        {
            Cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString);
            Cn.Open();
            cmd.CommandText = "Update " + tableName + " SET  " + columnName + " = '" + value + " '" + columnName2 + " = '" + value2 + " '" + " where  " + columnName3 + " = " + value3 + "";
            cmd.Connection = Cn;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();
    }

    public void Delete(string tableName, string columnName, string value)
    {
        try
        {
            Cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString);
            Cn.Open();
            cmd.CommandText = "Delete From " + tableName + " Where  " + columnName + " = '" + value + "'";
            cmd.Connection = Cn;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();
    }


    public void Select(string tableName, string columnName, string columnName1, string value)
    {
        try
        {
            Cn.Open();
            DataTable dt = new DataTable();
            cmd.Connection = Cn;
            cmd.CommandText = "Select" + columnName + " From " + tableName + "Where" + columnName1 + " = '" + value + "'";
            SqlDataReader reader = cmd.ExecuteReader();
            dt.Load(reader);
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();
    }

    public int SelectMaxId(string tableName, string columnName)

    {
        int maxid = 0;
        try
        {
            
            DataTable dt = new DataTable();
            cmd.Connection = Cn;
            cmd.CommandText = "Select Max(" + columnName + ") From " + tableName;
            maxid = Convert.ToInt16(cmd.ExecuteScalar().ToString());

        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        return maxid + 1;
        // Cn.Close();
    }


    public void insertEmp(string empName, string contact, string deptId, string CompId, int isActive, string desgn, string emailInt, string emailExt)
    {
        int maxid = 0;
        String date = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss.sss");
        try
        {
            Cn.Open();
            maxid = SelectMaxId("Employee", "EmpId");

            cmd.CommandText = "INSERT INTO Employee ([EmpId] , [EmpName] ,  [DeptId] , [CompId] , [IsActive] , [Desig] , [MobileNum] , [Email_Int] , [Email_Ext] , [CreateDate] , [UserId] ) VALUES(" + maxid + ",'" + empName + "'," + deptId + "," + CompId + "," + isActive + ",'" + desgn + "',  '" + contact + "',' " + emailInt + "','" + emailExt + "', '" + date + "', 1)";
            cmd.Connection = Cn;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();

    }
    public void UpdateEmp(string empNAme, string contact, int deptId, int CompId, int isActive, string desgn, string emailInt, string emailExt, int empid)
    {
        try
        {
            Cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString);
            Cn.Open();
            cmd.CommandText = "UPDATE [dbo].[Employee]  SET [EmpName] = '" + empNAme + "', [MobileNum] = '" + contact + "', [DeptId] = " + deptId + ", [CompId] = " + CompId + ", [IsActive] = " + isActive + ", [Desig] = '" + desgn + "', [Email_Int] = '" + emailInt + "', [Email_Ext] =' " + emailExt + "' WHERE empID = " + empid + " ";
            cmd.Connection = Cn;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();

    }

    public void SelectAllColumnsById(string tableName, string columnName, int value)
    {
        try
        {
            Cn.Open();
            DataTable dt = new DataTable();
            cmd.CommandText = "Select * From " + tableName + "Where" + columnName + " = " + value + "";
            cmd.Connection = Cn;
            SqlDataReader reader = cmd.ExecuteReader();
            dt.Load(reader);
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();
    }


    public SqlDataReader SelectAll(string tableName)
    {
        SqlDataReader reader = null;
        try
        {
            Cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString);
            Cn.Open();

            cmd.CommandText = "Select  * From " + tableName;
            cmd.Connection = Cn;
            reader = cmd.ExecuteReader();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        // Cn.Close();
        return reader;

    }
    public int getIdByName(string idColumnName, string nameColumn, string tableName, string value)
    {
        int id = 0;
        try
        {
            Cn.Open();
            cmd.CommandText = cmd.CommandText = "Select" + idColumnName + " From " + tableName + "Where" + nameColumn + " = '" + value + "'";
            cmd.Connection = Cn;
            id = Convert.ToInt16(cmd.ExecuteScalar());

        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }

        //  Cn.Close();
        return id;
    }

    public void insertSupplier(string supplierName, string Add, string City, string State, string phoneNo, string email, int PaymentId, string Pincode, string GST)
    {
        int maxid = 0;
        String date = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss.sss");
        try
        {
            Cn.Open();
            maxid = SelectMaxId("Supplier", "SupplierId");
            cmd.CommandText = "INSERT INTO [dbo].[Supplier] ( [SupplierId] , [SupplierName] , [Address] , [City] , [State] , [PhoneNo] , [Email] , [PayTermId] , [Pincode] , [GSTIN],  [CreateDate] , [UserId] ) Values ( '" + maxid + "', '" + supplierName + "', '" + Add + "', '" + City + "',  '" + State + "', '" + phoneNo + "',  '" + email + "',  " + PaymentId + ",  '" + Pincode + "','" + GST + "','" + date + "', 1)";
            cmd.Connection = Cn;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();

    }

    public void UpdateSupplier(string supplierName, string Add, string City, string State, string MobileNo, string phoneNo, string email, int PaymentId, int Pincode, int supplierId)
    {
        String date = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss.sss");
        try
        {
            Cn.Open();
            cmd.CommandText = " UPDATE [dbo].[Supplier] SET[SupplierName] = '" + supplierName + "' ,[Address] ='" + Add + "' ,[City] ='" + City + "'  ,[State] = '" + State + "' ,[PhoneNo] ='" + phoneNo + "'  ,[Email] = '" + email + "' ,[PayTermId] = " + PaymentId + " ,[Pincode] = " + Pincode + " ,[CreateDate] = '" + date + "' ,[UserId] = 1  WHERE SupplierId = " + supplierId + " ";
            cmd.Connection = Cn;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();

    }



    public void UpdatePayMentTerms(string paymentTems, int NoofDays, int paymentTermId)

    {
        String date = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss.sss");
        try
        {
            Cn.Open();
            cmd.CommandText = "UPDATE [dbo].[PaymentTerms] SET [TermDesc] = '" + paymentTems + "',[NoOfDays] = " + NoofDays + ",[CreateDate] =' " + date + "' , [UserId] = 1 WHERE paymentTermId = " + paymentTermId + "";
            cmd.Connection = Cn;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();

    }


    public void insertSupplierContact(string supplierId, string SuprCntName, string Degn, string MobileNo, string email)
    {
        int maxid = 0;
        String date = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss.sss");
        try
        {
            Cn.Open();
            maxid = SelectMaxId("SupplierCnt", "SupplierCntId");
            cmd.CommandText = "INSERT INTO [dbo].[SupplierCnt] ([SupplierCntId] ,[SupplierId] ,[SuprCntName] ,[Degn] ,[MobileNo] ,[Email] ,[UserId] ,[CreateDate] ) VALUES( '" + maxid + "', '" + supplierId + "', '" + SuprCntName + "', '" + Degn + "',   '" + MobileNo + "', '" + email + "',   1 , '" + date + "')";
            cmd.Connection = Cn;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();

    }

    public void UpdateSupplierContact(string supplierCntName, string Degn, string MobileNo, string email, string SupplierCntId)
    {
        String date = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss.sss");
        try
        {
            Cn.Open();
            cmd.CommandText = "  UPDATE [dbo].[SupplierCnt] SET [SuprCntName]  = '" + supplierCntName + "' ,[Degn] ='" + Degn + "' ,[MobileNo] = '" + MobileNo + "' ,[Email] = '" + email + "' ,[CreateDate] = '" + date + "' ,[UserId] = 1  WHERE SupplierCntId = " + Convert.ToInt32(SupplierCntId) + " ";
            cmd.Connection = Cn;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();
    }


    public void insertPartMaster(string partname, string Desc, int CatId)
    {
        String date = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss.sss");
        int maxId = 0;
        try
        {
            maxId = SelectMaxId("PartMaster", "PartId");

            cmd.CommandText = "INSERT INTO [dbo].[PartMaster] ([PartId] ,[PartName] ,[CatId] ,[Description] ,[CreateDate], [UserId] ) VALUES (" + maxId + " ,' " + partname + "'," + CatId + ",'" + Desc + "', ' " + date + "', 1)";
            cmd.Connection = Cn;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();

    }

    public void UpdatePartMaster(string partname, string Desc, int CatId, int partId)
    {
        String date = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss.sss");
        try
        {
            Cn.Open();
            cmd.CommandText = "UPDATE [dbo].[PartMaster] SET[PartName] = '" + partname + "' ,[CatId]  =" + CatId + " ,[Description] = '" + Desc + "' ,[CreateDate] = '" + date + "' ,[UserId] = 1  WHERE partID = " + partId + " ";
            cmd.Connection = Cn;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();
    }

    public void insertPartConfig(int partId, string Spec1, string Spec2, string Spec3, string Desc)
    {
        String date = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss.sss");
        try
        {
            Cn.Open();
            cmd.CommandText = " INSERT INTO[dbo].[PartConfig] ([PartId] ,[Spec1] ,[Spec2] ,[Spec3] ,[Description] ,[CreateDate] ,[UserId]) VALUES (" + partId + ",'" + Spec1 + "','" + Spec2 + "','" + Spec3 + "','" + Desc + "', ' " + date + "', 1)";
            cmd.Connection = Cn;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();
    }

    public void UpdatePartConfig(string partid, string Desc, string Spec1, string Spec2, string Spec3, int PartConfigId)
    {
        String date = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss.sss");
        try
        {
            Cn.Open();
            cmd.CommandText = "UPDATE [dbo].[PartConfig] SET[PartId] = " + partid + " ,[Spec1]  ='" + Spec1 + "' ,[Spec2]  ='" + Spec2 + "' ,[Spec3]  ='" + Spec3 + "' ,[Description] = '" + Desc + "' ,[CreateDate] = '" + date + "' ,[UserId] = 1  WHERE PartConfigId = " + PartConfigId + " ";

            cmd.Connection = Cn;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();
    }


    public void insertTransHead(int compId, string InvcNum, int suppilerId, int paymentId, DateTime InvcDate)
    {
        String date = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss.sss");
        try
        {
            Cn.Open();
            cmd.CommandText = "INSERT INTO[dbo].[TransHead] ([CompId] ,[InvcNo] ,[InvcDate] ,[SupplierId] ,[paymentTermId] ,[TransDate] ,[CreateDate] ,[UserId] ) VALUES (" + compId + ",'" + InvcNum + "','" + InvcDate + "'," + suppilerId + "," + paymentId + ", ' " + date + "',' " + date + "', 1)";

            cmd.Connection = Cn;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();
    }

    public void UpdateTransHead(int compId, string InvcNum, int suppilerId, int paymentId, DateTime InvcDate, int tranHeadId)
    {
        String date = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss.sss");
        try
        {
            Cn.Open();
            cmd.CommandText = " UPDATE[dbo].[TransHead] SET[CompId] = " + compId + " ,[InvcNo]   ='" + InvcNum + "' ,[InvcDate]   ='" + InvcDate + "' ,[SupplierId] =" + suppilerId + " ,[paymentTermId]  =" + paymentId + " ,[TranDate] = '" + date + "' ,[CreateDate] = '" + date + "' ,[UserId] = 1  WHERE PartConfigId = " + tranHeadId + " ";
            cmd.Connection = Cn;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();
    }


    public void insertTransDetail(int TransHeadId, int LineNo, int partConfigId, int BrandId, int EmpId, Double qty, Double price, Double tax, Double discount, string Srno, string Desc)
    {
        String date = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss.sss");
        try
        {
            Cn.Open();
            cmd.CommandText = "INSERT INTO[dbo].[TransDetail] ([TransHeadId] ,[LineNo] ,[PartConfigId] ,[Desc] ,[BrandId] ,[EmpId] ,[SrNo] ,[Quantity] ,[Price] ,[Tax] ,[Discount] ,[CreateDate] ,[UserId] ) VALUES (" + TransHeadId + "," + LineNo + "," + partConfigId + ",'" + Desc + "'," + BrandId + "," + EmpId + " ,'" + Srno + "'," + qty + "," + price + "," + tax + "," + discount + ",' " + date + "', 1)";
            // <TransHeadId ,<LineNo ,<PartConfigId ,<Desc ,<BrandId ,<EmpId ,<SrNo ,<Quantity ,<Price ,<Tax ,<Discount ,<CreateDate ,<UserId )
            cmd.Connection = Cn;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();
    }

    //public void UpdateTransDetail( string partid,  string Desc,  string Spec1,  string Spec2,  string Spec3,  int PartConfigId)
    //{
    //    cmd.CommandText = "UPDATE [dbo].[PartConfig] SET[PartId] = " + partid + " ,[Spec1]  ='" + Spec1 + "' ,[Spec2]  ='" + Spec2 + "' ,[Spec3]  ='" + Spec3 + "' ,[Description] = '" + Desc + "' ,[CreateDate] = '" + DateTime.Now + "' ,[UserId] = 1  WHERE PartConfigId = " + PartConfigId + " ";
    //    cmd.ExecuteNonQuery();
    //}


    //public void insertIssueDetails( int partId,  string Spec1,  string Spec2,  string Spec3,  string Desc)
    //{
    //    cmd.CommandText = " INSERT INTO [dbo].[PartConfig] ([PartId] ,[Spec1] ,[Spec2] ,[Spec3] ,[Description] ,[CreateDate] ,[UserId]) VALUES (" + partId + ",'" + Spec1 + "','" + Spec2 + "','" + Spec3 + "','" + Desc + "', ' " + DateTime.Now + "', 1)";

    //    cmd.ExecuteNonQuery();
    //}

    //public void UpdateIssueDetails( string partid,  string Desc,  string Spec1,  string Spec2,  string Spec3,  int PartConfigId)
    //{
    //    cmd.CommandText = "UPDATE [dbo].[PartConfig] SET[PartId] = " + partid + " ,[Spec1]  ='" + Spec1 + "' ,[Spec2]  ='" + Spec2 + "' ,[Spec3]  ='" + Spec3 + "' ,[Description] = '" + Desc + "' ,[CreateDate] = '" + DateTime.Now + "' ,[UserId] = 1  WHERE PartConfigId = " + PartConfigId + " ";
    //    cmd.ExecuteNonQuery();
    //}
}













































//public void insertPayMentTerms( string paymentTems,  int NoofDays)
//{
//    cmd.CommandText = "INSERT INTO[dbo].[PaymentTerms] ([TermDesc] ,[NoOfDays] ,[CreateDate] ,[UserId] VALUES ('" + paymentTems + "'," + NoofDays + ", ' " + DateTime.Now + "', 1)";
//    cmd.ExecuteNonQuery();
//INSERT INTO[dbo].[SupplierCnt] ([SupplierId] ,[SuprCntName] ,[Degn] ,[MobileNo] ,[Email] ,[UserId] ,[CreateDate] ) VALUES(<SupplierId ,<SuprCntName ,<Degn ,<MobileNo, varchar(50), ,<Email ,<UserId ,<CreateDate
//}