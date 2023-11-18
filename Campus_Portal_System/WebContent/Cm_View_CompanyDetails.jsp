<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
import="java.sql.*" import="java.io.PrintWriter" import="java.sql.ResultSet"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<fieldset>
<legend>Company Information</legend>
 
 
   <%     	Connection con=(Connection)application.getAttribute("dbconnection"); 
	
   			String flag="No";
	       PreparedStatement ps=con.prepareStatement("select Company_ID  from company_requirement where Flag=? ");
	       ps.setString(1, flag);
	
	    	
	    	ResultSet rs=ps.executeQuery();
	    	out.println("<table border=1>");
	    	
	    	  out.println("<tr>");
	    	  	
	    	  out.println("<td>");
	    	  out.println("Company ID");
	    	  out.println("</td>");  
	    	  
	    	  out.println("<td>");
	    	  out.println("Company Details");
	    	  out.println("</td>"); 
	    	  
	    	  out.println("</tr>"); 
	    	
	    	
	    	  while(rs.next())
	    	 {
	          out.println("<tr>");
	    	  	
	    	  out.println("<td>");
	    	  out.println(rs.getInt(1));
	    	  out.println("</td>");  	 
	    	  
	    	  out.println("<td>");
	    	  out.println("<a href=Cm_CompanyDetails.jsp?code="+rs.getInt(1)+"> View Details</a>");
	    	  out.println("</td>"); 
	    	  
	    	 }
	    	  
	    	 out.println("</table>");
   
   %>         

</fieldset>
</body>
</html>