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
import java.sql.SQLException;
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	//CONNECTION OBJECT 
	Connection con=null;
	
	//CREATE VARIABLES FOR PARAMETERS
	String uid,pwd,newpwd,ans,get_pwd,get_ans;
	int qno,user_type,get_qno;
	boolean flag;
	
    
    public ChangePassword()
    {
        super();
        // TODO Auto-generated constructor stub
    }

	
	public void init(ServletConfig config) throws ServletException 
	{
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
		
		PrintWriter out=response.getWriter();
		
		
		//GET ALL PARAMETERS
		uid=request.getParameter("uid");
		pwd=request.getParameter("password");   
		newpwd=request.getParameter("newpwd");
		qno=Integer.parseInt(request.getParameter("questionno"));
		ans=request.getParameter("answer");
		
		//WE HAVE TO TAKE THIS FROM SESSION OBJECT
		HttpSession session=request.getSession();
		user_type=Integer.parseInt(session.getAttribute("User_Type").toString());
		
		//SET FLAG
		flag=false;
		
		out.println(uid+" "+pwd+" "+newpwd+" "+qno+" "+ans);
		
		try 
		{
			//FETCH ALL FIELDS OF THAT USERID
			PreparedStatement  ps= con.prepareStatement("select Password,Question_No,Answer from login where User_Type=? and User_ID=?");
			
			//FOR ABOVE PREPAREDSTATEMENT
			ps.setInt(1, user_type);
			ps.setString(2, uid);
			
			
			//ACTUALLY SETTING NEW PASSWORD
			PreparedStatement ps1=con.prepareStatement("update login set Password=? where User_ID=?");
			
			//FOR ABOVE PREPAREDSTATEMENT
			ps1.setString(1, newpwd);
			ps1.setString(2, uid);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				get_pwd=rs.getString(1);
				get_qno=rs.getInt(2);
				get_ans=rs.getString(3);
			}
			
			out.println(get_pwd+" "+get_qno+" "+get_ans);
			//COMPARE WITH ACTUAL PATH
			if(pwd.equals(get_pwd) && qno==get_qno && ans.equals(get_ans))
			{
				//out.println("<h3>Password Changed Successfully...</h3>");
				ps1.executeUpdate();
				
				flag=true;
				
				RequestDispatcher rd=request.getRequestDispatcher("/Student_Home.jsp");
				rd.forward(request, response);
			}
			
			if(flag == false)
			{
				//out.println("<h3>Sorry Password is not changed....</h3>");
			}
			//CLOSE CONNECTION
			rs.close();
			ps.close();
			
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}

}
