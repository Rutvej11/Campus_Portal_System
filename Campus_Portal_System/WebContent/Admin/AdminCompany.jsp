 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   import="java.sql.*" import="java.io.PrintWriter" import="java.sql.ResultSet"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<%@page import="java.util.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="" method="post">
<fieldset>
<legend>Company Information</legend>
 
 
   <%     	
   
       //  String C_Flag=request.getParameter("C_FLAG");
         String Flag="No";
        // out.println(C_Flag);
          Connection con=(Connection)application.getAttribute("dbconnection"); 
        
           
	
	       PreparedStatement ps=con.prepareStatement("select * from company where flag=?");  
	
	    	ps.setString(1,Flag);
	       ResultSet rs=ps.executeQuery();
	    	
	    	out.println("<table border=1>");
	    	
	    	  out.println("<tr>");
	    	  	
	    	  out.println("<td>");
	    	  out.println("Company ID");
	    	  out.println("</td>"); 
	    	  
	    	  out.println("<td>");
	    	  out.println("Company Name");
	    	  out.println("</td>"); 
	    	  
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
	    	  out.println("<a href=AdminCompany_Details.jsp?code="+rs.getInt(1)+"> Show Details</a>");
	    	  out.println("</td>");  
	    	  
	    	   
	    	  
	    	 }
	    	  
	   out.println("</table>");
   
   
%>         

</fieldset>
</form> 
</body>
</html>