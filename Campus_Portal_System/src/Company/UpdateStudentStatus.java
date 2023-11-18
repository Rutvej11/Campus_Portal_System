package Company;

import java.io.IOException;
import java.io.ObjectInputFilter;
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
import jdk.internal.org.jline.utils.Status;
import jdk.jshell.Snippet;

import javax.net.ssl.SSLEngineResult;

@WebServlet("/Update")
public class UpdateStudentStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//CONNECTION OBJECT 
	Connection con=null;
	
	Double prn;
	int cid;
	long prn1;
	
    public UpdateStudentStatus() {
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
		PrintWriter out=response.getWriter();
		
		//TAKE COMPANY ID
		HttpSession session=request.getSession();
		cid=Integer.parseInt(session.getAttribute("Cid").toString());
		
		prn=Double.parseDouble(request.getParameter("prn").toString());
		prn1=Long.parseLong(request.getParameter("prn").toString());
		
		//out.print(prn);
		//GET THE STATUS OF STUDENT
		
		PreparedStatement ps;
		ResultSet rs;
		RequestDispatcher rd;
		
		
		//TAKE STATUS INFORMATION OF THAT STUDENT USING PRN NUMBER 
		
		try 
		{
			//TAKE ALL STATUS RELATED INFORMATION FROM SHORTLIST TABLE
			
			
			
			
			//CREATE QUERY
			ps=con.prepareStatement("select Round_Name,Round_Status,Final_Result from shortlist where Company_ID=? and Prn_No=?");
			ps.setInt(1, cid);
			ps.setDouble(2, prn);
			
			
			//EXECUTING QUERY
			rs=ps.executeQuery();
			
			
			//CREATING OBJECT OF STATUS
			Status status;
			
			//CREATE ARRAYLIST TO STORE STATUS OBJECTS
			ArrayList<Status> sts=new ArrayList<Status>();
			
			
			while(rs.next())
			{
				status=new Status(prn1,rs.getString(1),rs.getString(2),rs.getString(3));
				sts.add(status);
			}
			
			//ADD ARRAYLIST TO SESSION
			session.setAttribute("status", sts);
			out.print("5");
			//FORWARD TO UPDATE STUDENT VIEW PAGE
			rd= request.getRequestDispatcher("/Update_Status.jsp");
			rd.forward(request, response);
			
			
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}

}
