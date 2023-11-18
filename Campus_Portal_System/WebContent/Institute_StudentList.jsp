<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*" import="java.io.PrintWriter" import="java.sql.ResultSet"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Institute Student List</title>


</head>
<body>

<table border="1">

					
</table>					
					

<%
					Connection con=(Connection)application.getAttribute("dbconnection"); 

					String icode=session.getAttribute("Icode").toString();	
					
				//	PreparedStatement ps=con.prepareStatement("select * from student,project_details,other_information where student.Prn_No=project_details.Prn_No and student.Prn_No=other_information.Prn_No");  
					
			   PreparedStatement ps=con.prepareStatement("select * from student,student_academic,student_graduation,project_details,other_information where student.Prn_No=student_academic.Prn_No and student.Prn_No=student_graduation.Prn_No and student.Prn_No=project_details.Prn_No and student.Prn_No=other_information.Prn_No and student.Institute_Code=?;");
			   						ps.setString(1,icode);						
			  
			  			  	ResultSet rs=ps.executeQuery();
			              	out.println("<table border=1>");
					    	out.println("<tr>");
					    	
					    	/****** STUDENT GENERAL******/
					    	
     						out.println("<td>PRN Number	</td>");
	    					out.println("<td>First Name	</td>");
	     					out.println("<td>Last Name	</td>");
	    					out.println("<td>Mobile Number	</td>");
	    				    out.println("<td>Date of Birth	</td>");
							out.println("<td>Institute Name	</td>");
							out.println("<td>Institute Code	</td>");
							out.println("<td>Email ID</td>");
							out.println("<td>Placement Status</td>");
							out.println("<td>User ID</td>");
							
							/***** STUDENT ACADEMIC ****/ 
							
							out.println("<td>Qualification</td>");
							out.println("<td>Specialization</td>");
							out.println("<td>Board</td>");
							out.println("<td>Obtained marks</td>");
							out.println("<td>Total Marks</td>");
							out.println("<td>Year Of Passing</td>");
							out.println("<td>Percentage</td>");
							
							/***** STUDENT GRADUCATION ****/
							
							out.println("<td>Qualification</td>");
							out.println("<td>University</td>");
							out.println("<td>Institute Name</td>");
							out.println("<td>Degree</td>");
							out.println("<td>Stream</td>");
							out.println("<td>Course Duration</td>");
							out.println("<td>Sem1</td>");
							out.println("<td>Sem2</td>");
							out.println("<td>Sem3</td>");
							out.println("<td>Sem4</td>");
							out.println("<td>Sem5</td>");
							out.println("<td>Sem6</td>");
							out.println("<td>Sem7</td>");
							out.println("<td>Sem8</td>");
							out.println("<td>Total marks</td>");
							out.println("<td>Obtained marks</td>");
							out.println("<td>Admission Year</td>");
							out.println("<td>Passing Year</td>");
							out.println("<td>Average</td>");
							
							
							/***** PEOJECT DETAILS ****/
							
							out.println("<td>Qualification</td>");
							out.println("<td>Project Title</td>");
							out.println("<td>Platform</td>");
							out.println("<td>Description</td>");
							
							
						   /*****	OTHER_INFORMATION ****/
						   
							out.println("<td>Hobbies</td>");
							out.println("<td>Languages</td>");
							out.println("<td>Extra Activity</td>");
							out.println("<td>Technical Certification</td>");
							out.println("<td>Job Experiance</td>");
							out.println("</tr>");
					    
					    	
					    	  while(rs.next())
					    	  {
					    	  	out.println("<tr>");
					    	  	
			/*=================================	STUDENT TABLE ==============================*/					    	  	
						    	  out.println("<td>");
						    	  out.println(rs.getLong(1));
						    	  out.println("</td>");  	
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getString(2));
						    	  out.println("</td>");  
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getString(4));
						    	  out.println("</td>");  
						    	  		  	  	
						    	  out.println("<td>");
						    	  out.println(rs.getLong(5));
						    	  out.println("</td>");  	
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getDate(6));
						    	  out.println("</td>");  	
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getString(12));
						    	  out.println("</td>");  	
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getString(13));
						    	  out.println("</td>");  
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getString(14));
						    	  out.println("</td>");  	
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getString(15));
						    	  out.println("</td>");  	
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getString(16));
						    	  out.println("</td>"); 
						    	   
		/*=============================== STUDENT_ACADEMIC TABLE ==================================*/   
		
		
						    	  out.println("<td>");
						    	  out.println(rs.getString("Qualification")); 
						    	  out.println("</td>");
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getString("Specialization")); 
						    	  out.println("</td>");
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getString("Board")); 
						    	  out.println("</td>");
						    	 
						    	  out.println("<td>");
						    	  out.println(rs.getInt("Obtained_marks"));
						    	  out.println("</td>"); 
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getInt("Total_Marks"));
						    	  out.println("</td>"); 
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getInt("Year_Of_Passing"));
						    	  out.println("</td>");
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getDouble("Percentage"));
						    	  out.println("</td>");
						    	  
   		  /*=========================== STUDENT_GRADUCATION TABLE =================================*/
		   	  
		   
		   						  out.println("<td>");
						    	  out.println(rs.getString("Qualification"));  
						    	  out.println("</td>");
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getString("University")); 
						    	  out.println("</td>");
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getString("Institute_Name")); 
						    	  out.println("</td>");
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getString("Degree")); 
						    	  out.println("</td>");
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getString("Stream")); 
						    	  out.println("</td>");
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getInt("Course_Duration"));
						    	  out.println("</td>");
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getInt("Sem1"));
						    	  out.println("</td>");
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getInt("Sem2"));
						    	  out.println("</td>");
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getInt("Sem3"));
						    	  out.println("</td>");
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getInt("Sem4"));
						    	  out.println("</td>");
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getInt("Sem5"));
						    	  out.println("</td>");
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getInt("Sem6"));
						    	  out.println("</td>");
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getInt("Sem7"));
						    	  out.println("</td>");
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getInt("Sem8"));
						    	  out.println("</td>");
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getInt("Total_marks"));
						    	  out.println("</td>");
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getInt("Obtained_marks"));
						    	  out.println("</td>");
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getInt("Admission_Year"));
						    	  out.println("</td>");
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getInt("Passing_Year"));
						    	  out.println("</td>");
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getDouble("Average"));
						    	  out.println("</td>");
						    	  
         /*============================ PEOJECT_DETAILS TABLE =============================*/   						    	  
						    	  
						    	/*  out.println("<td>");
						    	  out.println(rs.getString("College_Name")); 
						    	  out.println("</td>");*/
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getString("Qualification")); 
						    	  out.println("</td>");
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getString("Project_Title")); 
						    	  out.println("</td>");
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getString("Platform")); 
						    	  out.println("</td>");
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getString("Description")); 
						    	  out.println("</td>");		    	  
						    	  
		/*=============================== OTHER_INFORMATION TABLE =========================*/   						    	  
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getString("Hobbies")); 
						    	  out.println("</td>");
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getString("Languages")); 
						    	  out.println("</td>");
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getString("Extra_Activity")); 
						    	  out.println("</td>");
						    	  
						    	  out.println("<td>");
						    	  out.println(rs.getString("Technical_Certification")); 
						    	  out.println("</td>");
						    	   		  
						    	  out.println("<td>");
						    	  out.println(rs.getString("Job_Experiance")); 
						    	  out.println("</td>");
						    	    	  
					    	  	  out.println("</tr>");
					    	  }
					    	  
					    	  out.println("</table>");
					    	  
						%>		


</body>
</html>