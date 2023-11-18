<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Campus Portal System</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
function valid()
{
	//HOBBIES
	var hobbies = document.form1.hobbies.value;
	if (hobbies.length == 0) 
	{
	   alert("Hobbies can not be empty");
       document.form1.hobbies.value = "";
       document.form1.hobbies.focus();
       return;
	}
	else
	{
			  for(var i=0;i<hobbies.length;i++)
              {
                  if (hobbies.charCodeAt(i) >= 48 && hobbies.charCodeAt(i) <= 57)
                  {
                   alert("Hobbies cannot contain  numbers");
                  	document.form1.hobbies.value = "";
                  	document.form1.hobbies.focus();
                 	 return;  
                  }
                  else
                  {
                  	
                  }
              }
                   
	}
	
	//LANGUAGE
	var language_known = document.form1.language_known.value;
	if (language_known.length == 0) 
	{
	   alert("Languages can not be empty");
       document.form1.language_known.value = "";
       document.form1.language_known.focus();
       return;
	}
	else
	{
			  for(var i=0;i<hobbies.length;i++)
              {
                  if (language_known.charCodeAt(i) >= 48 && language_known.charCodeAt(i) <= 57)
                  {
                   alert("Languages cannot contain  numbers");
                  	document.form1.language_known.value = "";
                  	document.form1.language_known.focus();
                 	 return;  
                  }
                  else
                  {
                  	
                  }
              }
                   
	}
	
	//EXTRA CURRICULAR
	var extra_curricular = document.form1.extra_curricular.value;
	if (extra_curricular.length == 0) 
	{
	   alert("Extra Curricular can not be empty");
       document.form1.extra_curricular.value = "";
       document.form1.extra_curricular.focus();
       return;
	}
	
	//TECHNICAL CERTIFICATION
	var technical_certification = document.form1.technical_certification.value;
	if (technical_certification.length == 0) 
	{
	   alert("Technical Certification can not be empty");
       document.form1.technical_certification.value = "";
       document.form1.technical_certification.focus();
       return;
	}
	document.form1.submit();
}
</script>
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
	
<form action="OtherInformation" method="post" name="form1">
<fieldset>
<legend>Other Information</legend>
<table>

<tr><td>Hobbies:</td><td><input type="text" name="hobbies"/></td></tr>
<tr><td>Language Known:</td>	<td><input type="text" name="language_known"/></td></tr>
<tr><td>Extra Curricular:	</td><td><input type="text" name="extra_curricular"/></td></tr>
<tr><td>Technical Certification:</td><td><input type="text" name="technical_certification"/></td></tr>
<tr><td>Job Profile:</td><td><input type="text" name="job"/></td></tr>

			<tr><td><input type="button" value="Continue" onclick="valid()"/></td>
			<td><input type="reset" value="Reset"/></td></tr>	
</table>	  
</fieldset>
</form>
<!-- ======================================================================================================== -->
<div id="footer">
	<p id="legal">&copy;2015 Compaus Portal. All Rights Reserved. | Designed by ABC Software</p>
</div>
</body>
</html>