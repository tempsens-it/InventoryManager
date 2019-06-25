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

        Cn = new SqlConnection("server=ASTUSER1/SQLEXPRESS;user id= sa;password=admin@123;database=AutoCal");
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
        cmd.CommandText = "INSERT INTO " + tableName + "(" + columnName + " , createDate,UserID) Values ('" + value + "', ' " + DateTime.Now + "', 1)";
        cmd.ExecuteNonQuery();

    }

    public void insert(ref string tableName, ref string columnName, ref int columnName2, ref string value, ref string value2)
    {
        cmd.CommandText = "INSERT INTO " + tableName + "(" + columnName + " ," + columnName2 + " , createDate,UserID) Values ('" + value + "'," + value + " ' " + DateTime.Now + "', 1)";
        cmd.ExecuteNonQuery();

    }

    public void Update(ref string tableName, ref string columnName, ref string value)
    {
        cmd.CommandText = "Update " + tableName + "SET" + columnName + " = '" + value + "'";
        cmd.ExecuteNonQuery();

    }

    public void Delete(ref string tableName, ref string columnName, ref string value)
    {
        cmd.CommandText = "Delete From " + tableName + "Where" + columnName + " = '" + value + "'";
        cmd.ExecuteNonQuery();
    }


    public void Select(ref string tableName, ref string columnName, ref string columnName1, ref string value)
    {
        DataTable dt = new DataTable();

        cmd.CommandText = "Select" + columnName + " From " + tableName + "Where" + columnName1 + " = '" + value + "'";
        SqlDataReader reader = cmd.ExecuteReader();
        dt.Load(reader);
    }


    public void insertEmp(ref string empNAme, ref string contact, ref int deptId, ref int CompId, ref int isActive, ref string desgn, ref string emailInt, ref string emailExt)
    {
        cmd.CommandText = "INSERT INTO [dbo].[Emp] ([EmpName] , [Contact] , [DeptId] , [CompId] , [IsActive] , [Degn] , [Email_Int] , [Email_Ex] , [CreateDate] , [UserId] ) VALUES('" + empNAme + "', '" + contact + "'," + deptId + "," + CompId + "," + isActive + ",'" + desgn + "',' " + emailInt + "','" + emailExt + "', '" + DateTime.Now + "', 1)";
        cmd.ExecuteNonQuery();

    }
    public void UpdateEmp(ref string empNAme, ref string contact, ref int deptId, ref int CompId, ref int isActive, ref string desgn, ref string emailInt, ref string emailExt, ref int empid)
    {

        cmd.CommandText = "UPDATE [dbo].[Emp] SET [EmpName] = '" + empNAme + "', [Contact] = '" + contact + "', [DeptId] = " + deptId + ", [CompId] = " + CompId + ", [IsActive] = " + isActive + ", [Degn] = '" + desgn + "', [Email_Int] = '" + emailInt + "', [Email_Ex] =' " + emailExt + "' WHERE empID = " + empid + " ";
        cmd.ExecuteNonQuery();

    }

    public void SelectAllColumnsById(ref string tableName, ref string columnName, ref int value)
    {
        DataTable dt = new DataTable();
        cmd.CommandText = "Select * From " + tableName + "Where" + columnName + " = " + value + "";
        SqlDataReader reader = cmd.ExecuteReader();
        dt.Load(reader);
    }


    public int getIdByName(ref string idColumnName, ref string nameColumn, ref string tableName, ref string value)
    {
        cmd.CommandText = cmd.CommandText = "Select" + idColumnName + " From " + tableName + "Where" + nameColumn + " = '" + value + "'";
        var id = cmd.ExecuteScalar();
        return Convert.ToInt16(id);
    }

    public void insertSupplier(ref string supplierName, ref string Add, ref string City, ref string State, ref string MobileNo, ref string phoneNo, ref string email, ref int PaymentId, ref int Pincode)
    {
        cmd.CommandText = "INSERT INTO [dbo].[Supplier] ( [SupplierName] , [Address] , [City] , [State] , [MobileNo] , [PhoneNo] , [Email] , [PayTermId] , [Pincode] , [CreateDate] Values('" + supplierName + "', '" + Add + "', '" + City + "',  '" + State + "', '" + MobileNo + "', '" + phoneNo + "',  '" + email + "',  " + PaymentId + ",  " + Pincode + ",'" + DateTime.Now + "', 1)";
        cmd.ExecuteNonQuery();

    }

    public void UpdateSupplier(ref string supplierName, ref string Add, ref string City, ref string State, ref string MobileNo, ref string phoneNo, ref string email, ref int PaymentId, ref int Pincode, ref int supplierId)
    {
        cmd.CommandText = " UPDATE [dbo].[Supplier] SET[SupplierName] = '" + supplierName + "' ,[Address] ='" + Add + "' ,[City] ='" + City + "'  ,[State] = '" + State + "' ,[MobileNo] =  ,[PhoneNo] ='" + MobileNo + "'  ,[Email] =  ,[PayTermId] = " + PaymentId + " ,[Pincode] = " + Pincode + " ,[CreateDate] = '" + DateTime.Now + "' ,[UserId] = 1  WHERE SupplierId = " + supplierId + " ";
        cmd.ExecuteNonQuery();

    }



    public void UpdatePayMentTerms(ref string paymentTems, ref int NoofDays, int paymentTermId)
    {
        cmd.CommandText = "UPDATE [dbo].[PaymentTerms] SET [TermDesc] = '" + paymentTems + "',[NoOfDays] = " + NoofDays + ",[CreateDate] =' " + DateTime.Now + "' , [UserId] = 1 WHERE paymentTermId = " + paymentTermId + "";
        cmd.ExecuteNonQuery();

    }


    public void insertSupplierContact(ref string supplierId, ref string SuprCntName, ref string Degn, ref string State, ref string MobileNo, ref string phoneNo, ref string email, ref int PaymentId, ref int Pincode)
    {
        cmd.CommandText = "INSERT INTO [dbo].[SupplierCnt] ([SupplierId] ,[SuprCntName] ,[Degn] ,[MobileNo] ,[Email] ,[UserId] ,[CreateDate] ) VALUES(" + supplierId + ", '" + SuprCntName + "', '" + Degn + "',   '" + MobileNo + "',   '" + email + "',   1 ,'" + DateTime.Now + "',)";
        cmd.ExecuteNonQuery();

    }

    public void UpdateSupplierContact(ref string supplierCntName, ref string Degn, ref string MobileNo, ref string email, ref int SupplierCntId)
    {
        cmd.CommandText = "  UPDATE [dbo].[SupplierCnt] SET [SuprCntName]  = '" + supplierCntName + "' ,[Degn] ='" + Degn + "' ,[MobileNo] = '" + MobileNo + "' ,[Email] = '" + email + "' ,[CreateDate] = '" + DateTime.Now + "' ,[UserId] = 1  WHERE SupplierCntId = " + SupplierCntId + " ";
        cmd.ExecuteNonQuery();
    }


    public void insertPartMaster(ref string partname, ref string Desc, ref int CatId)
    {
        cmd.CommandText = "INSERT INTO [dbo].[PartMaster] ([PartName] ,[CatId] ,[Description] ,[CreateDate] ) VALUES ('" + partname + "'," + CatId + ",'" + Desc + "', ' " + DateTime.Now + "', 1)"; 
        cmd.ExecuteNonQuery();

    }

    public void UpdatePartMaster(ref string partname, ref string Desc, ref int CatId, ref int partId)
    {
        cmd.CommandText = "UPDATE [dbo].[PartMaster] SET[PartName] = '" + partname + "' ,[CatId]  =" + CatId + " ,[Description] = '" + Desc + "' ,[CreateDate] = '" + DateTime.Now + "' ,[UserId] = 1  WHERE partID = " + partId + " ";
         cmd.ExecuteNonQuery();
    }

    public void insertPartConfig(ref int partId,ref string Spec1, ref string Spec2, ref string Spec3, ref string Desc)
    {
        cmd.CommandText = " INSERT INTO[dbo].[PartConfig] ([PartId] ,[Spec1] ,[Spec2] ,[Spec3] ,[Description] ,[CreateDate] ,[UserId]) VALUES (" + partId + ",'" + Spec1 + "','" + Spec2 + "','" + Spec3 + "','" + Desc + "', ' " + DateTime.Now + "', 1)";
        cmd.ExecuteNonQuery();
    }

    public void UpdatePartConfig(ref string partid, ref string Desc, ref string Spec1, ref string Spec2, ref string Spec3,  ref int PartConfigId)
    {
        cmd.CommandText = "UPDATE [dbo].[PartConfig] SET[PartId] = " + partid+ " ,[Spec1]  ='" + Spec1 + "' ,[Spec2]  ='" + Spec2 + "' ,[Spec3]  ='" + Spec3 + "' ,[Description] = '" + Desc + "' ,[CreateDate] = '" + DateTime.Now + "' ,[UserId] = 1  WHERE PartConfigId = " + PartConfigId + " ";
        cmd.ExecuteNonQuery();
    }


    public void insertTransHead(ref int compId, ref string InvcNum, ref int suppilerId, ref int paymentId,, ref DateTime InvcDate)
    {
        cmd.CommandText = "INSERT INTO[dbo].[TransHead] ([CompId] ,[InvcNo] ,[InvcDate] ,[SupplierId] ,[paymentTermId] ,[TransDate] ,[CreateDate] ,[UserId] ) VALUES (" + compId + ",'" + InvcNum + "','" + InvcDate + "'," + suppilerId + "," + paymentId + ", ' " + DateTime.Now + "',' " + DateTime.Now + "', 1)";
        
        cmd.ExecuteNonQuery();
    }

    public void UpdateTransHead(ref int compId, ref string InvcNum, ref int suppilerId, ref int paymentId, ref DateTime InvcDate, ref int tranHeadId,)
    {
        cmd.CommandText = " UPDATE[dbo].[TransHead] SET[CompId] = " + compId + " ,[InvcNo]   ='" + InvcNum + "' ,[InvcDate]   ='" + InvcDate + "' ,[SupplierId] =" + suppilerId + " ,[paymentTermId]  =" + paymentId + " ,[TranDate] = '" + DateTime.Now + "' ,[CreateDate] = '" + DateTime.Now + "' ,[UserId] = 1  WHERE PartConfigId = " + tranHeadId + " ";
                cmd.ExecuteNonQuery();
    }


    public void insertTransDetail(ref int TransHeadId, ref int LineNo, ref int partConfigId, ref int BrandId, ref int EmpId, ref Double qty, ref Double price, ref Double tax, ref Double discount, ref string Srno, ref string Desc)
    {
        cmd.CommandText = "INSERT INTO[dbo].[TransDetail] ([TransHeadId] ,[LineNo] ,[PartConfigId] ,[Desc] ,[BrandId] ,[EmpId] ,[SrNo] ,[Quantity] ,[Price] ,[Tax] ,[Discount] ,[CreateDate] ,[UserId] ) VALUES (" + TransHeadId + "," + LineNo + "," + partConfigId + ",'" + Desc + "'," + BrandId + "," + EmpId + " ,'" + Srno + "'," + qty + "," + price + "," + tax + "," + discount + ",' " + DateTime.Now + "', 1)";
                                                                                                                                                     // <TransHeadId ,<LineNo ,<PartConfigId ,<Desc ,<BrandId ,<EmpId ,<SrNo ,<Quantity ,<Price ,<Tax ,<Discount ,<CreateDate ,<UserId )
        cmd.ExecuteNonQuery();
    }

    //public void UpdateTransDetail(ref string partid, ref string Desc, ref string Spec1, ref string Spec2, ref string Spec3, ref int PartConfigId)
    //{
    //    cmd.CommandText = "UPDATE [dbo].[PartConfig] SET[PartId] = " + partid + " ,[Spec1]  ='" + Spec1 + "' ,[Spec2]  ='" + Spec2 + "' ,[Spec3]  ='" + Spec3 + "' ,[Description] = '" + Desc + "' ,[CreateDate] = '" + DateTime.Now + "' ,[UserId] = 1  WHERE PartConfigId = " + PartConfigId + " ";
    //    cmd.ExecuteNonQuery();
    //}


    //public void insertIssueDetails(ref int partId, ref string Spec1, ref string Spec2, ref string Spec3, ref string Desc)
    //{
    //    cmd.CommandText = " INSERT INTO [dbo].[PartConfig] ([PartId] ,[Spec1] ,[Spec2] ,[Spec3] ,[Description] ,[CreateDate] ,[UserId]) VALUES (" + partId + ",'" + Spec1 + "','" + Spec2 + "','" + Spec3 + "','" + Desc + "', ' " + DateTime.Now + "', 1)";

    //    cmd.ExecuteNonQuery();
    //}

    //public void UpdateIssueDetails(ref string partid, ref string Desc, ref string Spec1, ref string Spec2, ref string Spec3, ref int PartConfigId)
    //{
    //    cmd.CommandText = "UPDATE [dbo].[PartConfig] SET[PartId] = " + partid + " ,[Spec1]  ='" + Spec1 + "' ,[Spec2]  ='" + Spec2 + "' ,[Spec3]  ='" + Spec3 + "' ,[Description] = '" + Desc + "' ,[CreateDate] = '" + DateTime.Now + "' ,[UserId] = 1  WHERE PartConfigId = " + PartConfigId + " ";
    //    cmd.ExecuteNonQuery();
    //}
}













































//public void insertPayMentTerms(ref string paymentTems, ref int NoofDays)
//{
//    cmd.CommandText = "INSERT INTO[dbo].[PaymentTerms] ([TermDesc] ,[NoOfDays] ,[CreateDate] ,[UserId] VALUES ('" + paymentTems + "'," + NoofDays + ", ' " + DateTime.Now + "', 1)";
//    cmd.ExecuteNonQuery();
//INSERT INTO[dbo].[SupplierCnt] ([SupplierId] ,[SuprCntName] ,[Degn] ,[MobileNo] ,[Email] ,[UserId] ,[CreateDate] ) VALUES(<SupplierId ,<SuprCntName ,<Degn ,<MobileNo, varchar(50), ,<Email ,<UserId ,<CreateDate
//}