package utility;

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
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/ForgetPassword")
public class ForgetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	//CONNECTION OBJECT 
	Connection con=null;
		
	//CREATE VARIABLES FOR PARAMETERS
	String uid,pwd,ans;
	int usertype,qno,rows_change;
	
    public ForgetPassword() 
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
		
		uid="admin@";
		pwd="null";
		usertype=2;
		qno=1;
		ans="pune";
		
		
		CallableStatement cs1;
		try 
		{
			cs1 = con.prepareCall("{call check_forgetpwd(?,?,?,?,?) }");
			
			
			cs1.setString(1, uid);
			cs1.setInt(2, usertype);
			cs1.setInt(3, qno);
			cs1.setString(4, ans);
			//cs1.registerOutParameter(5, pwd);
			
			
			PrintWriter out=response.getWriter();
			
			//EXECUTING QUERY FOR INSTITUTE
			rows_change=0;
			
			ResultSet rs=cs1.executeQuery();
			
			if(pwd!="null")
			{
				out.print("Changed...");
			}
			else
			{
				out.print("Not changed...");
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
