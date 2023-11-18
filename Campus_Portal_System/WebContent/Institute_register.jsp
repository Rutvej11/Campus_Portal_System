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
		//USER ID VALIDATION
	var uid = document.form1.uid.value;
	if (uid.length == 0) 
	{
	   alert("User ID can not be empty");
       document.form1.uid.value = "";
       document.form1.uid.focus();
       return;
	}
	else
	{
	  	 if(uid.length < 5 || uid.length > 20) 
		 {
		   alert("User ID must be of length 5 to 20");
	       document.form1.uid.value = "";
	       document.form1.uid.focus();
	       return;
		}
	}

	//PASSWORD VALIDATION
	var pwd = document.form1.password.value;
	if (pwd.length == 0) 
	{
	   alert("password can not be empty");
       document.form1.pwd.value = "";
       document.form1.pwd.focus();
       return;
	}
	else
	{
		
		 if(pwd.length<8 || pwd.length>12)
		 {
		 	alert("password length must be minimum 8 and maximum 12");
       		document.form1.pwd.value = "";
       		document.form1.pwd.focus();
      		return;
		 }
		 else
		 {
		 	  var noflag = false;
              var alpha_flag = false;
              var spflag=false;
              
              for(var i=0;i<pwd.length;i++)
              {
                  if (pwd.charCodeAt(i) >= 48 && pwd.charCodeAt(i) <= 57)
                  {
                      noflag = true;
                  }

                  if ((pwd.charCodeAt(i) >= 65 && pwd.charCodeAt(i) <= 90) || (pwd.charCodeAt(i) >= 97 && pwd.charCodeAt(i) <= 121))
                  {
                      alpha_flag = true;
                  }

                  if (!((pwd.charCodeAt(i) >= 65 && pwd.charCodeAt(i) <= 90) || (pwd.charCodeAt(i) >= 97 && pwd.charCodeAt(i) <= 121) || (pwd.charCodeAt(i) >= 49 && pwd.charCodeAt(i) <= 57))) {
                      spflag = true;
                  }
              }
                  
              if(noflag==false)
              {
                  alert("Password must contain atleast one number");
                  document.form1.pwd.value = "";
                  document.form1.pwd.focus();
                  return;
              }
              
               if (alpha_flag == false) {
                  alert("Password must contain atleast one alphabate");
                  document.f1.pwd.value = "";
                  document.f1.pwd.focus();
                  return;
              }

              if (spflag == false) {
                  alert("Password must contain atleast one special character");
                  document.f1.pwd.value = "";
                  document.f1.pwd.focus();
                  return;
              }
              
		 }
	}
	
	//CONFIRM PASSWORD VALIDATION

	var pwd2 = document.form1.password2.value;
	if (pwd2.length == 0) 
	{
	   alert("Confirm Password can not be empty");
       document.form1.password2.value = "";
       document.form1.password2.focus();
       return;
	}
	else
	{
		if(pwd2 != pwd)
		{
			alert("Password must be matched");
			
       		document.form1.password.value = "";
       		document.form1.password.focus();
       		document.form1.password2.value = "";
       		document.form1.password2.focus();
       		return;
		}
	}

	// INSTITUTE NAME VALIDATION
	var iname = document.form1.iname.value;
	if (iname.length == 0) 
	{
	   alert("Institute Name can not be empty");
       document.form1.iname.value = "";
       document.form1.iname.focus();
       return;
	}
	else
	{
		var noflag = false;
		
			  for(var i=0;i<iname.length;i++)
              {
                  if (iname.charCodeAt(i) >= 48 && iname.charCodeAt(i) <= 57)
                  {
                      noflag = true;
                  }
              }
              
              if(noflag==true)
              {
                  alert("Institute Name can't contain numbers");
                  document.form1.pwd.value = "";
                  document.form1.pwd.focus();
                  return;
              }
	}

	// INSTITUTE CODE VALIDATION
	var icode = document.form1.icode.value;
	if (icode.length == 0) 
	{
	   alert("Institute Code can not be empty");
       document.form1.icode.value = "";
       document.form1.icode.focus();
       return;
	}
	else
	{
			  for(var i=0;i<icode.length;i++)
              {
                  if (icode.charCodeAt(i) >= 48 && icode.charCodeAt(i) <= 57)
                  {
                     
                  }
                  else
                  {
                  	alert("Institute Code contain only numbers");
                  	document.form1.icode.value = "";
                  	document.form1.icode.focus();
                 	 return;
                  }
              }
                   
	}
	
	//STREET VALIDATION
	var street = document.form1.street.value;
	if (street.length == 0) 
	{
	   alert("Street field can not be blank");
       document.form1.street.value = "";
       document.form1.street.focus();
       return;
	}
	
	//AREA VALIDATION
	var area = document.form1.area.value;
	if (area.length == 0) 
	{
	   alert("Area field can not be blank");
       document.form1.area.value = "";
       document.form1.area.focus();
       return;
	}
	
	//PINCODE VALIDATION
	var pincode = document.form1.pincode.value;
	if (pincode.length == 0) 
	{
	   alert("Pincode field can not be blank");
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

	//EMAIL VALIDATION
	var email = document.form1.email.value;
	if (email.length == 0) 
	{
	   alert("Email field can not be blank");
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
	
	//FNAME AND LNAME VALIDATION
	var fname = document.form1.fname.value;
	var lname = document.form1.lname.value;
	if (fname.length == 0) 
	{
	   alert("First Name field can not be blank");
       document.form1.fname.value = "";
       document.form1.fname.focus();
       return;
	}
	else
	{
		
			  for(var i=0;i<fname.length;i++)
              {
                  if ((fname.charCodeAt(i) >= 65 && fname.charCodeAt(i) <= 90) || (fname.charCodeAt(i) >= 97 && fname.charCodeAt(i) <= 121))
                  {  
                  }
                  else
                  {
                  	alert("Institute Code contain only alphabates");
                  	document.form1.fname.value = "";
                  	document.form1.fname.focus();
                 	 return;
                  }
              }
	}
	
	
	if (lname.length == 0) 
	{
	   alert("Last Name field can not be blank");
       document.form1.lname.value = "";
       document.form1.lname.focus();
       return;
	}
	else
	{
		
			  for(var i=0;i<lname.length;i++)
              {
                  if ((lname.charCodeAt(i) >= 65 && lname.charCodeAt(i) <= 90) || (lname.charCodeAt(i) >= 97 && lname.charCodeAt(i) <= 121))
                  {  
                  }
                  else
                  {
                  	alert("Last Name contain only alphabates");
                  	document.form1.lname.value = "";
                  	document.form1.lname.focus();
                 	 return;
                  }
              }
	}
	
	
	//CONTACT NUMBER
	var cnum = document.form1.cnum.value;
	if (cnum.length == 0) 
	{
	   alert("Contact Number field can not be blank");
       document.form1.cnum.value = "";
       document.form1.cnum.focus();
       return;
	}
	else
	{
		if (cnum.length<10) 
		{
		   alert("Contact Number field can not be less than 10 numbers");
	       document.form1.cnum.value = "";
	       document.form1.cnum.focus();
	       return;
		}
		else
		{
			for(var i=0;i<cnum.length;i++)
              {
                  if (cnum.charCodeAt(i) >= 48 && cnum.charCodeAt(i) <= 57)
                  {
                     
                  }
                  else
                  {
                  	alert("Contact Numbers contain only numbers");
                  	document.form1.cnum.value = "";
                  	document.form1.cnum.focus();
                 	 return;
                  }
              }
		}
		
	}
	
	//ANSWER VALIDATION
	var answer = document.form1.answer.value;
	if (answer.length == 0) 
	{
	   alert("Answer field can not be blank");
       document.form1.answer.value = "";
       document.form1.answer.focus();
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
       
    <h4>Institute  Registration </h4>
    <div style="height: 352px; margin-left: 4px">
        <br/>
        <form action="InstituteRegister" method="get" name="form1">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<table align="center" style="width: 70%;">
				<tr>
					<td class="auto-style2"><strong>User ID
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							:</strong></td>
					<td><input id="uid" type="text" name="uid" /></td>
				</tr>

				<tr>
					<td class="auto-style2"><strong> Password
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</strong></td>
					<td><input id="password" type="password" name="password" /></td>
				</tr>

				<tr>
					<td class="auto-style2"><strong> Confirm Password
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</strong></td>
					<td><input id="password2" type="password" /></td>
				</tr>

				<tr>
					<td class="auto-style7"><strong>User
							Type&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</strong></td>
					<td class="auto-style9"><select id="ut" name="usertype">
							<option value="2">Institute</option>
					</select></td>
				</tr>

				<tr>
					<td class="auto-style2"><strong>Institute
							Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							:</strong></td>
					<td><input id="iname" type="text" name="iname" /></td>
				</tr>
				<tr>
					<td class="auto-style2"><strong>Institute
							Code&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							:</strong></td>
					<td><input id="icode" type="text" name="icode" /></td>
				</tr>
				<tr>
					<td class="auto-style2"><strong>Institute
							Address&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							:</strong></td>
				</tr>
				<tr>
					<td class="auto-style2"><strong>Street&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							:</strong></td>
					<td><input id="street" type="text" name="street" /></td>
				</tr>
				<tr>
					<td class="auto-style2"><strong>Area&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							:</strong></td>
					<td><input id="area" type="text" name="area" /></td>
				</tr>
				<tr>
					<td class="auto-style2"><strong>Pincode&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							:</strong></td>
					<td><input id="pincode" type="text" name="pincode" /></td>
				</tr>
				<tr>
					<td class="auto-style2"><strong>State&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							:</strong></td>
					<td><select id="state" name="state">
							<option value="Maharashtra">Maharashtra</option>
							<option value="Karnataka">Karnataka</option>
							<option value="Delhi">Delhi</option>
					</select></td>
				</tr>
				<tr>
					<td class="auto-style2"><strong>City&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;:</strong></td>
					<td><select id="city" name="city">
							<option value="Pune">Pune</option>
							<option value="Mumbai">Mumbai</option>
							<option value="Kolhapur">Kolhapur</option>
							<option value="Banglore">Banglore</option>
							<option value="Noida">Noida</option>
							<option value="New Delhi">New Delhi</option>
					</select></td>
				</tr>
				<tr>
					<td class="auto-style2"><strong>Institute
							Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							:</strong></td>
					<td><input id="email" type="text" name="email" /></td>
				</tr>
				<tr>
					<td><strong>Institute Coordinator First Name :</strong></td>
					<td><input id="fname" type="text" name="fname" /></td>
				</tr>
				<tr>
					<td><strong>Institute Coordinator Last Name :</strong></td>
					<td><input id="lname" type="text" name="lname" /></td>
				</tr>
				<tr>
					<td><strong>Contact Number :</strong></td>
					<td><input id="cnum" type="text" name="cnum" /></td>
				</tr>
				<tr>
					<td class="auto-style2"><strong>Security
							Question&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</strong></td>
					<td class="auto-style4" style="width: 255px;"><select id="qn"
						name="questionno">
							<option value="1">Which is your Native Place?</option>
							<option value="2">What is your Nick Name?</option>
							<option value="3">What is your Favourite Animal?</option>
							<option value="4">Who is your Ideal person?</option>
					</select></td>

				</tr>
				<tr>
					<td class="auto-style2"><strong>Answer
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							:</strong></td>
					<td><input id="answer" type="text" name="answer" /></td>
				</tr>
				<tr>
					<td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input id="Button1" type="button" onclick="valid()" value="Submit"
						style="width: 87px;" />
					</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
						id="Button2" type="reset" value="Reset" /></td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>