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
	//COMPANY NAME
	var company_name = document.form1.company_name.value;
	if (company_name.length == 0) 
	{
	   alert("Company Name can not be empty");
       document.form1.company_name.value = "";
       document.form1.company_name.focus();
       return;
	}
	else
	{
			  for(var i=0;i<company_name.length;i++)
              {
                  if (company_name.charCodeAt(i) >= 48 && company_name.charCodeAt(i) <= 57)
                  {
                   alert("Company name not contain  numbers");
                  	document.form1.company_name.value = "";
                  	document.form1.company_name.focus();
                 	 return;  
                  }
                  else
                  {
                  	
                  }
              }
                   
	}
	//COMPANY ID
	var company_id = document.form1.company_id.value;
	if (company_id.length == 0) 
	{
	   alert("Company Id can not be empty");
       document.form1.company_id.value = "";
       document.form1.company_id.focus();
       return;
	}
	else
	{
			  for(var i=0;i<company_id.length;i++)
              {
                  if (company_id.charCodeAt(i) >= 48 && company_id.charCodeAt(i) <= 57)
                  {
                     
                  }
                  else
                  {
                  	alert("CompanyID contain only numbers");
                  	document.form1.company_id.value = "";
                  	document.form1.company_id.focus();
                 	 return;
                  }
              }
                   
	}
	
	
	
	//COMPANY DOMAIN
	var company_domain = document.form1.company_domain.value;
	if (company_domain.length == 0) 
	{
	   alert("Company Domain can not be empty");
       document.form1.company_domain.value = "";
       document.form1.company_domain.focus();
       return;
	}
	else
	{
			  for(var i=0;i<company_domain.length;i++)
              {
                  if (company_domain.charCodeAt(i) >= 48 && company_domain.charCodeAt(i) <= 57)
                  {
                   alert("Company Domain does not contain numbers");
                  	document.form1.company_domain.value = "";
                  	document.form1.company_domain.focus();
                 	 return;  
                  }
                  else
                  {
                  	
                  }
              }
                   
	}
	
	
	//STREET
	var street = document.form1.street.value;
	if (street.length == 0) 
	{
	   alert("Street can not be empty");
       document.form1.street.value = "";
       document.form1.street.focus();
       return;
	}
	
	//AREA
	var area = document.form1.area.value;
	if (area.length == 0) 
	{
	   alert("Area can not be empty");
       document.form1.area.value = "";
       document.form1.area.focus();
       return;
	}
	
	//PINCODE
	var pincode = document.form1.pincode.value;
	if (pincode.length == 0) 
	{
	   alert("Pincode can not be empty");
       document.form1.pincode.value = "";
       document.form1.pincode.focus();
       return;
	}
	else
	{
			  for(var i=0;i<pincode.length;i++)
              {
                  if (pincode.charCodeAt(i) >= 48 && pincode.charCodeAt(i) <= 57)
                  {
                     
                  }
                  else
                  {
                  	alert("Pincode contain only numbers");
                  	document.form1.pincode.value = "";
                  	document.form1.pincode.focus();
                 	 return;
                  }
              }
                   
	}
	
	
	//CITY
	var city = document.form1.city.value;
	if (city.length == 0) 
	{
	   alert("City can not be empty");
       document.form1.city.value = "";
       document.form1.city.focus();
       return;
	}
	else
	{
			  for(var i=0;i<city.length;i++)
              {
                  if (city.charCodeAt(i) >= 48 && city.charCodeAt(i) <= 57)
                  {
                   alert("City does not contain numbers");
                  	document.form1.city.value = "";
                  	document.form1.city.focus();
                 	 return;  
                  }
                  else
                  {
                  	
                  }
              }
                   
	}
	
	
	//STATE
	var state = document.form1.state.value;
	if (state.length == 0) 
	{
	   alert("State can not be empty");
       document.form1.state.value = "";
       document.form1.state.focus();
       return;
	}
	else
	{
			  for(var i=0;i<state.length;i++)
              {
                  if (state.charCodeAt(i) >= 48 && state.charCodeAt(i) <= 57)
                  {
                   alert("State does not contain numbers");
                  	document.form1.state.value = "";
                  	document.form1.state.focus();
                 	 return;  
                  }
                  else
                  {
                  	
                  }
              }
                   
	}
	
	// EMAIL VALIDATION
	var emailid = document.form1.email.value;
	if (emailid.length == 0) 
	{
	   alert("Email ID can not be empty");
       document.form1.email.value = "";
       document.form1.email.focus();
       return;
	}
	else
	{
		if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(form1.email.value))  
  		{  
    
 		} 
 		else
  		{ 
  		 	  alert("You have entered an invalid email address!");
  		 	  document.form1.email.value = "";
       	      document.form1.email.focus(); 
   			  return (false)
		}
	}
	
	
	//COMPANY DESCRIPTION
	var company_description = document.form1.company_description.value;
	if (company_description.length == 0) 
	{
	   alert("Company Description can not be empty");
       document.form1.company_description.value = "";
       document.form1.company_description.focus();
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
<form action="CompanyRegister" method="post" name="form1">
<fieldset>
<legend>Company Information</legend>
<table>

<tr><td>Company Name:</td><td><input type="text" name="company_name"/></td></tr>
<tr><td>Company ID:</td><td><input type="text" name="company_id"/></td></tr>
<tr><td>Company Domain:</td><td><input type="text" name="company_domain"/></td></tr>
<tr><td>Company Address:</td>
<td></td>
</tr>
<tr><td>Street:</td><td><input type="text" name="street"/></td></tr>
<tr><td>Area:</td><td><input type="text" name="area"/></td></tr>
<tr><td>Pincode:</td><td><input type="text" name="pincode"/></td></tr>
<tr><td>City:</td><td><input type="text" name="city"/></td></tr>
<tr><td>State:</td><td><input type="text" name="state"/></td></tr>
<tr><td>Company Email:</td><td><input type="text" name="email"/></td></tr>
<tr><td>Company Description:</td><td><textarea rows="5" name="company_description" ></textarea></td></tr>

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