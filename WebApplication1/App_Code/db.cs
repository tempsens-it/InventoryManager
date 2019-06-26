﻿using System;
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

    public void insert(string tableName, string columnName, string value)
    {
        try
        {
            Cn.Open();
            cmd.CommandText = "INSERT INTO " + tableName + "(" + columnName + " , createDate,UserID) Values ('" + value + "', ' " + DateTime.Now + "', 1)";
            cmd.Connection = Cn;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();

    }

    public void insert( string tableName,  string columnName,  int columnName2,  string value,  string value2)
    {
        try
        {
            Cn.Open();
            cmd.CommandText = "INSERT INTO " + tableName + "(" + columnName + " ," + columnName2 + " , createDate,UserID) Values ('" + value + "'," + value + " ' " + DateTime.Now + "', 1)";
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();
    }

    public void Update( string tableName,  string columnName,  string value)
    {
        try
        {
            Cn.Open();
            cmd.CommandText = "Update " + tableName + "SET" + columnName + " = '" + value + "'";
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
            cmd.CommandText = "Delete From " + tableName + "Where" + columnName + " = '" + value + "'";
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


    public void insertEmp( string empNAme,  string contact,  int deptId,  int CompId,  int isActive,  string desgn,  string emailInt,  string emailExt)
    {
        try
        {
            Cn.Open();
            cmd.CommandText = "INSERT INTO [dbo].[Emp] ([EmpName] , [Contact] , [DeptId] , [CompId] , [IsActive] , [Degn] , [Email_Int] , [Email_Ex] , [CreateDate] , [UserId] ) VALUES('" + empNAme + "', '" + contact + "'," + deptId + "," + CompId + "," + isActive + ",'" + desgn + "',' " + emailInt + "','" + emailExt + "', '" + DateTime.Now + "', 1)";
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
            Cn.Open();
            cmd.CommandText = "UPDATE [dbo].[Emp] SET [EmpName] = '" + empNAme + "', [Contact] = '" + contact + "', [DeptId] = " + deptId + ", [CompId] = " + CompId + ", [IsActive] = " + isActive + ", [Degn] = '" + desgn + "', [Email_Int] = '" + emailInt + "', [Email_Ex] =' " + emailExt + "' WHERE empID = " + empid + " ";
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
            SqlDataReader reader = cmd.ExecuteReader();
            dt.Load(reader);
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        Cn.Close();
    }


    public int getIdByName( string idColumnName,  string nameColumn,  string tableName,  string value)
    {
        int id=0;
        try
        {
            Cn.Open();
            cmd.CommandText = cmd.CommandText = "Select" + idColumnName + " From " + tableName + "Where" + nameColumn + " = '" + value + "'";
            id = Convert.ToInt16(cmd.ExecuteScalar());
           
        } 
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        
        Cn.Close();
        return id;
    }

    public void insertSupplier( string supplierName,  string Add,  string City,  string State,  string MobileNo,  string phoneNo,  string email,  int PaymentId,  int Pincode)
    {
        try
        {
            Cn.Open();
            cmd.CommandText = "INSERT INTO [dbo].[Supplier] ( [SupplierName] , [Address] , [City] , [State] , [MobileNo] , [PhoneNo] , [Email] , [PayTermId] , [Pincode] , [CreateDate] Values('" + supplierName + "', '" + Add + "', '" + City + "',  '" + State + "', '" + MobileNo + "', '" + phoneNo + "',  '" + email + "',  " + PaymentId + ",  " + Pincode + ",'" + DateTime.Now + "', 1)";
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