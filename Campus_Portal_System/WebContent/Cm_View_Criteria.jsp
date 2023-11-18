<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
import="java.sql.*" import="java.io.PrintWriter" import="java.sql.ResultSet"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Criteria</title>
</head>
<body>


					
	

<%
					Connection con=(Connection)application.getAttribute("dbconnection"); 
					
					PreparedStatement ps=con.prepareStatement("select Company_ID,Company_Name from company");  
					
					    	
					    	ResultSet rs=ps.executeQuery();
					    	out.println("<table border='1'>");
					    	out.println("<tr>");
					    	out.println("<td>Company ID</td>");
					    	out.println("<td>Company Name</td>");
					    	out.println("<td>Details</td>");
					    	out.println("</tr>");
					    	
					    	  while(rs.next())
					    	  {
					    	  	out.println("<tr>");
					    	  	
						    	  out.println("<td>");
						    	  out.println(rs.getInt(1));
						    	  out.println("</td>");  	
					    	  
						    	  out.println("<td>");
						    	  out.println(rs.getString(2));
						    	  out.println("</td>");  
						    
						    	  out.println("<td>");
						    	  out.println("<a href=Cm_Details.jsp?code="+rs.getInt(1)+">Show Details</a>");
						    	  out.println("</td>");   
					    	    out.println("</tr>"); 
					    	  
					    	  }
					    	  
					    	  out.println("</table>");
					    	  
	%>			

</body>
</html>