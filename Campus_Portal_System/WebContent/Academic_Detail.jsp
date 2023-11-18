<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Campus Portal System</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" />
</head>
<!-- start header -->
<div id="header">
	<div id="menu">
		<ul>
			<li><a href="index.html">Home</a></li>
			<li><a href="Login.html">Login</a></li>
			<li><a href="Register.jsp">Register</a></li>
		</ul>
	</div>
</div>
<!-- end header -->
<!-- start page -->
<div id="page">
<!-- 	start content -->
	<div id="content">
		<div class="post">
			<h1 class="title">Welcome to Campus Portal</h1>
		</div>
	</div>
</div>
<!-- end page -->
<!-- ======================================================================================================== -->
<body>
<form action="GenerateGraduation" method="post" name="form1">
<fieldset>
<legend>Academic Details</legend>
<table>
<tr>

     <td>Qualification</td>
     <td>Specialization</td>
     <td>Institute</td>
     <td>Board</td>
     <td>Obtained Marks</td>
     <td>Total</td>
     <td>Year of passing</td>
     <td>Percentage</td>
</tr>
      
      <c:forEach var="acd" items="${ACD}">
      <tr>
      	<td><c:out value="${acd.getQualification()}" /></td>
      	<td><c:out value="${acd.getSpecialization()}" /></td>
      	<td><c:out value="${acd.getBoard()}" /></td>
      	<td><c:out value="${acd.getInstitute()}" /></td>
      	<td><c:out value="${acd.getObt_marks()}" /></td>
      	<td><c:out value="${acd.getTotal_marks()}" /></td>
      	<td><c:out value="${acd.getPassing_yr()}" /></td>
      	<td><c:out value="${acd.getPer()}" /></td>
      	</tr>
      </c:forEach>  


</table>
<input type="submit" value="continue"/>

</fieldset>
</form>
<!-- ======================================================================================================== -->
<div id="footer">
	<p id="legal">&copy;2023 Compaus Portal. All Rights Reserved. | Designed by ABC Software</p>
</div>
</body>
</html>