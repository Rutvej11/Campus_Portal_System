<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

		<fieldset>
		<legend>Status Information</legend>
		<table>
				<c:forEach items="${sessionScope.al_status}" var="st1">
				<tr>
					<td><b>PRN NO :</b></td>
					<td><c:out value="${st1.getPrn()}"></c:out></td>	
				</tr>
				
				<tr>
					<td><b>Name :</b></td>
					<td><%=session.getAttribute("Fname")%> <%=session.getAttribute("Lname")%></td>	
				</tr>
				
				<tr>
					<td><b>Company Name :</b></td>
					<td><%=session.getAttribute("cname")%></td>	
				</tr>
				
				<tr>
					<td><b>Previous Round Name : </b></td>
					<td><%=session.getAttribute("prname")%></td>	
				</tr>
				
				<tr>
					<td><b>Previous Round Status :</b></td>
					<td><%=session.getAttribute("prstatus")%></td>	
				</tr>
				
				<tr>
					<td><b>Current Round Name : </b></td>
					<td><c:out value="${st1.getRoundname()}"></c:out></td>	
				</tr>
				
				<tr>
					<td><b>Current Round Status :</b></td>
					<td><c:out value="${st1.getRoundstatus()}"></c:out></td>	
				</tr>	
								
				<tr>
					<td><b>Final Result :</b></td>
					<td><c:out value="${st1.getFresult()}"></c:out></td>	
				</tr>
				
			  </c:forEach>
	 </table>			
  				
		</fieldset>
		

</body>
</html>