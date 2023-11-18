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
<legend>Student Performance</legend>

<%out.println("</br>");%>
<fieldset>
<legend>General Information</legend>
		
   <%       
            String cd=request.getParameter("code");
            long Ccode=Long.parseLong(cd);
            
           // out.println(Ccode);
           
            Connection con=(Connection)application.getAttribute("dbconnection"); 
	
	        // PreparedStatement ps=con.prepareStatement("select sh.Company_ID,sh.Prn_No,sh.First_Name,sh.Middle_Name,sh.Last_Name,sh.Institute_Code,sh.Round_Name,sh.Round_Status,sh.Final_Result,s.Email_ID,s.Mobile_No,c.Company_Name,c.Company_Domain from student s,shortlist sh,company c where sh.Company_ID=c.Company_ID and s.Prn_No="+Ccode);  
			  
			PreparedStatement ps=con.prepareStatement("select Prn_No,First_Name,Middle_Name,Last_Name from shortlist where Prn_No=?");
			ps.setLong(1,Ccode);
	    	ResultSet rs=ps.executeQuery();
	    					
	    	while(rs.next())
	    	{
			   
			   out.println("Prn No:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
			   out.println(rs.getLong(1));
			   out.println("</br>");
			   
	     	   out.println("Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
	 		
			   out.println(rs.getString(2));
			   out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
			   
			   out.println(rs.getString(3));
			   out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
			   
			   out.println(rs.getString(4));
			   out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
	    	   
	    	}
	    			    		
	 %>	
	 	</fieldset> 
		<fieldset>
			<legend>
		    	     Student Performance
			</legend>
			 
		 
	 <%	
	 			//String placement_status="No";
	 			
	 		  	PreparedStatement ps1=con.prepareStatement("select count(Company_ID) from shortlist where Prn_No=?");
				ps1.setLong(1,Ccode);	
				//ps1.setString(2,placement_status);
				
	    		ResultSet rs1=ps1.executeQuery();
	    		
			  while(rs1.next())
	          {
	               out.println("Total Number of Calls attended:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
				   out.println(rs1.getInt(1));
				   out.println("</br>");
				     	    	   
	    	  }
	    	  
	    	  ps1=con.prepareStatement("select Placement_Status from student where Prn_No=?");
			  ps1.setLong(1,Ccode);	
				//ps1.setString(2,placement_status);
				
	    	  rs1=ps1.executeQuery();
	    		
			  while(rs1.next())
	          {
					
					out.println("Placement Status:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
					
					if(rs1.getString("Placement_Status").equals("No"))
					{
		     	    	out.println("Fresher");
		     	    	out.println("</br>");
		 		    }	
		 		    else
		 		    {
		 		    	out.println("Placed");
		 		    	out.println("</br>");
		 		    } 	
		 		   	 	
		 		   out.println("</br>"); 	
		 		   out.println("Company Visited:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		 		   out.println("</br>");  	
		 		   						     	    	   
	    	  }
	    	  
	    	  ps1=con.prepareStatement("select Company_ID from shortlist where Prn_No=?");
	    	  ps1.setLong(1,Ccode);
	    	  rs1=ps1.executeQuery();
	    	  
	    	  out.println("<table border=1>");
	    	  out.println("<tr>");
	    	  out.println("<td>Company ID</td>");
	    	  out.println("<td>View</td>");
	    	   
	    	  while(rs1.next())
	    	  {
	    	  	
	   			   out.println("<td>");
				   out.println(rs1 .getInt(1));
				   out.println("</td>");  	 	  		
	    	  		
	    	  	   out.println("<td>");
	    	  	   out.println("<a href=Institute_CompanyVisited.jsp?cid="+rs1.getInt(1)+"&prn="+Ccode+">Show Details</a>");
	    	  	   out.println("</td>"); 	
	    	  
	    		  out.println("</tr>");  		
	    	  }
	    	
	    	  out.println("</table>");	 
	   %>
	   </fieldset>  			    		
</fieldset> 
</form>	    	 
</body>
</html>