package CM_pkg;

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

@WebServlet("/Cm_Shortlist")
public class Cm_Shortlist extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//CONNECTION OBJECT 
	Connection con=null;
       
    public Cm_Shortlist()
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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		
		String Ssc=request.getParameter("ssc");
		String Hsc=request.getParameter("hsc");
		String Degree=request.getParameter("degree");
		
		HttpSession session=request.getSession();
		int Cid=Integer.parseInt(session.getAttribute("cid").toString());
		
		String ssc_string="SSC";
		String hsc_string="HSC";
		String degree_string="BE";
		String placement_status="No";
		int flag=0;
		
		
		//out.println("1");
		try 
		{
			//CHECK FLAG TO DECIDE WHETHER LIST IS GENERATED OR NOT
			PreparedStatement  ps= con.prepareStatement("select Prn_No from student_academic where Qualification=? and Percentage>=?");
			ps.setString(1,ssc_string);
			ps.setString(2,Ssc);
			
			//EXECUTING QUERY First Result Set
			ResultSet rs= ps.executeQuery();
			
			//out.println("2");
				while(rs.next())
				{	
					//out.println(rs.getLong(1));
					//Prepared Statement for HSC
					PreparedStatement  ps1= con.prepareStatement("select Prn_No from student_academic where Qualification=? and Percentage>=? and Prn_No=?");		
					ps1.setString(1,hsc_string);
					ps1.setString(2,Hsc);
			
					//Getting Prn Number from above statement
					Long prn=rs.getLong(1);
					ps1.setLong(3,prn);
					//ps1.setString(6,"Prn_no");
					
					//out.println("3");
					ResultSet rs1=ps1.executeQuery();
						while(rs1.next())
						{	
							//out.println(rs1.getLong(1));
						
							//Prepared Statement for Degree
							PreparedStatement  ps2= con.prepareStatement("select Prn_No from student_graduation where Qualification=? and Average>=? and Prn_No=?");
							ps2.setString(1,degree_string);
							ps2.setString(2,Degree);
							
							//Getting Prn Number from above statement
							Long prn1=rs1.getLong(1);
							ps2.setLong(3,prn1);
							
							//out.println("4");
							ResultSet rs2=ps2.executeQuery();
							//out.println("4.1");
								while(rs2.next())
								{
									//out.println(rs2.getLong(1));
									
									//out.println("5.1");
									ps2=con.prepareStatement("select Prn_No,First_Name,Middle_Name,Last_Name,Institute_Code from student where Prn_No=? and Placement_Status=?");
									ps2.setDouble(1,rs.getDouble(1));
									ps2.setString(2,placement_status);
									
									
									ResultSet rs3=ps2.executeQuery();

									//out.println("5.2");
									while(rs3.next())
									{
										//out.println("6");
										/*out.println(rs3.getLong(1));
										out.println(rs3.getString(2));
										out.println(rs3.getString(3));
										out.println(rs3.getString(4));
										out.println(rs3.getString(5));
										*/
										
										double prnno=rs3.getDouble(1);
										String fname=rs3.getString(2);
										String mname=rs3.getString(3);
										String lname=rs3.getString(4);
										String icode=rs3.getString(5);
										String round_name="Aptitude";
										String round_status="Wait";
										String final_result="Not declared";
										
										PreparedStatement  ps3= con.prepareStatement("insert into shortlist values(?,?,?,?,?,?,?,?,?)");
										ps3.setInt(1,Cid);
										ps3.setDouble(2,prnno);
										ps3.setString(3,fname);
										ps3.setString(4,mname);
										ps3.setString(5,lname);
										ps3.setString(6,icode);
										ps3.setString(7,round_name);
										ps3.setString(8,round_status);
										ps3.setString(9,final_result);
										
										int rs4=ps3.executeUpdate();
										
										if(rs4==0)
										{
											//out.println("Not updated");
											
										}
										else
										{
											//out.println("7");
											flag++;
											//out.println(" updated");	
										}
									}
								}
								flag++;
						}
						
					
					
						
				}
				
				if(flag>0)
				{ 
					//out.println("8");
					out.println("<a href=CM_UpdateCompany > Notify Company </a>");
				}	
				
		} 
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			//e.printStackTrace();
			
		}
		
		
		
	}
	
	public void destroy() 
	{
		// TODO Auto-generated method stub
	}

}
