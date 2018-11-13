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
/// Summary description for clsEmpFlightTicket
/// </summary>
public class clsEmpFlightTicket : Connection 
{
    public static DataSet ds;
	public clsEmpFlightTicket()
	{
		
	}
    public int EmpTicketId { get; set; }
    public int EmpTravelId { get; set; }
    public int EmpId { get; set; }
    public int TicketNo { get; set; }
    public string BookedDate { get; set; }
    public string FromDate { get; set; }
    public string ToDate { get; set; }
    public string TicketFrom { get; set; }
    public string TicketTo { get; set; }
    public string SeatNo { get; set; }
    public string Name { get; set; }
    public string Bit { get; set; }
    public string TravelAgent { get; set; }
    public string InchargePerson { get; set; }
    public byte[] PersonImage { get; set; }
    public string PersonFile { get; set; }
    public string ContactNo { get; set; }

    public int InsertEmployeeTickets()
    {
        try
        {
            SqlParameter []p=new SqlParameter[17];
            p[0] = new SqlParameter("@EmployeeTravelId", EmpTravelId);
            p[1] = new SqlParameter("@EmployeeId", EmpId);
            p[2] = new SqlParameter("@TicketNo", TicketNo);
            p[3] = new SqlParameter("@TicketBookedDate", BookedDate);
            p[4] = new SqlParameter("@TicketAvailableFromDate", FromDate);
            p[5] = new SqlParameter("@TicketAvailableToDate", ToDate);
            p[6] = new SqlParameter("@TicketFrom", TicketFrom);
            p[7] = new SqlParameter("@TicketTo", TicketTo);
            p[8] = new SqlParameter("@SeatNo", SeatNo);
            p[9] = new SqlParameter("@Name", Name);
            p[10] = new SqlParameter("@Bit", Bit);
            p[11] = new SqlParameter("@TravelAgent", TravelAgent);
            p[12] = new SqlParameter("@InchargePerson", InchargePerson);
            p[13] = new SqlParameter("@PersonImage", PersonImage);
            p[14] = new SqlParameter("@PersonFile",PersonFile);
            p[15] = new SqlParameter("@ContactNo", ContactNo);
            p[16] = new SqlParameter("@Flag", SqlDbType.Int);
            p[16].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(Connection.con, CommandType.StoredProcedure, "spInsertEmployeeTickets", p);
            return Convert.ToInt32(p[16].Value);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public int ModifyEmployeeTickets()
    {
        try
       {
           SqlParameter[] p = new SqlParameter[16];
           p[0] = new SqlParameter("@EmployeeTicketId", EmpTicketId);
           p[1] = new SqlParameter("@TicketNo", TicketNo);
           p[2] = new SqlParameter("@TicketBookedDate", BookedDate);
           p[3] = new SqlParameter("@TicketAvailableFromDate", FromDate);
           p[4] = new SqlParameter("@TicketAvailableToDate", ToDate);
           p[5] = new SqlParameter("@TicketFrom", TicketFrom);
           p[6] = new SqlParameter("@TicketTo", TicketTo);
           p[7] = new SqlParameter("@SeatNo", SeatNo);
           p[8] = new SqlParameter("@Name", Name);
           p[9] = new SqlParameter("@Bit", Bit);
           p[10] = new SqlParameter("@TravelAgent", TravelAgent);
           p[11] = new SqlParameter("@InchargePerson", InchargePerson);
           p[12] = new SqlParameter("@PersonImage", PersonImage);
           p[13] = new SqlParameter("@PersonFile", PersonFile);
           p[14] = new SqlParameter("@ContactNo", ContactNo);
           p[15] = new SqlParameter("@Flag", SqlDbType.Int);
           p[15].Direction = ParameterDirection.Output;
           SqlHelper.ExecuteNonQuery(Connection.con, CommandType.StoredProcedure, "spUpdateEmployeeTickets", p);
           return Convert.ToInt32(p[15].Value);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet ShowEmployeeTickets()
    {
        try
        {
            ds = new DataSet();
            ds = SqlHelper.ExecuteDataset(Connection.con, CommandType.StoredProcedure, "Sp_Show_EmployeeTickets");
            return ds;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet DisplayFlightTickets()
    {
        try
        {
            ds = new DataSet();
            ds = SqlHelper.ExecuteDataset(Connection.con, CommandType.StoredProcedure, "spDiplayFilghtTickets");
            return ds;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public static DataSet GetEmployeeDataByTicketId(int TcId)
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@EmployeeTicketId", TcId);

            return SqlHelper.ExecuteDataset(Connection.con, CommandType.StoredProcedure, "GetEmployeeDataByTicketId", p);

        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public static DataSet GetTicketSearch(int TicketNo)
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@TicketNo", TicketNo);

            return SqlHelper.ExecuteDataset(Connection.con, CommandType.StoredProcedure, "spGetTicketSearch", p);

        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
}
