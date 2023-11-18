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
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/CheckFilled")
public class CheckFilled extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	//CONNECTION OBJECT 
	Connection con=null;
  
	//FOR GET ALL PARAMETERS
	Double prnno;
	int flag;
	String uid,ptitle,hobbies;
	
    public CheckFilled() {
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

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request , response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session=request.getSession();
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
				prnno=rs.getDouble(1);
				session.setAttribute("PRN",rs.getDouble(1));
				flag=rs.getInt(2);
				break;
			}
		}
		catch (SQLException e1) 
		{
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		//IF STUDENT ALREADY FILLED GENERAL INFORMATION
		if(flag==1)
		{
			//TO CHECK WHETHER STUDENT FILLED THE PROJECT DETAILS OR NOT
			try 
			{
				ps=con.prepareStatement("select Project_Title from project_details where Prn_No=?");
				ps.setDouble(1, prnno);
				rs=ps.executeQuery();
				
				//FETCH PROJECT TITLE IF PRN NO IS PRESENT
				while(rs.next())
				{
					ptitle=rs.getString(1);
					break;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//IF STUDENT FILLED THE PROJECT DETAILS
			if(ptitle!=null)
			{
				//TO CHECK WHETEHER STUDENT FILLED THE OTHER INFORMATION OR NOT
				try 
				{
					ps=con.prepareStatement("select Hobbies from other_information where Prn_No=?");
					ps.setDouble(1, prnno);
					rs=ps.executeQuery();
					
					//FETCH PROJECT TITLE IF PRN NO IS PRESENT
					while(rs.next())
					{
						hobbies=rs.getString(1);
						break;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				//IF STUDENT FILLED THE OTHER INFORMATION DETAILS
				if(hobbies!=null)
				{
					//FORWARD TO PROFILE CREATED PAGE 
					rd= request.getRequestDispatcher("ProfileCreated.jsp");
					rd.forward(request, response);
				}
				//IF STUDENT DOES NOT FILLED THE OTHER INFORMATION DETAILS
				else
				{
					//FORWARD TO PROFILE CREATED PAGE 
					rd= request.getRequestDispatcher("Student_Other_info.jsp");
					rd.forward(request, response);
				}
				
			}
			//IF PROJECT DETAILS ARE NOT FILLED
			else
			{
				//FORWARD TO ACADEMIC DETAIL PAGE IF STUDENT DOESNOT FILLED PROJECT DETAILS
				rd= request.getRequestDispatcher("GenerateAcademic");
				rd.forward(request, response);
			}
			
		}
		else
		{
			//IF STUDENT DOESNOT FILLED GENERAL INFORMATION ALREADY
			rd= request.getRequestDispatcher("Student_General_Details.jsp");
			rd.forward(request, response);
		}
		
	}

}
