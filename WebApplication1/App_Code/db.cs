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
        try
        {
            Cn.Open();
            maxid =  SelectMaxId(tableName, columnName);

            cmd.CommandText = "INSERT INTO " + tableName + "(" + columnName + " ," + columnName2 + " , createDate,UserID) Values ("+ maxid+",'" + value + "', ' " + DateTime.Now + "', 1)";
            cmd.Connection = Cn;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
            
        }
        Cn.Close();

    }



    public void insert( string tableName,  string columnName,  string columnName2, string columnName3, string value, string value2)
    {
        int maxid = 0;
        try
        {
          //  Cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString);
            Cn.Open();
            maxid = SelectMaxId(tableName, columnName);

            cmd.CommandText = "INSERT INTO " + tableName + "(" + columnName + " ," + columnName2 + " ," + columnName3 + " , createDate,UserID) Values (" + maxid + ",'" + value + "'," + Convert.ToInt16(value2) + ", ' " + DateTime.Now + "', 1)";
            cmd.Connection = Cn;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();
    }

    public void Update( string tableName,  string columnName, string columnName2, string value, int value2)
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

    public void Delete( string tableName,  string columnName,  string value)
    {
        try
        {
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


    public void Select( string tableName,  string columnName,  string columnName1,  string value)
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
//Cn.Open();
            DataTable dt = new DataTable();
            cmd.Connection = Cn;
            cmd.CommandText = "Select Max(" + columnName + ") From " + tableName ;
            maxid = Convert.ToInt16(cmd.ExecuteScalar().ToString()) +  1;
            
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        return maxid;
       // Cn.Close();
    }


    public void insertEmp( string empName,  string contact,  string deptId,  string CompId,  int isActive,  string desgn,  string emailInt,  string emailExt)
    {
        int maxid = 0;
        try
        {
            Cn.Open();
            maxid = SelectMaxId("Employee", "EmpId");

            cmd.CommandText = "INSERT INTO Employee ([EmpId] , [EmpName] ,  [DeptId] , [CompId] , [IsActive] , [Desig] , [MobileNum] , [Email_Int] , [Email_Ext] , [CreateDate] , [UserId] ) VALUES(" +  maxid + ",'" + empName + "'," + deptId + "," + CompId + "," + isActive + ",'" + desgn + "',  '" + contact + "',' " + emailInt + "','" + emailExt + "', '" + DateTime.Now + "', 1)";
            cmd.Connection = Cn;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();

    }
    public void UpdateEmp( string empNAme,  string contact,  int deptId,  int CompId,  int isActive,  string desgn,  string emailInt,  string emailExt,  int empid)
    {
        try
        {
            Cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IT_Inventory"].ConnectionString);
            Cn.Open();
            cmd.CommandText = "UPDATE [dbo].[Emp]  SET [EmpName] = '" + empNAme + "', [Contact] = '" + contact + "', [DeptId] = " + deptId + ", [CompId] = " + CompId + ", [IsActive] = " + isActive + ", [Degn] = '" + desgn + "', [Email_Int] = '" + emailInt + "', [Email_Ex] =' " + emailExt + "' WHERE empID = " + empid + " ";
            cmd.Connection = Cn;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();

    }

    public void SelectAllColumnsById( string tableName,  string columnName,  int value)
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
        SqlDataReader reader =null;
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
    public int getIdByName( string idColumnName,  string nameColumn,  string tableName,  string value)
    {
        int id=0;
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

    public void insertSupplier( string supplierName,  string Add,  string City,  string State,  string MobileNo,  string phoneNo,  string email,  int PaymentId,  int Pincode)
    {
        try
        {
            Cn.Open();
            cmd.CommandText = "INSERT INTO [dbo].[Supplier] ( [SupplierName] , [Address] , [City] , [State] , [MobileNo] , [PhoneNo] , [Email] , [PayTermId] , [Pincode] , [CreateDate] Values('" + supplierName + "', '" + Add + "', '" + City + "',  '" + State + "', '" + MobileNo + "', '" + phoneNo + "',  '" + email + "',  " + PaymentId + ",  " + Pincode + ",'" + DateTime.Now + "', 1)";
            cmd.Connection = Cn;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();

    }

    public void UpdateSupplier( string supplierName,  string Add,  string City,  string State,  string MobileNo,  string phoneNo,  string email,  int PaymentId,  int Pincode,  int supplierId)
    {
        try
        {
            Cn.Open();
            cmd.CommandText = " UPDATE [dbo].[Supplier] SET[SupplierName] = '" + supplierName + "' ,[Address] ='" + Add + "' ,[City] ='" + City + "'  ,[State] = '" + State + "' ,[MobileNo] =  ,[PhoneNo] ='" + MobileNo + "'  ,[Email] =  ,[PayTermId] = " + PaymentId + " ,[Pincode] = " + Pincode + " ,[CreateDate] = '" + DateTime.Now + "' ,[UserId] = 1  WHERE SupplierId = " + supplierId + " ";
            cmd.Connection = Cn;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();

    }



    public void UpdatePayMentTerms( string paymentTems,  int NoofDays, int paymentTermId)

    {
        try
        {
            Cn.Open();
            cmd.CommandText = "UPDATE [dbo].[PaymentTerms] SET [TermDesc] = '" + paymentTems + "',[NoOfDays] = " + NoofDays + ",[CreateDate] =' " + DateTime.Now + "' , [UserId] = 1 WHERE paymentTermId = " + paymentTermId + "";
            cmd.Connection = Cn;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();

    }


    public void insertSupplierContact( string supplierId,  string SuprCntName,  string Degn,  string State,  string MobileNo,  string phoneNo,  string email,  int PaymentId,  int Pincode)
    {
        try
        {
            Cn.Open();
            cmd.CommandText = "INSERT INTO [dbo].[SupplierCnt] ([SupplierId] ,[SuprCntName] ,[Degn] ,[MobileNo] ,[Email] ,[UserId] ,[CreateDate] ) VALUES(" + supplierId + ", '" + SuprCntName + "', '" + Degn + "',   '" + MobileNo + "',   '" + email + "',   1 ,'" + DateTime.Now + "',)";
            cmd.Connection = Cn;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();

    }

    public void UpdateSupplierContact( string supplierCntName,  string Degn,  string MobileNo,  string email,  int SupplierCntId)
    {
        try
        {
            Cn.Open();
            cmd.CommandText = "  UPDATE [dbo].[SupplierCnt] SET [SuprCntName]  = '" + supplierCntName + "' ,[Degn] ='" + Degn + "' ,[MobileNo] = '" + MobileNo + "' ,[Email] = '" + email + "' ,[CreateDate] = '" + DateTime.Now + "' ,[UserId] = 1  WHERE SupplierCntId = " + SupplierCntId + " ";
            cmd.Connection = Cn;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();
    }


    public void insertPartMaster( string partname,  string Desc,  int CatId)
    {
        try
        {
            Cn.Open();
            cmd.CommandText = "INSERT INTO [dbo].[PartMaster] ([PartName] ,[CatId] ,[Description] ,[CreateDate] ) VALUES ('" + partname + "'," + CatId + ",'" + Desc + "', ' " + DateTime.Now + "', 1)";
            cmd.Connection = Cn;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();

    }

    public void UpdatePartMaster( string partname,  string Desc,  int CatId,  int partId)
    {
        try
        {
            Cn.Open();
            cmd.CommandText = "UPDATE [dbo].[PartMaster] SET[PartName] = '" + partname + "' ,[CatId]  =" + CatId + " ,[Description] = '" + Desc + "' ,[CreateDate] = '" + DateTime.Now + "' ,[UserId] = 1  WHERE partID = " + partId + " ";
            cmd.Connection = Cn;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();
    }

    public void insertPartConfig( int partId,  string Spec1,  string Spec2,  string Spec3,  string Desc)
    {
        try
        {
            Cn.Open();
            cmd.CommandText = " INSERT INTO[dbo].[PartConfig] ([PartId] ,[Spec1] ,[Spec2] ,[Spec3] ,[Description] ,[CreateDate] ,[UserId]) VALUES (" + partId + ",'" + Spec1 + "','" + Spec2 + "','" + Spec3 + "','" + Desc + "', ' " + DateTime.Now + "', 1)";
            cmd.Connection = Cn;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();
    }

    public void UpdatePartConfig( string partid,  string Desc,  string Spec1,  string Spec2,  string Spec3,  int PartConfigId)
    {
        try
        {
            Cn.Open();
            cmd.CommandText = "UPDATE [dbo].[PartConfig] SET[PartId] = " + partid + " ,[Spec1]  ='" + Spec1 + "' ,[Spec2]  ='" + Spec2 + "' ,[Spec3]  ='" + Spec3 + "' ,[Description] = '" + Desc + "' ,[CreateDate] = '" + DateTime.Now + "' ,[UserId] = 1  WHERE PartConfigId = " + PartConfigId + " ";

            cmd.Connection = Cn;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();
    }


    public void insertTransHead( int compId,  string InvcNum,  int suppilerId,  int paymentId,  DateTime InvcDate)
    {
        try
        {
            Cn.Open();
            cmd.CommandText = "INSERT INTO[dbo].[TransHead] ([CompId] ,[InvcNo] ,[InvcDate] ,[SupplierId] ,[paymentTermId] ,[TransDate] ,[CreateDate] ,[UserId] ) VALUES (" + compId + ",'" + InvcNum + "','" + InvcDate + "'," + suppilerId + "," + paymentId + ", ' " + DateTime.Now + "',' " + DateTime.Now + "', 1)";
        
        cmd.Connection = Cn;
        cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();
    }

    public void UpdateTransHead( int compId,  string InvcNum,  int suppilerId,  int paymentId,  DateTime InvcDate,  int tranHeadId)
    {
        try
        {
            Cn.Open();
            cmd.CommandText = " UPDATE[dbo].[TransHead] SET[CompId] = " + compId + " ,[InvcNo]   ='" + InvcNum + "' ,[InvcDate]   ='" + InvcDate + "' ,[SupplierId] =" + suppilerId + " ,[paymentTermId]  =" + paymentId + " ,[TranDate] = '" + DateTime.Now + "' ,[CreateDate] = '" + DateTime.Now + "' ,[UserId] = 1  WHERE PartConfigId = " + tranHeadId + " ";
            cmd.Connection = Cn;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();
    }


    public void insertTransDetail( int TransHeadId,  int LineNo,  int partConfigId,  int BrandId,  int EmpId,  Double qty,  Double price,  Double tax,  Double discount,  string Srno,  string Desc)
    {
        try
        {
            Cn.Open();
            cmd.CommandText = "INSERT INTO[dbo].[TransDetail] ([TransHeadId] ,[LineNo] ,[PartConfigId] ,[Desc] ,[BrandId] ,[EmpId] ,[SrNo] ,[Quantity] ,[Price] ,[Tax] ,[Discount] ,[CreateDate] ,[UserId] ) VALUES (" + TransHeadId + "," + LineNo + "," + partConfigId + ",'" + Desc + "'," + BrandId + "," + EmpId + " ,'" + Srno + "'," + qty + "," + price + "," + tax + "," + discount + ",' " + DateTime.Now + "', 1)";
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