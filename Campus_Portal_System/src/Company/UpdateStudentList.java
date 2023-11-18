package Company;

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


@WebServlet("/UpdateStudentList")
public class UpdateStudentList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	//CONNECTION OBJECT 
	Connection con=null;
	
	int cid;
	
        public UpdateStudentList() {
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
		
		//TAKING COMPANY ID	
		HttpSession session=request.getSession();
		cid=Integer.parseInt(session.getAttribute("Cid").toString());
		
		//CHECK WHETHER STUDENT LIST IS GENERATED OR NOT
		
		PreparedStatement ps;
		ResultSet rs;
		RequestDispatcher rd;
		
		try 
		{
			//CHECK FLAG TO DECIDE WHETHER LIST IS GENERATED OR NOT
			ps=con.prepareStatement("select Flag from company_requirement where Company_ID=?");
			ps.setInt(1, cid);
			
			//EXECUTING QUERY	
			rs=ps.executeQuery();
			
			if(rs.first())
			{
				//IF LIST IS GENERATED
				if(rs.getString(1).equals("No"))
				{
					session.setAttribute("View_Flag", "No");
					//FORWARD TO STUDENT LIST VIEW RESULT  PAGE
					rd= request.getRequestDispatcher("/StudentListView_Result.jsp");
					rd.forward(request, response);
				}
				
				
				//IF LIST IS NOT GENERATED
				if(rs.getString(1).equals("Yes"))
				{
					
					//CREATE QUERY	
					ps=con.prepareStatement("select * from shortlist where Company_ID=?");
					ps.setInt(1, cid);
					
					//TAKE ARRAY LIST TO STORE STUDENT LIST

					ArrayList<StudentList> stu=new ArrayList<StudentList>();
					
					StudentList st;
					
					//EXECUTE QUERY 
					rs=ps.executeQuery();
					
					while(rs.next())
					{
						st=new StudentList(rs.getLong(2), rs.getString(3), rs.getString(4), 
								rs.getString(5), rs.getString(7), rs.getString(8), rs.getString(9), 
								rs.getString(6));
						
						stu.add(st);
					}
					
					//STORING ARRAYLIST IN SESSION
					session.setAttribute("StudentList", stu);
					
					//FORWARD TO STUDENT LIST VIEW PAGE
					rd= request.getRequestDispatcher("/Update_StudentList_Company.jsp");
					rd.forward(request, response);
				}
					
				
			}
			//IF REQUIREMENT IS NOT GIVEN
			else
			{
				session.setAttribute("View_Flag", "Not");
				//FORWARD TO STUDENT LIST VIEW RESULT  PAGE
				rd= request.getRequestDispatcher("/StudentListView_Result.jsp");
				rd.forward(request, response);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
