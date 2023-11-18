package Student;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
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
@WebServlet("/GenerateProfile")
public class GenerateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//CONNECTION OBJECT 
	Connection con=null;
	
	String uid;
	Double prn;
	Long prn1;
	
    public GenerateProfile()
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
		uid=session.getAttribute("Uid").toString();
		
		RequestDispatcher rd;
		PreparedStatement ps;
		ResultSet rs;
		try 
		{
			ps=con.prepareStatement("select Prn_No,flag from student where User_ID=?");
			ps.setString(1, uid);
			rs=ps.executeQuery();
			while(rs.next())
			{
				prn=rs.getDouble(1);
				prn1=rs.getLong(1);
				//prn1=()prn;
				session.setAttribute("PRN1",prn1);
				break;
			}
		}
		catch (SQLException e1) 
		{
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		PrintWriter out=response.getWriter();
		out.print(prn);
		
		
		//TO TAKE VALUES FROM ALL TABLE TO CREATE PROFILE
		try 
		{
			CallableStatement cs=  con.prepareCall("{call get_profile(?)}");
			cs.setDouble(1, prn);
			
			//EXECUTING QUERY
			rs=cs.executeQuery();
			
			//CREATE ARRAY LIST TO TAKE INFORMATION
			ArrayList<Student> st=new ArrayList<Student>();
			Student std;
			
			while(rs.next())
			{
				String mname;
				String street;
				String fname;
				String lname;
				String course;
				String area;
				String state;
				Date dob;
				String city;
				int pincode;
				String stream;
				String qualification;
				String board;
				String passingyr;
				String iname;
				float percentage;
				String duration;
				String description;
				String ptitle;
				String platform;
				String lang;
				String extra;
				
				fname=rs.getString(1);
				mname=rs.getString(2);
				lname=rs.getString(3);
				course=rs.getString(4);
				street=rs.getString(5);
				area=rs.getString(6);
				city=rs.getString(7);
				state=rs.getString(8);
				dob=rs.getDate(9);
				pincode=rs.getInt(10);
				qualification=rs.getString(11);
				stream=rs.getString(12);
				iname=rs.getString(13);
				board=rs.getString(14);
				passingyr=rs.getString(15);
				percentage=rs.getFloat(16);
				ptitle=rs.getString(17);
				platform=rs.getString(18);
				duration=rs.getString(19);
				description=rs.getString(20);
				lang=rs.getString(21);
				extra=rs.getString(22);
				
				std=new Student(fname, mname, lname, course, street,
								area, city, state, dob, pincode,
								qualification, stream, iname, board, passingyr,
								percentage, ptitle, platform, duration, description, 
								lang, extra);
				
				out.println(std.toString());
				st.add(std);
				
				//st.toString();
			}
			
			
			
			//TO STORE STUDENT INFORMATION IN STUDENT SESSION
			session.setAttribute("student", st);
			
			//TAKE ACADEMIC INFORMATATION
			ps=con.prepareStatement("select * from student_academic where Prn_No= ?");
			ps.setDouble(1, prn);
			
			//EXECUTING QUERY
			rs=ps.executeQuery();
			
			//CREATE ARRAY LIST TO TAKE INFORMATION
			ArrayList<Academic> acd1=new ArrayList<Academic>();
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
				acd1.add(ac);
			}
			HttpSession acdemic=request.getSession();
			acdemic.setAttribute("ACD1", acd1);
			
			
			
			
			rd= request.getRequestDispatcher("View_Profile.jsp");
			rd.forward(request, response);
			
			
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
