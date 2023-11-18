package Student;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/GenerateAcademic")
public class GenerateAcademic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	//CONNECTION OBJECT 
	Connection con=null;
	
	Double prn;
	String uid;
	
	
    public GenerateAcademic() {
        super();
        // TODO Auto-generated constructor stub
        
    }

	public void init(ServletConfig config) throws ServletException {
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		//TAKE PRN FROM SESSION	
		HttpSession session=request.getSession();
		
		//GET PRN
		prn=Double.parseDouble(session.getAttribute("PRN").toString());
		
		try 
		{
			
			//CREATE QUERY TO FETCH DATA FROM STUDENT_ACADEMIC TABLE
			PreparedStatement ps=con.prepareStatement("select * from student_academic where Prn_No= ?");
			ps.setDouble(1, prn);
			
			//EXECUTING QUERY
			ResultSet rs=ps.executeQuery();
			
			//CREATE ARRAY LIST TO TAKE INFORMATION
			ArrayList<Academic> acd=new ArrayList<Academic>();
			Academic ac;
			
			while(rs.next())
			{
				ac=new Academic();
				ac.setQualification(rs.getString(2));
				ac.setSpecialization(rs.getString(3));
				ac.setBoard(rs.getString(4));
				ac.setInstitute(rs.getString(5));
				ac.setObt_marks(rs.getInt(6));
				ac.setTotal_marks(rs.getInt(7));
				ac.setPassing_yr(rs.getInt(8));
				ac.setPer(rs.getDouble(9));
				acd.add(ac);
			}
			HttpSession acdemic=request.getSession();
			acdemic.setAttribute("ACD", acd);
			
			//FORWARD TO ACADEMIC DETAILS
			RequestDispatcher rd=request.getRequestDispatcher("Academic_Detail.jsp");
			rd.forward(request, response);
			
			
		} catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
