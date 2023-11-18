<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*" import="java.io.PrintWriter" import="java.sql.ResultSet"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Institute Student Performance</title>


</head>
<body>
		
<%
					Connection con=(Connection)application.getAttribute("dbconnection"); 
					String code=session.getAttribute("Icode").toString();
					//int i_code=Integer.parseInt(code);
					
					PreparedStatement ps=con.prepareStatement("select Prn_No,First_Name, Middle_Name, Last_Name from shortlist where Institute_Code=?");
					  
					ps.setString(1,code);
					    	
					    	ResultSet rs=ps.executeQuery();
					    	
					    	out.println("<table border=1>");
					    	
					    	out.println("<tr>");
					    	
	    					out.println("<td>Prn No</td>");
	     					out.println("<td>First Name</td>");
	    					out.println("<td>Middle Name</td>");
							out.println("<td>Last Name</td>");
							out.println("<td>Track Performance</td>");
							
							out.println("</tr>");
					    
					    	
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
						    	  out.println(rs.getString(3));
						    	  out.println("</td>");  
						    	  		  	  	
						    	  out.println("<td>");
						    	  out.println(rs.getString(4));
						    	  out.println("</td>");  	

						    	  out.println("<td>");
	    	  					  out.println("<a href=Institute_ViewPerformance.jsp?code="+rs.getLong(1)+">Show Details</a>");
	    	  					  out.println("</td>"); 
	    	  
						    	  out.println("</tr>");
					    	  }
					    	  
					    	  out.println("</table>");
					    	  
%>		


</body>
</html>