package Student;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;




@WebServlet("/GenerateSchedule2")
public class GenerateSchedule2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	//CONNECTION OBJECT 
	Connection con=null;
	
	int cid;
	
    public GenerateSchedule2() {
        super();
        // TODO Auto-generated constructor stub
    }

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		//INSTANTIATE CON OBJECT 
		con=(Connection)config.getServletContext().getAttribute("dbconnection");
	}

	public void destroy() {
		// TODO Auto-generated method stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//TO CREATE PRINTWRITER OBJECT
		PrintWriter out=response.getWriter();
		
		//TAKE COMPANY ID 
		cid=Integer.parseInt(request.getParameter("cid"));
		
		out.print(cid);
		
		//CREATE QUERY TO FETCH ALL INFORMATION ABOUT SCHEDULED COMPANY
		PreparedStatement ps;
		ResultSet rs;
		
		try 
		{
			ps = con.prepareStatement("select c.Company_Name,c.Company_Domain,c.Street,c.Area,c.Pincode,c.City,c.State,c.Company_Description,c.email" +
					",cr.Job_Profile,cr.Salary,cr.Venue,cr.Date_Info,cr.Time_Info from company as c,company_requirement as cr " +
					"where c.Company_ID=? and cr.Company_ID=?");
			
			ps.setInt(1, cid);
			ps.setInt(2, cid);
			
			//out.println("1");
			
			//EXECUTING QUERY
			rs=ps.executeQuery();
			//out.println("1");
			
			//CREATE ARRAY LIST TO STORE SCHEDULE OBJECT
			ArrayList<Schedule> sc=new ArrayList<Schedule>();
			
			//CREATE OBJECT OF SCHEDULE
			Schedule sch;
			
			while(rs.next())
			{
				sch=new Schedule(cid, rs.getInt(5), rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(6),
						rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(12), rs.getString(14), rs.getDouble(11),
						rs.getDate(13));
				
				
				sc.add(sch);
				
			}
			
			//CREATE SESSION OF SCHEDULE OBJECT
			HttpSession session=request.getSession();
			session.setAttribute("SCH", sc);
			
			//FORWARD REQUEST TO VIEW SCHEDULING PAGE
			RequestDispatcher rd=request.getRequestDispatcher("/View_Schedule_2.jsp");
			rd.forward(request, response);
			
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
