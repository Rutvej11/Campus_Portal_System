<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  import="java.io.PrintWriter" import="java.sql.ResultSet"
  import="java.util.UUID" 
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
     
    String unique_id,unique_pass,uid,password;

    unique_id = UUID.randomUUID().toString();
    uid=unique_id.substring(28);
    
    unique_pass = UUID.randomUUID().toString();
    password=unique_pass.substring(28);
    
    
    
   out.println("<table border=1>");

     out.println("<tr>");
	
		  out.println("<td>");
		  out.println("User ID");
		  out.println("</td>"); 
		  
		  out.println("<td>");
		  out.println(uid);
		  out.println("</td>");
	
	 out.println("</tr>"); 
	  
	 out.println("<tr>");
	  	
		  out.println("<td>");
		  out.println("password");
		  out.println("</td>"); 
		  out.println("<td>");
		  out.println(password);
		  out.println("</td>"); 
	  
	 out.println("</tr>"); 
	
   out.println("</table>");
  
  out.println("<input type=button value=Send-Mail>"); 
	   
	   


%>

</body>
</html>