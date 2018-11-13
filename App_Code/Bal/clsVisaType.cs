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
/// Summary description for ClsVisaType
/// </summary>

///


public class clsVisaType : Connection
{
    public static DataSet ds;
	public clsVisaType()
	{
		
	}
    



    public int VisaTypeId { get; set; }
    public string Name { get; set; }
    public string Abbreviation { get; set; }
    public string Description { get; set; }
    public int HotelId { get; set; }
    public string  HotelName { get; set; }
    public string Address { get; set; }
    public string Phone { get; set; }
    public double MinCharge { get; set; }
    public double MaxCharge { get; set; }
    public int CountryId { get; set; }
    public byte[] Map { get; set; }
    public byte[] Flag { get; set; }
    public byte[] Video { get; set; }
    public string MapFile { get; set; }
    public string FlagFile { get; set; }
    public string VideoFile { get; set; }
    public int PassportId { get; set; }
    public int CountryVisitedId { get; set; }
    public string StampedDate { get; set; }
    public string Embassy { get; set; }
    public string FromDate { get; set; }
    public string ToDate { get; set; }
    public string CountryStamped { get; set; }
    public string Remarks { get; set; }
    public byte[] VisaStamp { get; set; }
    public string StampFile { get; set; }
    public byte[] VisaPaper { get; set; }
    public string PaperFile { get; set; }
    public int EmpId { get; set; }
    public int ForiegnEmbassyId { get; set; }
    public int EmployeeStayId { get; set; }
    public int EmployeeTravelId { get; set; }
    public string RoomNo { get; set; }
    public string Reservation { get; set; }
    public string VehicleNo { get; set; }
    public bool Status { get; set; }
    public string  Contact { get; set; }
    public byte[] PersonImage { get; set; }
    public string PersonFile { get; set; }
    public int EmpWorkDescId { get; set; }
    public string Project { get; set; }
    public string Reason { get; set; }
    public string Response { get; set; }
    public int DesgId { get; set; }
    public string WorkPermitInfo { get; set; }


    public int InsertVisaType()
    {
        try
        {
             SqlParameter []p=new SqlParameter[4];
             p[0]=new SqlParameter("@VisaTypeName",Name);
             p[1]=new SqlParameter("@Abbreviation",Abbreviation);
             p[2]=new SqlParameter("@Description",Description);
             p[3] = new SqlParameter("@Flag", SqlDbType.Int);
             p[3].Direction=ParameterDirection.Output;
             SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "spInsertVisaType", p);
             return Convert.ToInt32(p[3].Value);
            
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public int InsertHotels()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[7];
            p[0] = new SqlParameter("@HotelName", HotelName);
            p[1] = new SqlParameter("@HotelAddress", Address);
            p[2] = new SqlParameter("@HotelPhone", Phone);
            p[3] = new SqlParameter("@HotelContactPersonName", Name);
            p[4] = new SqlParameter("@HotelMinRentalcharges", MinCharge);
            p[5] = new SqlParameter("@HotelMaxRentalcharges", MaxCharge);
            p[6] = new SqlParameter("@Flag", SqlDbType.Int);
            p[6].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "spInsertHotels", p);
            return Convert.ToInt32(p[6].Value);

        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public int InsertCountries()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[10];
            p[0] = new SqlParameter("@CountryName", Name);
            p[1] = new SqlParameter("@CountryAbbr", Abbreviation);
            p[2] = new SqlParameter("@CountryDesc", Description);
            p[3] = new SqlParameter("@CountryMap", Map);
            p[4] = new SqlParameter("@CountryMapFile", MapFile);
            p[5] = new SqlParameter("@CountryFlag", Flag);
            p[6] = new SqlParameter("@CountryFlagFile", FlagFile);
            p[7] = new SqlParameter("@CountryVideo", Video);
            p[8] = new SqlParameter("@CountryVideoFile", VideoFile);
            p[9] = new SqlParameter("@Flag", SqlDbType.Int);
            p[9].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "spInsertCountries", p);
            return Convert.ToInt32(p[9].Value);

        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public int InsertCountriesHotels()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[3];
            p[0] = new SqlParameter("@CountryId", CountryId);
            p[1] = new SqlParameter("@HotelId", HotelId);
            p[2] = new SqlParameter("@Flag", SqlDbType.Int);
            p[2].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "spInsertCountriesHotels", p);
            return Convert.ToInt32(p[2].Value);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public int InsertCountriesVisited()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[14];
            p[0] = new SqlParameter("@PassPortId", PassportId);
            p[1] = new SqlParameter("@VisaStampedDate", StampedDate);
            p[2] = new SqlParameter("@EmbrasyDetails", Embassy);
            p[3] = new SqlParameter("@VisaTypeId", VisaTypeId);
            p[4] = new SqlParameter("@VisaValidDateFrom", FromDate);
            p[5] = new SqlParameter("@VisaValidDateTo", ToDate);
            p[6] = new SqlParameter("@CountryStamped", CountryStamped);
            p[7] = new SqlParameter("@Remarks", Remarks);
            p[8] = new SqlParameter("@ImageVisaStamp", VisaStamp);
            p[9] = new SqlParameter("@StampFile", StampFile);
            p[10] = new SqlParameter("@ImageVisaPaper", VisaPaper);
            p[11] = new SqlParameter("@PaperFile", PaperFile);
            p[12] = new SqlParameter("@EmpId", EmpId);
            p[13] = new SqlParameter("@Flag", SqlDbType.Int);
            p[13].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "spInsertCountriesVisited", p);
            return Convert.ToInt32(p[13].Value);

        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public int InsertForiegnEmbassy()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[5];
            p[0] = new SqlParameter("@CountryId", CountryId);
            p[1] = new SqlParameter("@EmbassyAddress", Address);
            p[2] = new SqlParameter("@EmbassyPerson", Name);
            p[3] = new SqlParameter("@EmbassyPhone", Phone);
            p[4] = new SqlParameter("@Flag", SqlDbType.Int);
            p[4].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "spInsertForiegnEmbassy", p);
            return Convert.ToInt32(p[4].Value);

        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public int InsertEmployeeStay()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[12];
            p[0] = new SqlParameter("@EmployeeTravelId", EmployeeTravelId);
            p[1] = new SqlParameter("@HotelId", HotelId);
            p[2] = new SqlParameter("@RoomNumber", RoomNo);
            p[3] = new SqlParameter("@ReservationNumber", Reservation);
            p[4] = new SqlParameter("@PickUpStatus", Status);
            p[5] = new SqlParameter("@VehicleNumber", VehicleNo);
            p[6] = new SqlParameter("@CountryId", CountryId);
            p[7] = new SqlParameter("@PersonContactNo", Contact);
            p[8] = new SqlParameter("@PersonName", Name);
            p[9] = new SqlParameter("@PersonImage", PersonImage);
            p[10] = new SqlParameter("@PersonFile", PersonFile);
            p[11] = new SqlParameter("@Flag", SqlDbType.Int);
            p[11].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "spInsertEmployeeStay", p);
            return Convert.ToInt32(p[11].Value);

        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public int InsertEmployeeWorkDescription()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[6];
            p[0] = new SqlParameter("@EmployeeId", EmpId);
            p[1] = new SqlParameter("@ProjectDetails", Project);
            p[2] = new SqlParameter("@ReasonDeputation", Reason);
            p[3] = new SqlParameter("@DeputationResponsibilities", Response);
            p[4] = new SqlParameter("@DesgId", DesgId);
            p[5] = new SqlParameter("@Flag", SqlDbType.Int);
            p[5].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "spInsertEmployeeWork", p);
            return Convert.ToInt32(p[5].Value);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public int InsertEmployeeWorkPermit()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[4];
            p[0] = new SqlParameter("@CountryId", CountryId);
            p[1] = new SqlParameter("@WorkPermitId", EmpWorkDescId);
            p[2] = new SqlParameter("@WorkPermitInfo", WorkPermitInfo);
            p[3] = new SqlParameter("@Flag", SqlDbType.Int);
            p[3].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "spInsertEmployeeWorkPermit", p);
            return Convert.ToInt32(p[3].Value);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }



    public int ModifyVisaTypeDetails()
    {

        try
        {
            SqlParameter[] p = new SqlParameter[5];

            p[0] = new SqlParameter("@VisaTypeId", VisaTypeId);
            p[1] = new SqlParameter("@VisaTypeName", Name);
            p[2] = new SqlParameter("@Abbreviation", Abbreviation);
            p[3] = new SqlParameter("@Description", Description);
            p[4] = new SqlParameter("@Flag", SqlDbType.Int);
            p[4].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "spUpdateVisaType", p);
            return Convert.ToInt32(p[4].Value);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public int ModifyHotels()
    {

        try
        {
            SqlParameter[] p = new SqlParameter[8];

            p[0] = new SqlParameter("@HotelId", HotelId);
            p[1] = new SqlParameter("@HotelName", HotelName);
            p[2] = new SqlParameter("@HotelAddress", Address);
            p[3] = new SqlParameter("@HotelPhone", Phone);
            p[4] = new SqlParameter("@HotelContactPersonName", Name);
            p[5] = new SqlParameter("@HotelMinRentalcharges", MinCharge);
            p[6] = new SqlParameter("@HotelMaxRentalcharges", MaxCharge);
            p[7] = new SqlParameter("@Flag", SqlDbType.Int);
            p[7].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "spUpdateHotel", p);
            return Convert.ToInt32(p[7].Value);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public int ModifyCountries()
    {

        try
        {
            SqlParameter[] p = new SqlParameter[11];

            p[0] = new SqlParameter("@CountryId", CountryId);
            p[1] = new SqlParameter("@CountryName", Name);
            p[2] = new SqlParameter("@CountryAbbr", Abbreviation);
            p[3] = new SqlParameter("@CountryDesc", Description);
            p[4] = new SqlParameter("@CountryMap", Map);
            p[5] = new SqlParameter("@CountryMapFile", MapFile);
            p[6] = new SqlParameter("@CountryFlag", Flag);
            p[7] = new SqlParameter("@CountryFlagFile", FlagFile);
            p[8] = new SqlParameter("@CountryVideo", Video);
            p[9] = new SqlParameter("@CountryVideoFile", VideoFile);
            p[10] = new SqlParameter("@Flag", SqlDbType.Int);
            p[10].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "spUpdateCountries", p);
            return Convert.ToInt32(p[10].Value);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public int ModifyCountriesVisited()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[12];
            p[0] = new SqlParameter("@CountryVisitedId", CountryVisitedId);
            p[1] = new SqlParameter("@VisaStampedDate", StampedDate);
            p[2] = new SqlParameter("@EmbrasyDetails", Embassy);
            p[3] = new SqlParameter("@VisaValidDateFrom", FromDate);
            p[4] = new SqlParameter("@VisaValidDateTo", ToDate);
            p[5] = new SqlParameter("@CountryStamped", CountryStamped);
            p[6] = new SqlParameter("@Remarks", Remarks);
            p[7] = new SqlParameter("@ImageVisaStamp", VisaStamp);
            p[8] = new SqlParameter("@StampFile", StampFile);
            p[9] = new SqlParameter("@ImageVisaPaper", VisaPaper);
            p[10] = new SqlParameter("@PaperFile", PaperFile);
            p[11] = new SqlParameter("@Flag", SqlDbType.Int);
            p[11].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "spUpdateCountriesVisited", p);
            return Convert.ToInt32(p[11].Value);

        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public int ModifyForiegnEmbassyDetails()
    {

        try
        {
            SqlParameter[] p = new SqlParameter[5];

            p[0] = new SqlParameter("@ForiegnEmbassyId", ForiegnEmbassyId);
            p[1] = new SqlParameter("@EmbassyAddress", Address);
            p[2] = new SqlParameter("@EmbassyPerson", Name);
            p[3] = new SqlParameter("@EmbassyPhone", Phone);
            p[4] = new SqlParameter("@Flag", SqlDbType.Int);
            p[4].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "spUpdateForiegnEmbassy", p);
            return Convert.ToInt32(p[4].Value);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public int ModifyEmployeeStay()
    {

        try
        {
            SqlParameter[] p = new SqlParameter[10];
            p[0] = new SqlParameter("@EmployeeStayId", EmployeeStayId);
            p[1] = new SqlParameter("@RoomNumber", RoomNo);
            p[2] = new SqlParameter("@ReservationNumber", Reservation);
            p[3] = new SqlParameter("@PickUpStatus", Status);
            p[4] = new SqlParameter("@VehicleNumber", VehicleNo);
            p[5] = new SqlParameter("@PersonContactNo", Contact);
            p[6] = new SqlParameter("@PersonName", Name);
            p[7] = new SqlParameter("@PersonImage", PersonImage);
            p[8] = new SqlParameter("@PersonFile", PersonFile);
            p[9] = new SqlParameter("@Flag", SqlDbType.Int);
            p[9].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "spUpdateEmployeeStay", p);
            return Convert.ToInt32(p[9].Value);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public int ModifyEmployeeWorkDescription()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[5];
            p[0]=new SqlParameter ("@EmpWorkDescId",EmpWorkDescId);
            p[1] = new SqlParameter("@ProjectDetails", Project);
            p[2] = new SqlParameter("@ReasonDeputation", Reason);
            p[3] = new SqlParameter("@DeputationResponsibilities", Response);
            p[4] = new SqlParameter("@Flag", SqlDbType.Int);
            p[4].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "spUpdateEmployeeWork", p);
            return Convert.ToInt32(p[4].Value);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }



    public DataSet ShowVisaType()
    {
        try
        {
            ds = new DataSet();
            ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_VisaType");
            return ds;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet ShowHotels()
    {
        try
        {
            ds = new DataSet();
            ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_Hotels");
            return ds;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet ShowCountries()
    {
        try
        {
            ds = new DataSet();
            ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_Countries");
            return ds;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet ShowCountriesHotels()
    {
        try
        {
            ds = new DataSet();
            ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_CountriesHotels");
            return ds;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet ShowCountriesVisited()
    {
        try
        {
            ds = new DataSet();
            ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_CountriesVisited");
            return ds;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet ShowForiegnEmbassy()
    {
        try
        {
            ds = new DataSet();
            ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_ForiegnEmbassy");
            return ds;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet ShowEmployeeStay()
    {
        try
        {
            ds = new DataSet();
            ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_EmployeeStay");
            return ds;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet DisplayEmployeeStay()
    {
        try
        {
            ds = new DataSet();
            ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "spDisplayEmployeeStay");
            return ds;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet ShowEmployeeWork()
    {
        try
        {
            ds = new DataSet();
            ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_EmployeeWork");
            return ds;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet ShowEmployeeWorkPermit()
    {
        try
        {
            ds = new DataSet();
            ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_EmployeeWorkPermit");
            return ds;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }



    public static DataSet GetVisaTypeDataByVisaTypeId(int VtId)
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@VisaTypeId", VtId);

            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "GetVisaTypeDataByVisaTypeId", p);

        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public static DataSet GetHotelDataByHotelId(int HtId)
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@HotelId", HtId);

            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "GetHotelDataByHotelId", p);

        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetCountryDataByCountryId()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@CountryId",CountryId);

            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "GetCountryDataByCountryId", p);

        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public static DataSet GetCountryVisitedDataByCountryVisitedId(int CtId)
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@CountryVisitedId", CtId);

            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "GetCountryVisitedDataByCountryVisitedId", p);

        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public static DataSet GetForiegnEmbassyDataByForiegnEmbassyId(int FgId)
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@ForiegnEmbassyId", FgId);

            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "GetForiegnEmbassyDataByForiegnEmbassyId", p);

        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public static DataSet GetEmployeeStayDataByEmployeeStayId(int StId)
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@EmployeeStayId", StId);

            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "GetEmployeeStayDataByEmployeeStayId", p);

        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public static DataSet GetEmployeeWorkDataByEmployeeWorkId(int WkId)
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@EmpWorkDescId", WkId);

            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "GetEmployeeWorkDataByEmployeeWorkId", p);

        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

}
