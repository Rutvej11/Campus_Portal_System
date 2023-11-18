package utility;

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
import java.util.ArrayList;

@WebServlet("/Student_Registration")
public class InstituteNameandCodeGenrator extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
	Connection con=null;
    public InstituteNameandCodeGenrator()
    {
        super();
        // TODO Auto-generated constructor stub
    }
    
	@Override
	public void init(ServletConfig config) throws ServletException 
	{
		// TODO Auto-generated method stub
		super.init();
		
		con=(Connection)config.getServletContext().getAttribute("dbconnection");
	}
	
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<String>al;
		ArrayList<Integer>al1;
		
		try 
		{
			PreparedStatement ps=con.prepareStatement("Select Institute_Name,Institute_Code from institute");
			//execute query
			ResultSet rs=ps.executeQuery();
			
			al=new ArrayList<String>();
			al1=new ArrayList<Integer>();
			
			while(rs.next())
			{
				
				String name=rs.getString(1);
				 int icode=rs.getInt(2);
				al.add(name);
				al1.add(icode);
				
			}
			
			
			 HttpSession session=request.getSession();
			 session.setAttribute("Iname",al);
			 session.setAttribute("Icode",al1);
			
			
			RequestDispatcher rd=request.getRequestDispatcher("/Student_register.jsp");
			rd.forward(request, response);
		}
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
			/*RequestDispatcher rd=request.getRequestDispatcher("Error.jsp");
			rd.forward(request, response);*/
		}
	}
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		super.destroy();
	}

}
