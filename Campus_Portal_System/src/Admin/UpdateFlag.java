package Admin;



import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;



@WebServlet("/Update_Flag")
public class UpdateFlag extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//CONNECTION OBJECT 
	Connection con=null;
	
	//CREATE VARIABLES FOR PARAMETERS
	String C_code;
	String C_flag;
	int i;
	

       
    
    public UpdateFlag() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
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
		
		  C_code=request.getParameter("CID");
		  C_flag=request.getParameter("Flag");
		  C_flag="Yes";
	
	//	out.print(C_code);
		
		//CallableStatement cs1;
		try 
		{
		 PreparedStatement ps = con.prepareStatement("update company set flag=? where Company_ID="+C_code);
		
		     ps.setString(1, C_flag);
		     
		     int rows_change = 0;
		    
			 	rows_change=ps.executeUpdate();
			 	
				
				if(rows_change==1)
				{
					out.print("updated");
					RequestDispatcher rd=request.getRequestDispatcher("/AdminSendCredential.jsp");
					rd.forward(request, response);
				}
				else
				{
					out.print("not inserted...");
					RequestDispatcher rd=request.getRequestDispatcher("http://localhost:8080/Campus_Portal_System/Error.jsp");
					rd.forward(request, response);
				}
			
			
		}
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
			RequestDispatcher rd=request.getRequestDispatcher("http://localhost:8080/Campus_Portal_System/Error.jsp");
			rd.forward(request, response);
		}
		
		
		
		
		
	}

}
