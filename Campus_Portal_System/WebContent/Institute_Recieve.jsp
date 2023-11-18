<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*" import="java.io.PrintWriter" import="java.sql.ResultSet"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Institute Student List</title>


</head>
<body>		

<form action="">
<fieldset>
<legend>Company Details</legend>
 
   <%       
   			int i_code=430;
   			
            Connection con=(Connection)application.getAttribute("dbconnection"); 
	
	        // PreparedStatement ps=con.prepareStatement("select sh.Company_ID,sh.Prn_No,sh.First_Name,sh.Middle_Name,sh.Last_Name,sh.Institute_Code,sh.Round_Name,sh.Round_Status,sh.Final_Result,s.Email_ID,s.Mobile_No,c.Company_Name,c.Company_Domain from student s,shortlist sh,company c where sh.Company_ID=c.Company_ID and s.Prn_No="+Ccode);  
			  
   		   PreparedStatement ps=con.prepareStatement("select sh.Company_ID,c.Company_Name from shortlist sh,company c where sh.Company_ID=c.Company_ID and sh.Institute_Code=? group by sh.Company_ID ");
	
			ps.setInt(1, i_code);
 
	    	ResultSet rs=ps.executeQuery();
	    	
	    	out.println("<table border=1>");
					    	
					    	out.println("<tr>");
					    	
					    	
					    	out.println("<td>Company ID	</td>");
					    	out.println("<td>Company Name</td>");
					    	out.println("<td>Check</td>");
	    		 							
							out.println("</tr>");
												
					    	  while(rs.next())
					    	 {
					    	
					    	  	out.println("<tr>");
					    	  	
					    	  	out.println("<td>");
	    	 				    out.println(rs.getInt("Company_ID"));
	    	  				    out.println("</td>");
					    	  	
					    	  	out.println("<td>");
	    	 				    out.println(rs.getString("Company_Name"));
	    	  				    out.println("</td>");
	    	  				    
	    	  				    out.println("<td>");
	    	  					out.println("<a href=Institute_RecieveDetails.jsp?code="+rs.getInt(1)+">Show Details</a>");
	    	  					out.println("</td>"); 
	    				    
					    	  	out.println("</tr>");
					    	  	
					    	 }
					    	 
					    	 out.println("</table>");
	%>
	   
</fieldset>
</form>
</body>
</html>