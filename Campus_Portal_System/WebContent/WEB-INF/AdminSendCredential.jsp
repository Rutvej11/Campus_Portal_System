<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  import="java.sql.*" import="java.io.PrintWriter" import="java.sql.ResultSet"
  import="java.util.UUID"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <fieldset>
 <legend>Login Credential</legend>
      
       <%       
           String unique,password;
   	       unique = UUID.randomUUID().toString();
		   password=unique.substring(28);
		   
		
           String Cid=request.getParameter("CID");
           
        
           Connection con=(Connection)application.getAttribute("dbconnection"); 
	
	       PreparedStatement ps=con.prepareStatement("select * from company Where Company_ID="+Cid);  
	
	    	
	    	ResultSet rs=ps.executeQuery();
	    	out.println("<table border=1>");

	    	  while(rs.next())
	    	 {
	    	
	    	  out.println("<tr>");
    	  	
	    	  out.println("<td>");
	    	  out.println("User ID");
	    	  out.println("</td>"); 
	    	  
	    		
	    	  out.println("<td>");
	    	  out.println(rs.getString(10));
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
	    	
	    	
	     }
	    	
            out.println("</table>");
            
            out.println("<input type=button value=Send-Mail>"); 
	    	   
	    	   
	     
		    	  
%>         
 
 
 </fieldset>
    
</body>
</html>