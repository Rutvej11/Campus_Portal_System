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

		<h1>Status Information</h1>
		

		
			<table border="1" align="center">
				<tr>
					<td>Company ID</td>
					<td>View Status</td>
				</tr>
				<c:forEach items="${sessionScope.cidlist}" var="cid">
				<tr>
					<td><c:out value="${cid}"></c:out></td>
					<td><a href="GenerateStatus?cid=${cid}">Click Here!!!!</a></td>
				</tr>
				</c:forEach>
							
			</table>

</body>
</html>