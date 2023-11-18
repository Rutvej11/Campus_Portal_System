package utility;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;


@WebServlet("/StudentRegister")
public class StudentRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
	//CONNECTION OBJECT 
	Connection con=null;
		
	//CREATE VARIABLES FOR PARAMETERS
	String dob;
	String uid,pwd,ans,icode,iname,street,area,city,state,fname,mname,lname,email,plcmtstatus;
	int usert,qno,rows_change,contactno,pincode,mobileno,flag;
	long prnno;
	
    
    public StudentRegister()
    {
        super();
        // TODO Auto-generated constructor stub
    }

	
	public void init(ServletConfig config) throws ServletException
	{
		// TODO Auto-generated method stub
		//INSTANTIATE CON OBJECT 
		con=(Connection)config.getServletContext().getAttribute("dbconnection");
	}

	
	public void destroy()
	{
		// TODO Auto-generated method stub
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		
		//FOR BOTH LOGIN AND INSTITUTE TABLE 
		uid=request.getParameter("uid");
				
		//GET ALL PARAMETERS FOR LOGIN TABLE 
		pwd=request.getParameter("password");
		usert=1;
		qno=Integer.parseInt(request.getParameter("questionno"));
		ans=request.getParameter("answer");
		flag=0;
		
		//GET ALL PARAMETERS FOR STUDENT TABLE
		prnno=Long.parseLong(request.getParameter("prnno"));
		fname=request.getParameter("fname");
		mname=request.getParameter("mname");
		lname=request.getParameter("lname");
		mobileno=1234567890;
		dob=request.getParameter("dob");
		java.sql.Date dob1=null;
		try 
		{
			dob1 = new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(dob).getTime());
		}
		catch (ParseException e2) 
		{
			// TODO Auto-generated catch block
			e2.printStackTrace();
			
		}
		street="null";
		area="null";
		pincode=400001;
		city="null";
		state="null";
		iname=request.getParameter("iname");
		icode=request.getParameter("icode");
		email=request.getParameter("email");
		plcmtstatus="No";
		
		PrintWriter out=response.getWriter();
		
		try 
		{
			//CALLING STORED PROCEDURE
			//TO STORTE VALUES IN LOGIN TABLE
			CallableStatement cs=  con.prepareCall("{call student_register(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) }");
			cs.setDouble(1, prnno);
			cs.setString(2, fname);
			cs.setString(3, mname);
			cs.setString(4, lname);
			cs.setInt(5, mobileno);
			cs.setDate(6, dob1);
			cs.setString(7, street);
			cs.setString(8, area);
			cs.setInt(9, pincode);
			cs.setString(10,city);
			cs.setString(11,state);
			cs.setString(12,iname);
			cs.setString(13,icode);
			cs.setString(14,email);
			cs.setString(15,plcmtstatus);
			cs.setString(16, uid);
			cs.setInt(17, flag);
			
			
			//EXECUTING QUERY FOR LOGIN
			
			rows_change=cs.executeUpdate();
			
			if(rows_change==1)
			{
				out.print("student inserted...");
			}
			else
			{
				out.print("student not inserted...");
			}
		}
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
			/*RequestDispatcher rd=request.getRequestDispatcher("Error.jsp");
			rd.forward(request, response);*/
		}
		
			
		try 
		{
			//CALLING STORED PROCEDURE
			//TO STORTE VALUES IN LOGIN TABLE
			CallableStatement cs1=  con.prepareCall("{call login_proc(?,?,?,?,?) }");
			cs1.setString(1, uid);
			cs1.setString(2, pwd);
			cs1.setInt(3, usert);
			cs1.setInt(4, qno);
			cs1.setString(5, ans);
			
			//EXECUTING QUERY FOR LOGIN
			
			rows_change=cs1.executeUpdate();
			
			if(rows_change==1)
			{
				out.print("student inserted...");
				RequestDispatcher rd=request.getRequestDispatcher("/Login.html");
				rd.forward(request, response);
			}
			else
			{
				out.print("student not inserted...");
				RequestDispatcher rd=request.getRequestDispatcher("/Error.jsp");
				rd.forward(request, response);
			}
		}
		catch (SQLException e1) 
		{
			// TODO Auto-generated catch block
			e1.printStackTrace();
			RequestDispatcher rd=request.getRequestDispatcher("/Error.jsp");
			rd.forward(request, response);
			
		}
		
		
	}

}
