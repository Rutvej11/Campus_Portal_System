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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


@WebServlet("/GivingRequirement")
public class GivingRequirement extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//CONNECTION OBJECT 
	Connection con=null;
	
	//CREATE VARIABLES FOR PARAMETERS
	String Cid,pwd;
	
	
    public GivingRequirement() {
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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		
		HttpSession session=request.getSession();
		Cid=session.getAttribute("Cid").toString();
		
		//TO CHECK WHTHER REQUIRMENT IS GIVEN ALREADY OR NOT
		PreparedStatement ps;
		ResultSet rs;
		RequestDispatcher rd;
		
		try 
		{
			ps = con.prepareStatement("select Flag from company_requirement where Company_ID=?");
			ps.setString(1,Cid);
			rs=ps.executeQuery();
			
			
			
				//REQUIREMENT IS NOT GIVEN
				if(rs.first())
				{
					//FORWARD TO REQUIREMENT SUBMITTED PAGE
					rd= request.getRequestDispatcher("/Requirement_Submit.jsp");
					rd.forward(request, response);
				}
				//REQUIREMENT IS GIVEN
				else
				{
					//FORWARD TO REQUIREMENT PAGE
					rd= request.getRequestDispatcher("/Company_Requirement.jsp");
					rd.forward(request, response);
				}
			
			
			
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
