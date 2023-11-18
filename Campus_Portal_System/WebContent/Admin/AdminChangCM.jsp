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
<form action="">
<fieldset>
     <%     	
           String Flag="Yes";
           
           Connection con=(Connection)application.getAttribute("dbconnection"); 
	
	       PreparedStatement ps=con.prepareStatement("select Institute_Code,Institute_Name from institute where Head_Center=?");
	       ps.setString(1, Flag);
	
	    	
	    	ResultSet rs=ps.executeQuery();
	    	out.println("<table border=1>");
	    	
	    	  	
	    	  out.println("<td>");
	    	  out.println("Institute Code");
	    	  out.println("</td>"); 
	    	  
	    	  out.println("<td>");
	    	  out.println("Institute Name");
	    	  out.println("</td>"); 
	    	  
	    	  out.println("</tr>"); 
	    	
	    	
	    	  while(rs.next())
	    	 {
	          out.println("<tr>");
	          
	          	    	  	
	    	  out.println("<td>");
	    	  session.setAttribute("existing_cm", rs.getInt(1));
	    	  out.println(rs.getInt(1));
	    	  out.println("</td>");  	
	    	  
	    	   out.println("<td>");
	    	  out.println(rs.getString(2));
	    	  out.println("</td>"); 
	    	  
	    	
	    	  
	    	 }
	    	  
	    	  
	    	 
	    	  
	          out.println("</table>");
	          
	      
	          
	          
	    	 
	    	  out.println("<a href=Admin_change_CM.jsp> Change_Central_manager</a>");
   
   
   
   
   
   
   %> 
 


</fieldset>


</form>

</body>
</html>