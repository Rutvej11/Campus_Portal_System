<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Campus Portal System</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" />
</head>
<body>
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
		<%
			String flag;
			flag=session.getAttribute("View_Flag").toString();
			if(flag=="No")
			{
		%>
				<h3>Student List is not yet generated......</h3>
		<%
			}
			
			if(flag=="Not")
			{
		%>
				<h3>Requirement is not yet submitted......</h3>
		<%
			}
		%>
<!-- ======================================================================================================== -->			
 <div id="footer">
	<p id="legal">&copy;2015 Compaus Portal. All Rights Reserved. | Designed by ABC Software</p>
</div>
</body>
</html>