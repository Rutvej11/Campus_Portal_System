package CM_pkg;

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
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


@WebServlet("/CM_UpdateCompany")
public class CM_UpdateCompany extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//CONNECTION OBJECT 
		Connection con=null;
	
	
    public CM_UpdateCompany() {
        super();
        // TODO Auto-generated constructor stub
    }

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		
		//INSTANTIATE CON OBJECT 
		con=(Connection)config.getServletContext().getAttribute("dbconnection");
		
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//TO UPDATE COMPANY
		HttpSession session=request.getSession();
		int Cid=Integer.parseInt(session.getAttribute("cid").toString());
		
		//TO UPDATE COMPANY
		int cnt=0;
		String flag="Yes";
		
			PreparedStatement ps;
			try 
			{
				PrintWriter out=response.getWriter();
				
				ps= con.prepareStatement("Update company_requirement set Flag=? where Company_ID=?");
				ps.setString(1,"Yes");
				ps.setInt(2,Cid);
				
				out.print("1");
				out.print(Cid);
				
				cnt=ps.executeUpdate();
				out.print("1.1");
				
				if(cnt==1)
				{
					out.print("2");
					RequestDispatcher rd=null; 
					rd=request.getRequestDispatcher("/Cm_View_CompanyDetails.jsp");
					rd.forward(request, response);
				}
				else
				{
					out.print("3");
					RequestDispatcher rd=null; 
					rd=request.getRequestDispatcher("/Error.jsp");
					rd.forward(request, response);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			
			
			
			//EXECUTE QUERY
			
			
		}
	}

}
