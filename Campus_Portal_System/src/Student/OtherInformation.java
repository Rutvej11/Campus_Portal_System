package Student;

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
import java.sql.SQLException;

@WebServlet("/OtherInformation")
public class OtherInformation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	//CONNECTION OBJECT 
	Connection con=null;
	
	Double prn;
	String hobbies,lang,extra,technical,jobexp;
	
    
    public OtherInformation() {
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
		
		//GET ALL PARAMETERS
		hobbies=request.getParameter("hobbies");
		lang=request.getParameter("language_known");
		extra=request.getParameter("extra_curricular");
		technical=request.getParameter("technical_certification");
		jobexp=request.getParameter("job");
		
		//CREATE QUERY TO INSERT DATA INTO STUDENT_ACADEMIC TABLE
		PreparedStatement ps;
		 
		try 
		{
			ps=con.prepareStatement("insert into other_information values (?,?,?,?,?,?)");
			
			ps.setDouble(1, prn);
			ps.setString(2, hobbies);
			ps.setString(3, lang);
			ps.setString(4, extra);
			ps.setString(5,technical);
			ps.setString(6, jobexp);
			
			//EXECUTING QUERY
			int rows=ps.executeUpdate();
			RequestDispatcher rd;
			
			if(rows==1)
			{
				//FORWARD TO ACADEMIC DETAILS
				rd=request.getRequestDispatcher("ProfileCreated.jsp");
				rd.forward(request, response);
			}
			else
			{
				rd=request.getRequestDispatcher("Error.jsp");
				rd.forward(request, response);
			}
			
		} 
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
	}

}
