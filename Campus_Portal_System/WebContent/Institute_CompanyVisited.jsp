<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    import="java.sql.*" import="java.io.PrintWriter" import="java.sql.ResultSet"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Company Visited </title>
</head>
<body>
<fieldset>
<legend>Student Status</legend>	

 	<%
 			//String cd=request.getParameter("prn");
            long prn_no=Long.parseLong(request.getParameter("prn"));
                      
            String cid=request.getParameter("cid");
 			 			
 			Connection con=(Connection)application.getAttribute("dbconnection");  
 			
 			//TO TAKE COMPANY NAME
 			String cname=null;
 			
 			PreparedStatement ps;
			  
			ps=con.prepareStatement("select sh.Company_ID,c.Company_Name,sh.First_Name, sh.Middle_Name,sh.Last_Name,sh.Round_Name,sh.Round_Status,sh.Final_Result from shortlist sh,company c where c.Company_ID=? and sh.Prn_No=?");
			
			ps.setString(1,cid);
			ps.setLong(2,prn_no);
			
	    	ResultSet rs=ps.executeQuery();
	    					
	    	while(rs.next())
	    	{
			   
			   out.println("Company Id:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
			   out.println(rs.getLong(1));
			   out.println("<br/>");
			   out.println("<br/>");
			   
	     	   out.println("Compnay Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
	 		   out.println(rs.getString(2));
	 		   out.println("<br/>");
	 		   out.println("<br/>");
	 		   
	 		   out.println("Name :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
	 		
			   out.println(rs.getString(3));
			   out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
			   
			   out.println(rs.getString(4));
			   out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
			   
			   out.println(rs.getString(5));
			   out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
			   out.println("<br/>");
			   out.println("<br/>");
	    	   
	 		   out.println("Round Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
			   out.println(rs.getString(6));
			   out.println("<br/>");
			   out.println("<br/>");
			   
			   out.println("Round Status:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
			   out.println(rs.getString(7));
			   out.println("<br/>");
			   out.println("<br/>");
			   
			   out.println("Final Result:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
			   out.println(rs.getString(8));
			   out.println("<br/>");
		    	   
	    	}
	    			    		
	 %>	
</fieldset> 	
</body>
</html>