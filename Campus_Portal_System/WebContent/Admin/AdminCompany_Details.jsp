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

<form action="" method="post">
<fieldset>
<legend>Company Information</legend>
 
 
   <%      
            
            String Ccode=request.getParameter("code");
            
          
          
    
   
            Connection con=(Connection)application.getAttribute("dbconnection"); 
	
	       PreparedStatement ps=con.prepareStatement("select * from company Where Company_ID="+Ccode);  
	
	    	
	    	ResultSet rs=ps.executeQuery();
	    	out.println("<table border=1>");

	    	  while(rs.next())
	    	 {
	    	
	    	  out.println("<tr>");
    	  	
	    	  out.println("<td>");
	    	  out.println("Company ID");
	    	  out.println("</td>"); 
	    	  
	    		
	    	  out.println("<td>");
	    	  out.println(rs.getInt(1));
	    	  out.println("</td>");
	    	
	    	  out.println("</tr>"); 
	    	
	            out.println("<tr>");
	    		  
		    	  out.println("<td>");
		    	  out.println("Company Name");
		    	  out.println("</td>"); 
		    	  
		    	  
		  
		    	  out.println("<td>");
		    	  out.println(rs.getString(2));
		    	  out.println("</td>");  
		    	  
		    	 out.println("</tr>");
		    	 
		    	 
		    	 out.println("<tr>");
	    		  
		    	  out.println("<td>");
		    	  out.println("Company Domain");
		    	  out.println("</td>"); 
		    	  
		    	  
		  
		    	  out.println("<td>");
		    	  out.println(rs.getString(3));
		    	  out.println("</td>");  
		    	  
		    	 out.println("</tr>");
		    	 
		    	 out.println("<tr>");
	    		  
		    	  out.println("<td>");
		    	  out.println("Street");
		    	  out.println("</td>"); 
		    	  
		    	  
		  
		    	  out.println("<td>");
		    	  out.println(rs.getString(4));
		    	  out.println("</td>");  
		    	  
		    	 out.println("</tr>");
		    	 
		    	 out.println("<tr>");
	    		  
		    	  out.println("<td>");
		    	  out.println("Area");
		    	  out.println("</td>"); 
		    	  
		    	  
		  
		    	  out.println("<td>");
		    	  out.println(rs.getString(5));
		    	  out.println("</td>");  
		    	  
		    	 out.println("</tr>");
		    	 
		    	 out.println("<tr>");
	    		  
		    	  out.println("<td>");
		    	  out.println("Pincode");
		    	  out.println("</td>"); 
		    	  
		    	  
		  
		    	  out.println("<td>");
		    	  out.println(rs.getInt(6));
		    	  out.println("</td>");  
		    	  
		    	 out.println("</tr>");
		    	 
		    	 out.println("<tr>");
	    		  
		    	  out.println("<td>");
		    	  out.println("State");
		    	  out.println("</td>"); 
		    	  
		    	  
		  
		    	  out.println("<td>");
		    	  out.println(rs.getString(7));
		    	  out.println("</td>");  
		    	  
		    	 out.println("</tr>");
		    	 
		    	 out.println("<tr>");
	    		  
		    	  out.println("<td>");
		    	  out.println("City");
		    	  out.println("</td>"); 
		    	  
		    	  
		  
		    	  out.println("<td>");
		    	  out.println(rs.getString(8));
		    	  out.println("</td>");  
		    	  
		    	 out.println("</tr>");
		    	 
		    	 out.println("<tr>");
	    		  
		    	  out.println("<td>");
		    	  out.println("Company Description");
		    	  out.println("</td>"); 
		    	  
		    	  
		  
		    	  out.println("<td>");
		    	  out.println(rs.getString(9));
		    	  out.println("</td>");  
		    	  
		    	 out.println("</tr>");
		    	 
		    	 
		    	 
		    	 out.println("<tr>");
	    		  /* 
		    	  out.println("<td>");
		    	  out.println("<a href=AdminSendCredential.jsp?CID="+rs.getInt(1)+"&Flag="+rs.getString(11)+">Verified</a>");
		    	  out.println("</td>");  */
		    	  
		    	  out.println("<td>");
		    	  out.println("<a href=http://localhost:8080/Campus_Portal_System/Update_Flag?CID="+rs.getInt(1)+">Verified</a>");
		    	  out.println("</td>"); 
		    	  
		    	 out.println("</tr>");
		    	 
		    	 
		    	 
		    	 
		    	 
	    	 }
	    	
            out.println("</table>");
            
       //     out.println("<a href=Send_email.jsp?CID="+rs.getInt(1)+">Verified</a>");
	    	   
	    	   
	      // out.println("<input type=Button value=verified>");
		    	  
		  // out.println("<input type=Button value=Non-varified>");
		    	  
%>         


</fieldset>
</form> 

</body>
</html>