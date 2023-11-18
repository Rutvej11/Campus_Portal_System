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

<form action="Cm_Shortlist" method="post">
<fieldset>
<legend>Company Information</legend>
 
 
   <%       
            String Ccode=request.getParameter("code");
   
            Connection con=(Connection)application.getAttribute("dbconnection"); 
	
	       PreparedStatement ps=con.prepareStatement("select * from company where Company_ID="+Ccode);  
	       PreparedStatement ps1=con.prepareStatement("select * from company_requirement where Company_ID="+Ccode);  
	   	
	    	
	    	ResultSet rs=ps.executeQuery();
	    	ResultSet rs1=ps1.executeQuery();
	    	out.println("<table border=1>");
	    	  
	    	  while(rs.next() && rs1.next())
	    	  {
		    	  out.println("<tr>");
			    	  out.println("<td>");
			    	  out.println("Company ID");
			    	  out.println("</td>"); 
			    	  out.println("<td>");
			    	  out.println(rs.getInt(1));
			    	  session.setAttribute("cid",rs.getInt(1));
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
			    	  out.println("Company Description");
			    	  out.println("</td>"); 
			    	  out.println("<td>");
			    	  out.println(rs.getString(9));
			    	  out.println("</td>");  
			   	  
			      out.println("</tr>");
	   
			     out.println("<tr>");
			    	  out.println("<td>");
			    	  out.println("Job Profile ");
			    	  out.println("</td>"); 
			    	  out.println("<td>");
			    	  out.println(rs1.getString(2));
			    	  out.println("</td>");  
	      	  	 out.println("</tr>"); 
	      	  
			      out.println("<tr>");
			    	  out.println("<td>");
			    	  out.println("Salary ");
			    	  out.println("</td>"); 
			    	  out.println("<td>");
			    	  out.println(rs1.getLong(3));
			    	  out.println("</td>");  
		    	  out.println("</tr>"); 
	    	  
		    	  out.println("<tr>");
			    	  out.println("<td>");
			    	  out.println("SSC Percentage ");
			    	  out.println("</td>"); 
			    	  out.println("<td>");
			    	  out.println(rs1.getLong(4));
			    	  out.println("</td>");  
	    	  	  out.println("</tr>"); 
    	  	  
	    	  	  out.println("<tr>");
			    	  out.println("<td>");
			    	  out.println("HSC Percentage ");
			    	  out.println("</td>"); 
			    	  out.println("<td>");
			    	  out.println(rs1.getLong(5));
			    	  out.println("</td>");  
		  	      out.println("</tr>"); 
	  	      
		  	      out.println("<tr>");
			    	  out.println("<td>");
			    	  out.println("Degree Percentage ");
			    	  out.println("</td>"); 
			    	  out.println("<td>");
			    	  out.println(rs1.getLong(6));
			    	  out.println("</td>");  
		          out.println("</tr>"); 
	          
		          out.println("<tr>");
			    	  out.println("<td>");
			    	  out.println("Rounds ");
			    	  out.println("</td>"); 
			    	  out.println("<td>");
			    	  out.println(rs1.getInt(7));
			    	  out.println("</td>");  
	              out.println("</tr>"); 
			    	 
	              out.println("<tr>");
			    	  out.println("<td>");
			    	  out.println("Stage Information");
			    	  out.println("</td>"); 
			    	  out.println("<td>");
			    	  out.println(rs1.getString(8));
			    	  out.println("</td>");  
	      	      out.println("</tr>"); 
	      	      
	      	    out.println("<tr>");
		    	  out.println("<td>");
		    	  out.println("Venue");
		    	  out.println("</td>"); 
		    	  out.println("<td>");
		    	  out.println(rs1.getString(9));
		    	  out.println("</td>");  
		        out.println("</tr>"); 
		        
		        out.println("<tr>");
		    	  out.println("<td>");
		    	  out.println("Date");
		    	  out.println("</td>"); 
		    	  out.println("<td>");
		    	  out.println(rs1.getDate(10));
		    	  out.println("</td>");  
		        out.println("</tr>"); 
		        
		        out.println("<tr>");
		    	  out.println("<td>");
		    	  out.println("Time");
		    	  out.println("</td>"); 
		    	  out.println("<td>");
		    	  out.println(rs1.getString(11));
		    	  out.println("</td>");  
		        out.println("</tr>"); 
			       
			       
	    	  }
	    	  
	     out.println("</table>");
	     
	    out.println("<a href=Cm_Shortlist?ssc="+rs1.getLong(4)+"&hsc="+rs1.getLong(5)+"&degree="+rs1.getLong(6)+">Sort According to Criteria</a>");	     
	     
%>         

</fieldset>
</form> 

</body>
</html>