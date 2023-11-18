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
		<h1>Resume</h1>
		<h3>Basic Information</h3><hr/>
		
		<c:forEach items="${sessionScope.student}" var="st">
		<table>
		<tbody>	
			<tr>
			<td><label>Name  :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
			<td><label><c:out value="${st.getFname() }"></c:out>&nbsp;&nbsp;</label><label><c:out value="${st.getMname() }"></c:out>&nbsp;&nbsp;</label><label><c:out value="${st.getLname() }"></c:out>&nbsp;&nbsp;</label></td>
			</tr>
			
			<tr>
			<td><label>PRN   &nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
			<td><label><c:out value="${PRN1}"></c:out>&nbsp;&nbsp;</label></td>
			</tr>
			
			<tr>
			<td><label>Course   &nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
			<td><label><c:out value="${st.getCourse() }"></c:out>&nbsp;&nbsp;</label></td>
			</tr>
			
			<tr>
			<td><label>Address   &nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
			<td><label><c:out value="${st.getStreet() }"></c:out>,<c:out value="${st.getArea() }"></c:out>,<c:out value="${st.getCity() }"></c:out>
			<c:out value="${st.getState() }"></c:out>-<c:out value="${st.getPincode() }"></c:out>&nbsp;&nbsp;</label></td>
			</tr>
		</tbody>
		</table>
		
		
		<h3>Academic Details</h3><hr/>
		<table border="1">
		<tbody>	
			<tr>
			<td><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Qualification&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
			<td><label>&nbsp;&nbsp;&nbsp;&nbsp;Stream&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
			<td><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Institute&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
			<td><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Board&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
			<td><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Passing Year&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
			<td><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Percentage&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>	
			</tr>
			
			<tr>
			<td><c:out value="${st.getQualification() }"></c:out></td>	
			<td><c:out value="${st.getStream() }"></c:out></td>
			<td><c:out value="${st.getIname() }"></c:out></td>
			<td><c:out value="${st.getBoard() }"></c:out></td>
			<td><c:out value="${st.getPassingyr() }"></c:out></td>
			<td><c:out value="${st.getPercentage() }"></c:out></td>		
			</tr>
			
			<c:forEach items="${sessionScope.ACD1}" var="st1">
			<tr>
				<td><c:out value="${st1.getQualification() }"></c:out></td>	
				<td><c:out value="${st1.getSpecialization() }"></c:out></td>
				<td><c:out value="${st1.getInstitute() }"></c:out></td>
				<td><c:out value="${st1.getBoard() }"></c:out></td>
				<td><c:out value="${st1.getPassing_yr() }"></c:out></td>
				<td><c:out value="${st1.getPer() }"></c:out></td>	
			</tr>
			</c:forEach>
			
		</tbody>
		</table>
		
		
		
		<h3>Academic Projects</h3><hr/>
		<table>
		<tbody>	
			<tr>
			<td><label>Title  :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
			<td><label><c:out value="${st.getPtitle() }"></c:out>&nbsp;&nbsp;</label></td>
			</tr>
			
			<tr>
			<td><label>Platform   &nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
			<td><label><c:out value="${st.getPlatform() }"></c:out>&nbsp;&nbsp;</label></td>
			</tr>
			
			<tr>
			<td><label>Duration   &nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
			<td><label><c:out value="${st.getDuration() }"></c:out>&nbsp;&nbsp;</label></td>
			</tr>
			
			<tr>
			<td><label>Description   &nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
			<td><label><c:out value="${st.getDescription() }"></c:out>&nbsp;&nbsp;</label></td>
			</tr>
		</tbody>
		</table>
		
		
		<h3>Other Information</h3><hr/>
		<table>
		<tbody>	
			<tr>
			<td><label>Extra Curricular  :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
			<td><label><c:out value="${st.getExtra() }"></c:out>&nbsp;&nbsp;</label></td>
			</tr>
		</tbody>
		</table>
		
		
		<h3>Personal Information</h3><hr/>
		<table>
		<tbody>	
			<tr>
			<td><label>Date of Birth  :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
			<td><label><c:out value="${st.getDob() }"></c:out>&nbsp;&nbsp;</label></td>
			</tr>
			
			<tr>
			<td><label>Languages Known    &nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
			<td><label><c:out value="${st.getLang() }"></c:out>&nbsp;&nbsp;</label></td>
			</tr>
		</tbody>
		</table>
		</c:forEach>
		<h3>I hereby declare that the information given above is true to the best of my Information knowledge belief.</h3>
		<h3>Date :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Signature :</h3>

</body>
</html>