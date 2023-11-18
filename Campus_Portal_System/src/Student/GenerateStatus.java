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

import Company.Status;

@WebServlet("/GenerateStatus")
public class GenerateStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//CONNECTION OBJECT 
	Connection con=null;
	
	Double prn;
	int cid;
       
    public GenerateStatus() {
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
		
		//TAKE PRN NO AND COMPANY ID 
		prn=Double.parseDouble(session.getAttribute("Prnnumber").toString());
		cid=Integer.parseInt(request.getParameter("cid"));
		
		//TO CREATE PRINTWRITER OBJECT
		PrintWriter out=response.getWriter();
		
		out.print(prn+" "+cid);
		
		//TO TAKE ALL STATUS INFORMATION FROM SHORTLIST TABLE
		String crname,crstatus,fresult;
		String prname=null,prstauts=null,cname=null;
		
		//TAKE COMPANY NAME FROM COMPANY TABLE
		
		PreparedStatement ps,ps1;
		ResultSet rs;
		try 
		{
			
			out.print("1");
			//CREATE QUERY
			ps = con.prepareStatement("Select Company_Name from company where Company_ID=?");
			ps.setInt(1, cid);
			
			//EXECUTING QUERY
			rs=ps.executeQuery();
			
			while(rs.next())
			{
				out.print("2");
				cname=rs.getString(1);
			}
			
			out.print("3.1");
			//TAKE ALL STATUS INFORMATION FROM SHORTLIST STORE IN STATUS OBJECT
			Status st;
			
			//CRETAE ARRAYLIST TO STORE STATUS OBJECT
			ArrayList<Status> al_status=new ArrayList<Status>();
			
			//CRETAE ARRAYLIST TO STORE PREVIOUS ROUND NAME AND STATUS
			ArrayList<String> al_pr=new ArrayList<String>();
			
			//CREATE QUERY TO FETCH STATUS INFORMATION
			ps1=con.prepareStatement("select Round_Name,Round_Status,Final_Result from shortlist where Prn_No=? and Company_ID=?");
			ps1.setDouble(1, prn);
			ps1.setInt(2, cid);
			
			out.print("3.2");
			
			//EXECUTING QUERY
			rs=ps1.executeQuery();
			
			out.print("3.3");
			
			while(rs.next())
			{
				crname=rs.getString(1);
				crstatus=rs.getString(2);
				fresult=rs.getString(3);
				
				//TO ACTUALLY GET INFORMATION ABOUT PREVIOUS ROUND
				if(crstatus.equals("WAIT") || crstatus.equals("PASS"))
				{
					//WHEN ROUND IS APTITUTDE AND STATUS IS WAIT
					if(crname.equals("Aptitutde"))
					{
						prname="No Previous Round";
						prstauts="No Previous Status";
					}
					//WHEN ROUND IS Group Discussion AND STATUS IS WAIT
					else if(crname.equals("Group Discussion"))
					{
							prname="Aptitutde";
							prstauts="PASS";
					}
					//WHEN ROUND IS Technical Interview AND STATUS IS WAIT
					else if(crname.equals("Technical Interview"))
					{
							prname="Group Discussion";
							prstauts="PASS";
					}
					//WHEN ROUND IS Technical Interview AND STATUS IS WAIT
					else if(crname.equals("HR"))
					{
							prname="Technical Interview";
							prstauts="PASS";
					}
					
				}
				//WHEN STUDENT IS OUT OF THE PROCESS
				else if(crstatus.equals("FAIL"))
				{
					
					//WHEN ROUND IS APTITUTDE AND STATUS IS FAIL
					if(crname.equals("Aptitutde"))
					{
						prname="No Previous Round";
						prstauts="No Previous Status";
					}
					//WHEN ROUND IS Group Discussion AND STATUS IS FAIL
					else if(crname.equals("Group Discussion"))
					{
							prname="Aptitutde";
							prstauts="PASS";
					}
					//WHEN ROUND IS Technical Interview AND STATUS IS FAIL
					else if(crname.equals("Technical Interview"))
					{
							prname="Group Discussion";
							prstauts="PASS";
					}
					//WHEN ROUND IS Technical Interview AND STATUS IS FAIL
					else if(crname.equals("HR"))
					{
							prname="Technical Interview";
							prstauts="PASS";
					}
					
				}
				
				
				//CREATE STATUS OBJECT AND ADD TO LIST
				long prn1=Long.parseLong(session.getAttribute("Prnnumber").toString());
				st=new Status(prn1, crname, crstatus, fresult);
				
				al_status.add(st);
				
				//ADDING PRNAME,PRSTATUS,CNAME
				session.setAttribute("cname",cname);
				session.setAttribute("prname",prname);
				session.setAttribute("prstatus",prstauts);
				
				
				//ATTACH LIST TO SESSION
				session.setAttribute("al_status", al_status);
				//session.setAttribute("al_pr", al_pr);
				
				
				RequestDispatcher rd=request.getRequestDispatcher("/View_Status_Student.jsp");
				rd.forward(request, response);
				
			}
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
	}

}
