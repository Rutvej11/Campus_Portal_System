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
			<h1>Schedule Information</h1>
			<c:forEach items="${sessionScope.SCH}" var="sc">
			<fieldset>
					<legend>General Information</legend>
					<table>
							<tr>
							<td><b>Company ID : </b></td>
							<td><c:out value="${sc.getCid() }"></c:out></td>
							</tr>
							
							<tr>
							<td><b>Company Name : </b></td>
							<td><c:out value="${sc.getCname() }"></c:out></td>
							</tr>
							
							<tr>
							<td><b>Company Domain : </b></td>
							<td><c:out value="${sc.getCdoamin() }"></c:out></td>
							</tr>
							
							<tr>
							<td><b>Company Address : </b></td>
							<td><c:out value="${sc.getStreet() }"></c:out>,<c:out value="${sc.getArea() }"></c:out>,
								<c:out value="${sc.getCity() }"></c:out>,<c:out value="${sc.getState() }"></c:out>
								-<c:out value="${sc.getPincode() }"></c:out>
							</td>
							</tr>
							
							<tr>
							<td><b>Company Description  : </b></td>
							<td><c:out value="${sc.getCdesc() }"></c:out></td>
							</tr>
							
							<tr>
							<td><b>Company Email : </b></td>
							<td><c:out value="${sc.getEmail() }"></c:out></td>
							</tr>
					</table>
			</fieldset>
			
			<fieldset>
					<legend>Schedule Information</legend>
					<table>
							<tr>
							<td><b>Job Profile Required : </b></td>
							<td><c:out value="${sc.getJob() }"></c:out></td>
							</tr>
							
							<tr>
							<td><b>Salary Offered (Per Annum)  : </b></td>
							<td><c:out value="${sc.getSalary()}"></c:out></td>
							</tr>
							
							<tr>
							<td><b>Venue Information : </b></td>
							<td><c:out value="${sc.getVenue() }"></c:out></td>
							</tr>
							
							<tr>
							<td><b>Reporting Date :  </b></td>
							<td><c:out value="${sc.getD()}"></c:out></td>
							</tr>
							
							<tr>
							<td><b>Reporting Time : </b></td>
							<td><c:out value="${sc.getTimeinfo()}"></c:out></td>
							</tr>
							
					</table>
					
			</fieldset>
			</c:forEach>
			
</body>
</html>