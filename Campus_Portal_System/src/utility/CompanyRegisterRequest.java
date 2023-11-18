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
import java.util.UUID;


@WebServlet("/CompanyRegister")
public class CompanyRegisterRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	//CONNECTION OBJECT 
	Connection con=null;
	
	//CREATE VARIABLES FOR PARAMETERS
	String company_name,company_domain,street,area,city,state,company_description,uid,unique,flag,email;
	int pincode,company_id,rows_change;
	
	
    public CompanyRegisterRequest() 
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
		
		//GET ALL PARAMETERS FOR COMPANY TABLE 
		company_name=request.getParameter("company_name");
		company_id=Integer.parseInt(request.getParameter("company_id"));
		company_domain=request.getParameter("company_domain");
		area=request.getParameter("area");
		street=request.getParameter("street");
		state=request.getParameter("state");
		city=request.getParameter("city");
		company_description=request.getParameter("company_description");
		pincode=Integer.parseInt(request.getParameter("pincode"));
		flag="No";
		email=request.getParameter("email");
		
		//TO GENERATE UID AND PASSWORD AUTOMATICALLY
		unique = UUID.randomUUID().toString();
		uid=unique.substring(28);
		
		
		PrintWriter out=response.getWriter();
		
		//out.println(company_name+" "+company_id+" "+company_domain+" "+area+" "+street+" "+state+" "+city+" "+company_description);
		//out.println(pincode+" "+company_contact);
		//out.print(uid);
		
		
		//CALLING STORED PROCEDURE
		//TO STORTE VALUES IN COMPANY TABLE
		
		
		CallableStatement cs1;
		try 
		{
			cs1 = con.prepareCall("{call company_register(?,?,?,?,?,?,?,?,?,?,?,?) }");
			
			cs1.setInt(1, company_id);
			cs1.setString(2, company_name);
			cs1.setString(3, company_domain);
			cs1.setString(4, street);
			cs1.setString(5, area);
			cs1.setInt(6,pincode);
			cs1.setString(7, state);
			cs1.setString(8, city);
			cs1.setString(9, company_description);
			cs1.setString(10, uid);
			cs1.setString(11, flag);
			cs1.setString(12, email);
			
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
			
			
			
		}
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
			/*RequestDispatcher rd=request.getRequestDispatcher("Error.jsp");
			rd.forward(request, response);*/
			
			
		}
		
		
		
		
		
	}

}
