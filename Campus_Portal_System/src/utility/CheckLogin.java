package utility;

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

@WebServlet("/CheckLogin")
public class CheckLogin extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
	//CONNECTION OBJECT 
	Connection con=null;
	
	//CREATE VARIABLES FOR PARAMETERS
	String uid,pwd;
	int usertype;
    
    public CheckLogin() {
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
		
		PrintWriter out=response.getWriter();
		
		uid=request.getParameter("uid");
		pwd=request.getParameter("pwd");   
        usertype=Integer.parseInt(request.getParameter("usertype1"));
        
        out.println(uid+" "+" "+pwd+" "+usertype);
        
        
        try
		{
			
        	//FOR LOGIN PURPOSE
			PreparedStatement  ps= con.prepareStatement("select User_ID,Password from login where User_Type=? and User_ID=?");
			ps.setInt(1, usertype);
			ps.setString(2, uid);
			
			//EXECUTE QUERY
			ResultSet rs= ps.executeQuery();
			
			//FOR GETTING USER NAME
			PreparedStatement ps2;
			ResultSet rs2;
			
			out.print("hello1");
			boolean flag=false;
			
			while(rs.next())
			{
				
				if(rs.getString(1).equals(uid) && rs.getString(2).equals(pwd))
				{	
					
					RequestDispatcher rd;
					
					//FOR STUDENT
					if(usertype==1)
					{
						//FETCH STUDENT INFORMATION
						ps2=con.prepareStatement("select First_Name,Last_Name,Prn_No from student where User_ID=?");
						ps2.setString(1,uid);
						
						//EXECUTE QUERY
						rs2=ps2.executeQuery();
						
						//CREATE SESSION FOR STUDENT USER
						while(rs2.next())
						{
							HttpSession session=request.getSession(true); 
							session.setAttribute("Uid", uid);
							session.setAttribute("Fname", rs2.getString(1));
							session.setAttribute("Lname", rs2.getString(2));
							session.setAttribute("Prnnumber", rs2.getLong(3));
							session.setAttribute("User_Type",usertype);
						}
						
						//FORWARD TO STUDENT HOME PAGE
						rd= request.getRequestDispatcher("/Student_Home.jsp");
						rd.forward(request, response);
						
					}
					
					//FOR INSTITUTE
					if(usertype==2)
					{
						//FETCH INSTITUTE NAME 
						ps2=con.prepareStatement("select Institute_Code,Institute_Name from institute where User_ID=?");
						ps2.setString(1,uid);
						
						//EXECUTE QUERY
						rs2=ps2.executeQuery();
						
						//CREATE SESSION FOR INSTITUTE USER
						while(rs2.next())
						{
							HttpSession session=request.getSession(true); 
							session.setAttribute("Icode", rs2.getString(1));
							session.setAttribute("Iname", rs2.getString(2));
							session.setAttribute("User_Type",usertype);
						}
						
						rd= request.getRequestDispatcher("/Institute_Home.jsp");
						rd.forward(request, response);
					}
					
				
					//FOR CENTRALIZE MANAGEMENT
					if(usertype==3)
					{
						//FETCH CENTRALIZE MANAGEMENT INFORMATION
						ps2=con.prepareStatement("select Institute_Code,Institute_Name from institute where User_ID=?");
						ps2.setString(1,uid);
						
						//EXECUTE QUERY
						rs2=ps2.executeQuery();
						
						//CREATE SESSION FOR INSTITUTE USER
						while(rs2.next())
						{
							HttpSession session=request.getSession(true); 
							session.setAttribute("Icode", rs2.getString(1));
							session.setAttribute("Iname", rs2.getString(2));
							session.setAttribute("User_Type",usertype);
						}
						
						
						rd= request.getRequestDispatcher("/Center_mgmt_Home.jsp");
						rd.forward(request, response);
					}
				
				
				
					//FOR COMPANY
					if(usertype==4)
					{
						//FETCH COMPANY NAME 
						ps2=con.prepareStatement("select Company_ID,Company_Name from company where User_ID=?");
						ps2.setString(1,uid);
						
						//EXECUTE QUERY
						rs2=ps2.executeQuery();
						
						//CREATE SESSION FOR STUDENT USER
						while(rs2.next())
						{
							HttpSession session=request.getSession(true); 
							session.setAttribute("Cid", rs2.getInt(1));
							session.setAttribute("Cname", rs2.getString(2));
							session.setAttribute("User_Type",usertype);
						}
					
						rd= request.getRequestDispatcher("/Company_Home.jsp");
						rd.forward(request, response);
					}
					
					
					//FOR ADMIN
					if(usertype==5)
					{
						
						HttpSession session=request.getSession(true); 
						session.setAttribute("adminid",rs.getString(1));
						rd= request.getRequestDispatcher("/Admin/Admin_Home.jsp");
						rd.forward(request, response);
					}
									
					flag=true;
					
					break;
				}
				
			}
			
			if(flag == false)
			{
				RequestDispatcher rd= request.getRequestDispatcher("/LoginFailed.jsp");
				rd.forward(request, response);
			}
				
			//CLOSE CONNECTION
			rs.close();
			ps.close();
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
       
        
        
	}

}
