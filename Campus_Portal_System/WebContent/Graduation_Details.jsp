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
<form action="Project_Details.jsp" method="post" name="form1">
<fieldset>
<legend>Graduation Details</legend>
     <fieldset>
          <legend>Qualification</legend>

      <table>
      		<c:forEach items="${graduation}" var="grd">
      		<tr>
      		<td>Qualification</td>
      		<td><input type="text" value="${grd.getQualification()}" /></td>
			</tr>

			<tr>
			<td>University Name</td>
      		<td><input type="text" value="${grd.getUname()}" /></td>
			</tr>

			<tr>
      		<td>Institute Name</td>
      		<td><input type="text" value="${grd.getIname()}" /></td>
      		</tr>

      		<tr>
      		<td>Degree</td>
      		<td><input type="text" value="${grd.getDegree()}" /></td>
      		</tr>

      		<tr>
      		<td>Stream</td>
      		<td><input type="text" value="${grd.getStream()}" /></td>
      		</tr>

      		<tr>
      		<td>Duration of course</td>
      		<td><input type="text" value="${grd.getDuration()}" /></td>
      		</tr>

      		<tr>
      			<td>
      			<table>
      					<tr>
      						<td>Semester Exam Pattern</td>
      					</tr>
      					<tr>
      					<td>First Semester</td>
      					<td><input type="text" value="${grd.getS1()}" /></td>
      					</tr>

      					<tr>
      					<td>Second Semester</td>
      					<td><input type="text" value="${grd.getS2()}" /></td>
      					</tr>

      					<tr>
      					<td>third Semester</td>
      					<td><input type="text" value="${grd.getS3()}" /></td>
      					</tr>

						<tr>
      					<td>Fourth Semester</td>
      					<td><input type="text" value="${grd.getS4()}" /></td>
      					</tr>


						<tr>
      					<td>Fifth Semester</td>
      					<td><input type="text" value="${grd.getS5()}" /></td>
      					</tr>


						<tr>
      					<td>Sixth Semester</td>
      					<td><input type="text" value="${grd.getS6()}" /></td>
      					</tr>


						<tr>
      					<td>Seventh Semester</td>
      					<td><input type="text" value="${grd.getS7()}" /></td>
      					</tr>

						<tr>
      					<td>Eight Semester</td>
      					<td><input type="text" value="${grd.getS8()}" /></td>
      					</tr>

      			</table>
      			</td>
      		</tr>
			<tr>
				<td>Obtained marks</td>
      			<td><input type="text" value="${grd.getObtmarks()}" /></td>
      			<td>Out of</td>
      			<td><input type="text" value="${grd.getTotal()}" /></td>
			</tr>

			<tr>
      					<td>Admission Year</td>
      					<td><input type="text" value="${grd.getAdmissionyr()}" /></td>
      		</tr>

      		<tr>
      					<td>Passing Year</td>
      					<td><input type="text" value="${grd.getPassingyr()}" /></td>
      		</tr>

      		<tr>
      					<td>Percentage</td>
      					<td><input type="text" value="${grd.getPer()}" /></td>
      		</tr>

      		</c:forEach>

     </table>


      </fieldset>


    <input type="submit" value="continue" onclick="">




</fieldset>


</form>

</body>
</html>