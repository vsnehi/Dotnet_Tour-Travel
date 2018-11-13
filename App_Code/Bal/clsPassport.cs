using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using TravelDesk.DAL;

/// <summary>
/// Summary description for clsPassport
/// </summary>
/// 

public class clsPassport:Connection 
{
    public static DataSet ds;
	public clsPassport()
	{
		
	}
    public int PassPortId { get; set; }
    public string PassPortNo { get; set; }
    public int EmpId { get; set; }
    public string Place { get; set; }
    public string Address { get; set; }
    public string IssuedDate { get; set; }
    public string ExpiryDate { get; set; }
    public bool Status { get; set; }
    public string Idetification { get; set; }
    public int Pages { get; set; }
    public string Country { get; set; }
    public string CitizenShip { get; set; }
    public byte[] Image { get; set; }
    public string ScannedFile { get; set; }
    public int EmployeeTravelId { get; set; }
    public string StartDate { get; set; }
    public string EndDate { get; set; }
    public int CountryId { get; set; }
    public string Special { get; set; }
    public int TypeId { get; set; }
    public string PerCountry { get; set; }
    public string Desc { get; set; }
    public string Documents { get; set; }
    public string Eligibility { get; set; }
    public string Rules { get; set; }
    public byte[] GuideLines { get; set; }
    public string GuideFile { get; set; }
    public double Cost { get; set; }
    public string PermitTime { get; set; }
    public byte[] ApplicationForm { get; set; }
    public string FormFile { get; set; }
    public string Remarks { get; set; }
    public string Count { get; set; }
    public string Reason { get; set; }
    public string FromDate { get; set; }
    public string ToDate { get; set; }
    public string Relieved { get; set; }
    public string Rejoined { get; set; }
    public string Deputation { get; set; }
    public string ApplyDate { get; set; }
    public int VisaApplyId { get; set; }
    public string DocFile { get; set; }
    public string SubmitDate { get; set; }
    public byte[] FormImage { get; set; }
    public byte[] DocImage { get; set; }
    public int DocumentId { get; set; }


    public int InsertEmployeePassport()
    {
        try
        {
            SqlParameter []p=new SqlParameter[14];
            p[0]=new SqlParameter("@PassportNo",PassPortNo);
            p[1]=new SqlParameter("@EmpId",EmpId );
            p[2]=new SqlParameter("@PlacePassport",Place);
            p[3]=new SqlParameter("@Address",Address);
            p[4]=new SqlParameter("@IssuedDate",IssuedDate);
            p[5]=new SqlParameter("@ExpiryDate",ExpiryDate);
            p[6]=new SqlParameter("@Status",Status);
            p[7]=new SqlParameter("@IdentificationMarks",Idetification);
            p[8]=new SqlParameter("@Pages",Pages);
            p[9]=new SqlParameter("@PassportCountry",Country);
            p[10]=new SqlParameter("@Citizenship",CitizenShip);
            p[11]=new SqlParameter("@ScannedImage",Image);
            p[12]=new SqlParameter("@ScannedFile",ScannedFile);
            p[13]=new SqlParameter("@Flag",SqlDbType.Int);
            p[13].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "spInsertPassport", p);
            return Convert.ToInt32(p[13].Value);
        }
        catch(Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public int InsertEmployeeTravel()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[6];
            p[0] = new SqlParameter("@EmpId", EmpId);
            p[1] = new SqlParameter("@TravelStartDate", StartDate);
            p[2] = new SqlParameter("@TravelEndDate", EndDate);
            p[3] = new SqlParameter("@CountryId", CountryId);
            p[4] = new SqlParameter("@SpecialInstruction", Special);
            p[5] = new SqlParameter("@Flag", SqlDbType.Int);
            p[5].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "spInsertEmployeeTravel", p);
            return Convert.ToInt32(p[5].Value);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public int InsertCountriesAndVisas()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[16];
            p[0] = new SqlParameter("@CountryId", CountryId);
            p[1] = new SqlParameter("@VisaTypeId", TypeId);
            p[2] = new SqlParameter("@PerCountry", PerCountry);
            p[3] = new SqlParameter("@VisaTypeDesc", Desc);
            p[4] = new SqlParameter("@SupporativeDocuments", Documents);
            p[5] = new SqlParameter("@Eligiblity", Eligibility);
            p[6] = new SqlParameter("@Rules", Rules);
            p[7] = new SqlParameter("@GuideLines", GuideLines);
            p[8] = new SqlParameter("@GuideFile", GuideFile);
            p[9] = new SqlParameter("@VisaCost", Cost);
            p[10] = new SqlParameter("@VisaPermitTime", PermitTime);
            p[11] = new SqlParameter("@ApplicationForm", ApplicationForm);
            p[12] = new SqlParameter("@FormFile", FormFile);
            p[13] = new SqlParameter("@Remarks", Remarks);
            p[14] = new SqlParameter("@CountofDocuments", Count);
            p[15] = new SqlParameter("@Flag", SqlDbType.Int);
            p[15].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "spInsertCountriesAndVisas", p);
            return Convert.ToInt32(p[15].Value);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public int InsertEmployeeAndVisa()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[16];
            p[0] = new SqlParameter("@VisaApplyDate",ApplyDate);
            p[1] = new SqlParameter("@EmpId", EmpId);
            p[2] = new SqlParameter("@passportId", PassPortId);
            p[3] = new SqlParameter("@CountryId", CountryId);
            p[4] = new SqlParameter("@VisaTypeId", TypeId);
            p[5] = new SqlParameter("@VisaStatus", Status);
            p[6] = new SqlParameter("@Remarks", Remarks);
            p[7] = new SqlParameter("@ReasonforApplying", Reason);
            p[8] = new SqlParameter("@FromDate", FromDate);
            p[9] = new SqlParameter("@ToDate", ToDate);
            p[10] = new SqlParameter("@RelievedDate", Relieved);
            p[11] = new SqlParameter("@RejoinedDate", Rejoined);
            p[12] = new SqlParameter("@EmployeeDeputation", Deputation);
            p[13] = new SqlParameter("@SupporativeDocuments", Documents);
            p[14] = new SqlParameter("@NameAndAddress", Address);
            p[15] = new SqlParameter("@Flag", SqlDbType.Int);
            p[15].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "spInsertEmployeeAndVisa", p);
            return Convert.ToInt32(p[15].Value);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }

    }
    public int InsertEmployeeAndVisaDetail()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[10];
            p[0] = new SqlParameter("@VisaApplyId", VisaApplyId);
            p[1] = new SqlParameter("@EmpId", EmpId);
            p[2] = new SqlParameter("@SupporativeDocuments",DocImage);
            p[3] = new SqlParameter("@DocFile", DocFile);
            p[4] = new SqlParameter("@FormFilledInfoImage", FormImage);
            p[5] = new SqlParameter("@FormFile", FormFile);
            p[6] = new SqlParameter("@Remarks", Remarks);
            p[7] = new SqlParameter("@ApprovedStatus", Status);
            p[8] = new SqlParameter("@SubmittedDate", SubmitDate);
            p[9] = new SqlParameter("@Flag", SqlDbType.Int);
            p[9].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "spInsertEmployeeAndVisaDetail", p);
            return Convert.ToInt32(p[9].Value);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }


    public int ModifyEmployeePassport()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[14];
            p[0] = new SqlParameter("@PassportId", PassPortId);
            p[1] = new SqlParameter("@PassportNo", PassPortNo);
            p[2] = new SqlParameter("@PlacePassport", Place);
            p[3] = new SqlParameter("@Address", Address);
            p[4] = new SqlParameter("@IssuedDate", IssuedDate);
            p[5] = new SqlParameter("@ExpiryDate", ExpiryDate);
            p[6] = new SqlParameter("@Status", Status);
            p[7] = new SqlParameter("@IdentificationMarks", Idetification);
            p[8] = new SqlParameter("@Pages", Pages);
            p[9] = new SqlParameter("@PassportCountry", Country);
            p[10] = new SqlParameter("@Citizenship", CitizenShip);
            p[11] = new SqlParameter("@ScannedImage", Image);
            p[12] = new SqlParameter("@ScannedFile", ScannedFile);
            p[13] = new SqlParameter("@Flag", SqlDbType.Int);
            p[13].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "spUPdatePassport", p);
            return Convert.ToInt32(p[13].Value);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public int ModifyEmployeeTravelDetails()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[5];
            p[0] = new SqlParameter("@EmployeeTravelId", EmployeeTravelId);
            p[1] = new SqlParameter("@TravelStartDate", StartDate);
            p[2] = new SqlParameter("@TravelEndDate", EndDate);
            p[3] = new SqlParameter("@SpecialInstruction", Special);
            p[4] = new SqlParameter("@Flag", SqlDbType.Int);
            p[4].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "spUpdateEmployeeTravel", p);
            return Convert.ToInt32(p[4].Value);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public int ModifyEmployeeVisa()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[13];
            p[0] = new SqlParameter("@VisaApplyId",VisaApplyId );
            p[1] = new SqlParameter("@VisaApplyDate", ApplyDate);
            p[2] = new SqlParameter("@VisaStatus", Status);
            p[3] = new SqlParameter("@Remarks", Remarks);
            p[4] = new SqlParameter("@ReasonforApplying", Reason);
            p[5] = new SqlParameter("@FromDate", FromDate);
            p[6] = new SqlParameter("@ToDate", ToDate);
            p[7] = new SqlParameter("@RelievedDate", Relieved);
            p[8] = new SqlParameter("@RejoinedDate", Rejoined);
            p[9] = new SqlParameter("@EmployeeDeputation", Deputation);
            p[10] = new SqlParameter("@SupporativeDocuments", Documents);
            p[11] = new SqlParameter("@NameAndAddress", Address);
            p[12] = new SqlParameter("@Flag", SqlDbType.Int);
            p[12].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "spUpdateEmployeeAndVisa", p);
            return Convert.ToInt32(p[12].Value);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }

    }
    public int ModifyEmployeeVisaDetail()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[9];
            p[0] = new SqlParameter("@SupporativeDocumentId", DocumentId);
            p[1] = new SqlParameter("@SupporativeDocuments", DocImage);
            p[2] = new SqlParameter("@DocFile", DocFile);
            p[3] = new SqlParameter("@FormFilledInfoImage", FormImage);
            p[4] = new SqlParameter("@FormFile", FormFile);
            p[5] = new SqlParameter("@Remarks", Remarks);
            p[6] = new SqlParameter("@ApprovedStatus", Status);
            p[7] = new SqlParameter("@SubmittedDate", SubmitDate);
            p[8] = new SqlParameter("@Flag", SqlDbType.Int);
            p[8].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "spUpdateEmployeeAndVisaDetail", p);
            return Convert.ToInt32(p[8].Value);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public DataSet DisplayEmployeePassport()
    {
        try
        {
            ds = new DataSet();
            ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "sp_DisplayEmployeePassport");
            return ds;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public DataSet GetPassportSearch(string a)
    {
        try
        {
            string str = "SELECT [PassportNo],[PlaceOfPassport],[Address],[IssuedDated],[ExpiryDated],[ECNRStatus],[IdentificationMarks],[NoofPages],[Country],[CitizenShipofEmployee] FROM tbl_EmployeesPassport WHERE [PassportNo] LIKE ('%"+a+"%')";
            return SqlHelper.ExecuteDataset(con, CommandType.Text, str);
            
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet DispalyEmployeeVisa()
    {
        try
        {
            string str = "Select * from tbl_EmployeeVisa";
            return SqlHelper.ExecuteDataset(con, CommandType.Text, str);
            
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet DisplayVisaDetail()
    {
        try
        {
            ds = new DataSet();
            ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "spDisplayVisaDetail");
            return ds;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    
     public DataSet ShowEmployeePassport()
    {
        try
        {
            ds = new DataSet();
            ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_EmployeePassport");
            return ds;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

     public DataSet DisplayEmployeeTravel()
     {
         try
         {
             ds = new DataSet();
             ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "spDispalyEmployeeTravel");
             return ds;
         }
         catch (Exception ex)
         {
             throw new ArgumentException(ex.Message);
         }
     }
     public DataSet ShowEmployeeTravel()
     {
         try
         {
             ds = new DataSet();
             ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_EmployeeTravel");
             return ds;
         }
         catch (Exception ex)
         {
             throw new ArgumentException(ex.Message);
         }
     }
     public DataSet ShowCountriesAndVisas()
     {
         try
         {
             ds = new DataSet();
             ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_CountriesAndVisas");
             return ds;
         }
         catch (Exception ex)
         {
             throw new ArgumentException(ex.Message);
         }
     }
     public DataSet ShowVisaEmployeeIds()
     {
         try
         {
             ds = new DataSet();
             ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "spShowVisaEmployeeIds");
             return ds;
         }
         catch (Exception ex)
         {
             throw new ArgumentException(ex.Message);
         }
     }
     public DataSet ShowEmployeeAndVisa()
     {
         try
         {
             ds = new DataSet();
             ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_EmployeeAndVisa");
             return ds;
         }
         catch (Exception ex)
         {
             throw new ArgumentException(ex.Message);
         }
     }
     public DataSet ShowEmployeeAndVisaDetail()
     {
         try
         {
             ds = new DataSet();
             ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_EmployeeAndVisaDetail");
             return ds;
         }
         catch (Exception ex)
         {
             throw new ArgumentException(ex.Message);
         }
     }
     public DataSet ShowEmployeeName()
     {
         try
         {
             ds = new DataSet();
             ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "spShowEmployeeName");
             return ds;
         }
         catch (Exception ex)
         {
             throw new ArgumentException(ex.Message);
         }
     }
     public DataSet ShowCountryName()
     {
         try
         {
             ds = new DataSet();
             ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "spShowCountryName");
             return ds;
         }
         catch (Exception ex)
         {
             throw new ArgumentException(ex.Message);
         }
     }

     public static DataSet GetPassportDataByPassportId(int PPId)
     {
         try
         {
             SqlParameter[] p = new SqlParameter[1];
             p[0] = new SqlParameter("@PassportId", PPId);

             return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "GetPassportDataByPassportId", p);

         }
         catch (Exception ex)
         {
             throw new ArgumentException(ex.Message);
         }
     }
     public static DataSet GetTravelDataByEmployeeTravelId(int TvId)
     {
         try
         {
             SqlParameter[] p = new SqlParameter[1];
             p[0] = new SqlParameter("@EmployeeTravelId", TvId);

             return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "GetTravelDataByEmployeeTravelId", p);

         }
         catch (Exception ex)
         {
             throw new ArgumentException(ex.Message);
         }
     }
     public static DataSet GetEmployeeDataByVisaApplyId(int ApId)
     {
         try
         {
             SqlParameter[] p = new SqlParameter[1];
             p[0] = new SqlParameter("@VisaApplyId", ApId);

             return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "GetEmployeeDataByVisaApplyId", p);

         }
         catch (Exception ex)
         {
             throw new ArgumentException(ex.Message);
         }
     }
     public static DataSet GetEmployeeDataBySupporativeDocumnetId(int SpId)
     {
         try
         {
             SqlParameter[] p = new SqlParameter[1];
             p[0] = new SqlParameter("@SupporativeDocumentId", SpId);

             return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "GetEmployeeDataBySupporativeDocumnetId", p);

         }
         catch (Exception ex)
         {
             throw new ArgumentException(ex.Message);
         }
     }
}

