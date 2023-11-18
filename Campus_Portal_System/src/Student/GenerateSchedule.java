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
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


@WebServlet("/GenerateSchedule")
public class GenerateSchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	//CONNECTION OBJECT 
	Connection con=null;

	Double prn;
	
	public GenerateSchedule() {
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
		prn=Double.parseDouble(session.getAttribute("Prnnumber").toString());
		
		//TO CHECK WHETHER TO GO SCHEDULE INFORMATION OR VIEW STATUS 
		int forward=Integer.parseInt(request.getParameter("fwd"));
		
		//TO CREATE PRINTWRITER OBJECT
		PrintWriter out=response.getWriter();
		
		PreparedStatement ps,ps1;
		ResultSet rs,rs1;
		RequestDispatcher rd;
		
		//CEATE QUERY TO FETCH COMPANY ID
		try 
		{
			//TO SELECT COMPANY ID FROM SHORTLIST
			ps=con.prepareStatement("select Company_ID from shortlist where Prn_No=?");
			
			ps.setDouble(1, prn);
			
			//EXECUTING QUERY
			rs=ps.executeQuery();
			
			//CREATE ARRAYLIST TO STORE COMPANY ID
			ArrayList<Integer> cidlist=new ArrayList<Integer>();
			
			
			while(rs.next())
			{
			
				ps1=con.prepareStatement("select Company_ID from company_requirement where Flag=? and Company_ID="+rs.getInt(1));
				
				ps1.setString(1, "Yes");
				
				rs1=ps1.executeQuery();
				
				while(rs1.next())
				{
					//ADDING COMPANY ID TO LIST
					cidlist.add(rs.getInt(1));
				}
			}
			
			
			
			//IF THERE IS NO SCHEDULE IS PRESENT 
			if(cidlist.isEmpty())
			{
				rd=request.getRequestDispatcher("/No_Schdule.jsp");
				rd.forward(request, response);
			}
			//IF SCHDEULE IS PRESENT
			else
			{
				
				if(forward==1)
				{
					session.setAttribute("cidlist", cidlist);
					rd=request.getRequestDispatcher("/View_Status.jsp");
					rd.forward(request, response);
	
				}
				else
				{
					session.setAttribute("cidlist", cidlist);
					rd=request.getRequestDispatcher("/View_Schedule.jsp");
					rd.forward(request, response);
				}
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}

}
