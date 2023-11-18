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

@WebServlet("/InstituteRegister")
public class InstituteRegister extends HttpServlet
{
	private static final long serialVersionUID = 1L;
    
	//CONNECTION OBJECT 
	Connection con=null;
	
	//CREATE VARIABLES FOR PARAMETERS
	String uid,pwd,ans,icode,iname,street,area,city,state,fname,lname,email,cgmt;
	int usert,qno,rows_change,contactno,pincode;
	
	
    public InstituteRegister()
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
		usert=Integer.parseInt(request.getParameter("usertype"));
		qno=Integer.parseInt(request.getParameter("questionno"));
		ans=request.getParameter("answer");
		
		//GET ALL PARAMETERS FOR INSTITUTE TABLE
		iname=request.getParameter("iname");
		icode=request.getParameter("icode");
		street=request.getParameter("street");
		area=request.getParameter("area");
		city=request.getParameter("city");
		state=request.getParameter("state");
		fname=request.getParameter("fname");
		lname=request.getParameter("lname");
		email=request.getParameter("email");
		cgmt="NO";
		contactno=Integer.parseInt(request.getParameter("cnum"));
		pincode=Integer.parseInt(request.getParameter("pincode"));
		
		PrintWriter out=response.getWriter();
		
		
		try 
		{
			//CALLING STORED PROCEDURE
			//TO STORTE VALUES IN LOGIN TABLE
			CallableStatement cs=  con.prepareCall("{call login_proc(?,?,?,?,?) }");
			cs.setString(1, uid);
			cs.setString(2, pwd);
			cs.setInt(3, usert);
			cs.setInt(4, qno);
			cs.setString(5, ans);
			
			//EXECUTING QUERY FOR LOGIN
			
			rows_change=cs.executeUpdate();
			
			if(rows_change==1)
			{
				out.print("inserted...");
			}
			else
			{
				out.print("not inserted...");
			}
				
			CallableStatement cs1=  con.prepareCall("{call institute_register(?,?,?,?,?,?,?,?,?,?,?,?,?) }");
			
			cs1.setString(1, icode);
			cs1.setString(2, iname);
			cs1.setString(3, street);
			cs1.setString(4, area);
			cs1.setInt(5, pincode);
			cs1.setString(6, city);
			cs1.setString(7, state);
			cs1.setString(8, fname);
			cs1.setString(9, lname);
			cs1.setString(10, email);
			cs1.setInt(11,contactno);
			cs1.setString(12,cgmt);
			cs1.setString(13,uid);
			
			//EXECUTING QUERY FOR INSTITUTE
			rows_change=0;
			
			rows_change=cs1.executeUpdate();
			
			if(rows_change==1)
			{
				out.print("inserted...");
				RequestDispatcher rd=request.getRequestDispatcher("/Login.html");
				rd.forward(request, response);
			}
			else
			{
				out.print("not inserted...");
				RequestDispatcher rd=request.getRequestDispatcher("/Error.jsp");
				rd.forward(request, response);
			}
			
			
			
		} catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
			RequestDispatcher rd=request.getRequestDispatcher("Error.jsp");
			rd.forward(request, response);	
		}
		
		
	}
	
	public void destroy() 
	{
		// TODO Auto-generated method stub
	}


}
