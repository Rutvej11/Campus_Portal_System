package Company;

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


@WebServlet("/StatusRegister")
public class StatusRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	//CONNECTION OBJECT 
	Connection con=null;
	
	double prn;
	String crname,cstatus,fresult,ustatus;
	int cid;
	
	
	
    public StatusRegister() {
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		
		//CREATE PRINTWRITER OBJECT
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		
		//TAKE ALL PARAMETERS
		prn=Double.parseDouble(request.getParameter("prn"));
		crname=request.getParameter("rd");
		cstatus=request.getParameter("cstatus");
		ustatus=request.getParameter("ustatus");
		fresult=request.getParameter("fresult");
		cid=Integer.parseInt(session.getAttribute("Cid").toString());
		
		//out.print(prn+" "+crname+" "+cstatus+" "+ustatus+" "+fresult+" "+cid);
		
		PreparedStatement ps;
		RequestDispatcher rd;
		
	
		//TO UPDATE DATA INTO SHORTLIST TABLE OF PARTICULAR STUDENT
		try 
		{
		
			//IF UPDATED STATUS IS "FAIL"
			if(ustatus.equals("FAIL"))
			{
				//STUDENT IS OUT OF PROCESS
				fresult="Disqualified";
				
			}
			//IF UPDATED STATUS IS WAIT OR PASS
			else
			{
				
				//CHANGE ROUND TO NEXT ROUND AND SET STATUS AS WAIT
				if(ustatus.equals("PASS"))
				{
					
					if(crname.equals("Aptitude"))
					{
						crname="Group Discussion";
						ustatus="WAIT";
					}
					else if(crname.equals("Group Discussion"))
					{
						crname="Technical Interview";
						ustatus="WAIT";
					}
					else if(crname.equals("Technical Interview"))
					{
						crname="HR";
						ustatus="WAIT";
					}
					else if(crname.equals("HR"))
					{
						crname="HR";
						fresult="Placed";
					}
					
				}
				
			}
			
			
			ps=con.prepareStatement("update shortlist set Round_Name=?,Round_Status=?,Final_Result=? where Company_ID=? and Prn_No=? ");
			ps.setString(1,crname);
			ps.setString(2, ustatus);
			ps.setString(3, fresult);
			ps.setInt(4, cid);
			ps.setDouble(5, prn);
			
			//EXECUTING QUERY
			int rowschng=ps.executeUpdate();
			
			if(rowschng==1)
			{
				//FORWARDED TO NEXT PAGE
				rd= request.getRequestDispatcher("UpdateStudentList");
				rd.forward(request, response);
			}
			else
			{
				rd= request.getRequestDispatcher("/Error.jsp");
				rd.forward(request, response);
			}
			
			
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
		
		
		
	}

}
