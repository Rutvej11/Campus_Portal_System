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
		<legend>Update Student Status</legend>
		<table border="1">
			<tr>
				<td><h3>PRN NO</h3></td>
				<td><h3>First Name</h3></td>
				<td><h3>Middle Name</h3></td>
				<td><h3>Last Name</h3></td>
				<td><h3>Final Result</h3></td>
				<td><h3>Update Here</h3></td>
			</tr>
			
			<c:forEach var="st" items="${StudentList}">
			<tr>
				<td><c:out value="${st.getPrnno()}"></c:out></td>
				<td><c:out value="${st.getFname()}"></c:out></td>
				<td><c:out value="${st.getMname()}"></c:out></td>
				<td><c:out value="${st.getLname()}"></c:out></td>
				<td><c:out value="${st.getFinalresult()}"></c:out></td>
				<td><a href="http://localhost:8080/Campus_Portal_System/Update?prn=${st.getPrnno()}">Click Here</a></td>
			</tr>
			</c:forEach>
			
		</table>
		</fieldset>
</body>
</html>