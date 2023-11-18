package Company;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;


@WebServlet("/CompanyRequirement")
public class CompanyRequirement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	//CONNECTION OBJECT 
	Connection con=null;
	
	//TAKE ALL PARAMETERS
	int cid,rounds;
	Date d;
	float tenth,twelth,degree;
	Double salary;
	String jobprofile,roundsinfo,venue,itime,Flag,dt;
	
    public CompanyRequirement() {
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
		
		HttpSession session=request.getSession();
		
		//TAKE ALL PARAMETERS
		cid=Integer.parseInt(session.getAttribute("Cid").toString());
		rounds=4;
		jobprofile=request.getParameter("job");
		salary=Double.parseDouble(request.getParameter("salary"));
		tenth=Float.parseFloat(request.getParameter("tenth"));
		twelth=Float.parseFloat(request.getParameter("twelth"));
		degree=Float.parseFloat(request.getParameter("degree"));
		roundsinfo=request.getParameter("apti")+","+request.getParameter("gd")+","+request.getParameter("ti")+","+request.getParameter("hr");
		venue=request.getParameter("venue");
		dt=request.getParameter("idate");
		try 
		{
			d=new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(dt).getTime());
		}
		catch (ParseException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		itime=request.getParameter("itime")+" "+request.getParameter("tm");
		Flag="No";
		
		//CREATE QUERY TO INSERT DATA INTO COMPANY REQUIREMENT TABLE
		PreparedStatement ps;
		RequestDispatcher rd;
		try 
		{
			ps = con.prepareStatement("insert into company_requirement values(?,?,?,?,?,?,?,?,?,?,?,?)");
			
			ps.setInt(1, cid);
			ps.setString(2, jobprofile);
			ps.setDouble(3, salary);
			ps.setFloat(4, tenth);
			ps.setFloat(5, twelth);
			ps.setFloat(6, degree);
			ps.setInt(7, rounds);
			ps.setString(8, roundsinfo);
			ps.setString(9, venue);
			ps.setDate(10, d);
			ps.setString(11, itime);
			ps.setString(12, Flag);
			
			int rows=ps.executeUpdate();
			
			if(rows==1)
			{
				//FORWARD TO REQUIREMENT SUBMIT 
				rd=request.getRequestDispatcher("Requirement_Submit.jsp");
				rd.forward(request, response);
			}
			else
			{
				//FORWARD TO REQUIREMENT SUBMIT DETAILS
				rd=request.getRequestDispatcher("Requirement_Submit.jsp");
				rd.forward(request, response);
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
	}

}
