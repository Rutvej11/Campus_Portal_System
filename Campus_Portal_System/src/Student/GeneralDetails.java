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
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;


@WebServlet("/GeneralDetails")
public class GeneralDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	//CONNECTION OBJECT 
	Connection con=null;
    
	//FOR GET ALL PARAMETERS
	Double prnno;
	int dd,mm,yy,pincode,rows_change,flag;
	long mobileno;
	String street,area,state,city,uid;
	String dob;
	
    public GeneralDetails() {
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
		doPost(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session=request.getSession();
		uid=session.getAttribute("Uid").toString();
		RequestDispatcher rd;
		
		PrintWriter out=response.getWriter();
		
			//GETTING ALL PARAMETERS
			prnno=Double.parseDouble(session.getAttribute("PRN").toString());
			mobileno=Long.parseLong(request.getParameter("mobno"));
			pincode=Integer.parseInt(request.getParameter("pincode"));
			street=request.getParameter("street");
			area=request.getParameter("area");
			city=request.getParameter("city");
			state=request.getParameter("state");
			flag=1;
			//CREATE DATE OBJECT	
			dob=request.getParameter("dob");
			
			java.sql.Date dob1=null;
			try 
			{
				dob1 = new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(dob).getTime());
			}
			catch (ParseException e2) 
			{
				// TODO Auto-generated catch block
				e2.printStackTrace();
				
			}
			
			
			//STORING DATA INTO TABLE STUDENT
			try 
			{
				//CALLING STORED PROCEDURE
				//TO UPDATE VALUES IN STUDENT TABLE
				CallableStatement cs=  con.prepareCall("{call insert_generaldetails(?,?,?,?,?,?,?,?,?,?) }");
				cs.setDate(1, dob1);
				cs.setLong(2, mobileno);
				cs.setString(3,street);
				cs.setString(4,area);
				cs.setInt(5, pincode);
				cs.setString(6,city);
				cs.setString(7,state);
				cs.setString(8, uid);
				cs.setDouble(9, prnno);
				cs.setInt(10, flag);
				
				//EXECUTING QUERY FOR LOGIN
				
				
				rows_change=cs.executeUpdate();
				
				
			
				if(rows_change==1)
				{
					out.print("student updated...");
					
					//FORWARD TO ACADEMIC DETAIL PAGE
					rd= request.getRequestDispatcher("GenerateAcademic");
					rd.forward(request, response);
				}
				else
				{
					out.print("student not updated...");
					rd=request.getRequestDispatcher("Error.jsp");
					rd.forward(request, response);
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
