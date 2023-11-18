package Admin;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


@WebServlet("/UpdateInstituteFlag")
public class Update_InstituteFlag extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	
	//CONNECTION OBJECT 
    Connection con=null;
	
  //CREATE VARIABLES FOR PARAMETERS
	String C_code;
	String C_Flag,I_Flag;
	String NewC_code;
	
       
    
    public Update_InstituteFlag() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		
		con=(Connection)config.getServletContext().getAttribute("dbconnection");
	}

	
	public void destroy() {
		// TODO Auto-generated method stub
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		

		PrintWriter out=response.getWriter(); 
		
		  C_code=request.getParameter("old_code");
		  NewC_code=request.getParameter("new_code");
		  C_Flag="Yes";
		  I_Flag="No";
		  
			  
		try 
		{
		 PreparedStatement ps = con.prepareStatement("update institute set Head_Center=? where Institute_Code=?");
		 PreparedStatement ps1 = con.prepareStatement("update institute set Head_Center=? where Institute_Code=?");
			
	     ps.setString(1,I_Flag);
	     ps.setString(2,C_code);
	     
	     ps1.setString(1,C_Flag);
	     ps1.setString(2,NewC_code);
	     
		
		    
		     
		    int rows_change = 0;
		    int rowschange = 0;
			
		 	rows_change=ps.executeUpdate();
		 	rowschange=ps1.executeUpdate();
				
			 	
				
				if(rows_change==1)
				{
					RequestDispatcher rd=request.getRequestDispatcher("/AdminCM.jsp");
					rd.forward(request, response);
					out.print("updated");
				}
				else
				{
					RequestDispatcher rd=request.getRequestDispatcher("/Error.jsp");
					rd.forward(request, response);
					out.print("not inserted...");
				}
			
			
		}
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
			RequestDispatcher rd=request.getRequestDispatcher("Error.jsp");
			rd.forward(request, response);
		}
		
		
		
	
		
	

	}

}
