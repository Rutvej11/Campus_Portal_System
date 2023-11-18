<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*" import="java.io.PrintWriter" import="java.sql.ResultSet"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Center Management Student List</title>


</head>
<body>
				
					

<%
					Connection con=(Connection)application.getAttribute("dbconnection"); 
					
					PreparedStatement ps=con.prepareStatement("select * from student");  
					
					    	
					    	ResultSet rs=ps.executeQuery();
					    	out.println("<table border=1>");
					    	out.println("<tr>");
					    	out.println("<td>PRN Number</td>");
					    	out.println("<td>First Name</td>");
					    	out.println("<td>Last Name</td>");
					    	out.println("<td>Mobile Number</td>");
					    	out.println("<td>Date of Birth</td>");
					    	out.println("<td>Institute Name</td>");
					    	out.println("<td>Institute Code</td>");
					    	out.println("<td>Email ID</td>");
					    	out.println("<td>Placement Status</td>");
					    	out.println("<td>User Id</td>");
					    	out.println("<tr>");
					    	
					    	  while(rs.next())
					    	  {
					    	  	out.println("<tr>");
					    	  	
					    	  out.println("<td>");
					    	  out.println(rs.getLong(1));
					    	  out.println("</td>");  	
					    	  
					    	   out.println("<td>");
					    	  out.println(rs.getString(2));
					    	  out.println("</td>");  
					    	  
					    	   out.println("<td>");
					    	  out.println(rs.getString(4));
					    	  out.println("</td>");  
					    	  		  	  	
					    	   out.println("<td>");
					    	  out.println(rs.getLong(5));
					    	  out.println("</td>");  	
					    	  
					    	   out.println("<td>");
					    	  out.println(rs.getDate(6));
					    	  out.println("</td>");  	
					    	  
					    	   out.println("<td>");
					    	  out.println(rs.getString(12));
					    	  out.println("</td>");  	
					    	  
					    	   out.println("<td>");
					    	  out.println(rs.getString(13));
					    	  out.println("</td>");  
					    	  
					    	   out.println("<td>");
					    	  out.println(rs.getString(14));
					    	  out.println("</td>");  	
					    	  
					    	   out.println("<td>");
					    	  out.println(rs.getString(15));
					    	  out.println("</td>");  	
					    	  
					    	   out.println("<td>");
					    	  out.println(rs.getString(16));
					    	  out.println("</td>"); 
					    	  out.println("</tr>"); 
					    	  
					    	  }
					    	  
					    	  out.println("</table>");
					    	  
						%>			

 				



<%-- <form action="Institute_StudentViewList" method="post" name="form1">
<fieldset>
<legend>Company Information</legend>
<h5><%= session.getAttribute("fname") %></h5>
<h5><%= session.getAttribute("lname") %></h5>
<table>

<tr>
     <td>PRN Number</td>
     <td>First Name</td>
     <td>Last Name</td>
     <td>Mobile Number</td>
     <td>Date of Birth</td>
     <td>Institute Name</td>
     <td>Institute Code</td>
     <td>Placement Status</td>
     <td>User ID</td>
</tr>
<tr>

	<td></td>

</tr>
<tr>
	<td><input type="button" value="Send"/></td>
	<td><input type="reset" value="Reset"/></td>
</tr>	
</table>	  
</fieldset>
</form> --%>
</body>
</html>