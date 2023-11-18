package Student;

import java.io.IOException;
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

@WebServlet("/GenerateGraduation")
public class GenerateGraduation extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
	//CONNECTION OBJECT 
	Connection con=null;
	
	Double prn;
   
    public GenerateGraduation() 
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
		
		//TAKE PRN FROM SESSION	
		HttpSession session=request.getSession();
		
		//GET PRN
		prn=Double.parseDouble(session.getAttribute("PRN").toString());
		
		//CREATE QUERY TO FETCH DATA FROM STUDENT_ACADEMIC TABLE
		PreparedStatement ps;
		try 
		{
			ps = con.prepareStatement("select * from student_graduation where Prn_No= ?");
			ps.setDouble(1, prn);
			
			//EXECUTING QUERY
			ResultSet rs=ps.executeQuery();
			
			//CREATE ARRAY LIST TO TAKE INFORMATION
			ArrayList<Graduation> grd=new ArrayList<Graduation>();
			Graduation grc;
			
			while(rs.next())
			{
				grc=new Graduation(rs.getDouble(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7),
								 rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getInt(11), rs.getInt(12), rs.getInt(13), rs.getInt(14),
								 rs.getInt(15), rs.getInt(16), rs.getInt(17), rs.getInt(18), rs.getInt(19), rs.getFloat(20));
				
				grd.add(grc);
			}
			
			HttpSession acdemic=request.getSession();
			acdemic.setAttribute("graduation", grd);
			
			//FORWARD TO ACADEMIC DETAILS
			RequestDispatcher rd=request.getRequestDispatcher("Graduation_Details.jsp");
			rd.forward(request, response);
			
		}
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
