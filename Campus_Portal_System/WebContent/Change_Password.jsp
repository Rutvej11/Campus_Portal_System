<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Change Password</title>
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
			   alert("user id can not be empty");
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
			
	// OLD PASSWORD  VALIDATION
	var password = document.form1.password.value;
	if (password.length == 0) 
	{
	   alert("password can not be empty");
       document.form1.password.value = "";
       document.form1.password.focus();
       return;
	}
	else
	{
		
		 if(password.length<8 || password.length>12)
		 {
		 	alert("password length must be minimum 8 and maximum 12");
       		document.form1.password.value = "";
       		document.form1.password.focus();
      		return;
		 }
		 else
		 {
		 	  var noflag = false;
              var alpha_flag = false;
              var spflag=false;
              
              for(var i=0;i<password.length;i++)
              {
                  if (password.charCodeAt(i) >= 48 && password.charCodeAt(i) <= 57)
                  {
                      noflag = true;
                  }

                  if ((password.charCodeAt(i) >= 65 && password.charCodeAt(i) <= 90) || (password.charCodeAt(i) >= 97 && password.charCodeAt(i) <= 121))
                  {
                      alpha_flag = true;
                  }

                  if (!((password.charCodeAt(i) >= 65 && password.charCodeAt(i) <= 90) || (password.charCodeAt(i) >= 97 && password.charCodeAt(i) <= 121) || (password.charCodeAt(i) >= 49 && password.charCodeAt(i) <= 57)))
                  {
                      spflag = true;
                  }
              }
                  
              if(noflag==false)
              {
                  alert("Password must contain atleast one number");
                  document.form1.password.value = "";
                  document.form1.password.focus();
                  return;
              }
              
               if (alpha_flag == false) {
                  alert("Password must contain atleast one alphabate");
                  document.form1.password.value = "";
                  document.form1.password.focus();
                  return;
              }

              if (spflag == false) {
                  alert("Password must contain atleast one special character");
                  document.form1.password.value = "";
                  document.form1.password.focus();
                  return;
              }
              
		 }
	}
			// NEW PASSWORD  VALIDATION
	var newpwd = document.form1.newpwd.value;
	if (newpwd.length == 0) 
	{
	   alert("password can not be empty");
       document.form1.newpwd.value = "";
       document.form1.newpwd.focus();
       return;
	}
	else
	{
		
		 if(newpwd.length<8 || newpwd.length>12)
		 {
		 	alert("password length must be minimum 8 and maximum 12");
       		document.form1.newpwd.value = "";
       		document.form1.newpwd.focus();
      		return;
		 }
		 else
		 {
		 	  var noflag = false;
              var alpha_flag = false;
              var spflag=false;
              
              for(var i=0;i<newpwd.length;i++)
              {
                  if (newpwd.charCodeAt(i) >= 48 && newpwd.charCodeAt(i) <= 57)
                  {
                      noflag = true;
                  }

                  if ((newpwd.charCodeAt(i) >= 65 && newpwd.charCodeAt(i) <= 90) || (newpwd.charCodeAt(i) >= 97 && newpwd.charCodeAt(i) <= 121))
                  {
                      alpha_flag = true;
                  }

                  if (!((newpwd.charCodeAt(i) >= 65 && newpwd.charCodeAt(i) <= 90) || (newpwd.charCodeAt(i) >= 97 && newpwd.charCodeAt(i) <= 121) || (newpwd.charCodeAt(i) >= 49 && newpwd.charCodeAt(i) <= 57))) {
                      spflag = true;
                  }
              }
                  
              if(noflag==false)
              {
                  alert("Password must contain atleast one number");
                  document.form1.newpwd.value = "";
                  document.form1.newpwd.focus();
                  return;
              }
              
              if (alpha_flag == false) 
              {
                  alert("Password must contain atleast one alphabate");
                  document.form1.newpwd.value = "";
                  document.form1.newpwd.focus();
                  return;
              }

              if (spflag == false)
              {
                  alert("Password must contain atleast one special character");
                  document.form1.newpwd.value = "";
                  document.form1.newpwd.focus();
                  return;
              }
              
		 }
	}
	
	//CONFIRM PASSWORD VALIDATION

	var cnfpwd = document.form1.cnfpwd.value;
	if (cnfpwd.length == 0) 
	{
	   alert("Confirm Password can not be empty");
       document.form1.cnfpwd.value = "";
       document.form1.cnfpwd.focus();
       return;
	}
	else
	{
		if(cnfpwd != newpwd)
		{
			alert("Password must be matched");
			
       		document.form1.cnfpwd.value = "";
       		document.form1.cnfpwd.focus();
       		document.form1.cnfpwd.value = "";
       		document.form1.cnfpwd.focus();
       		return;
		}
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
 <div style="height: 242px; margin-left: 4px">
    <form action="ChangePassword" method="post" name="form1" id="form1">
        <table align="center" style="width: 38%; height: 118px;">
            <tr>
                <td class="auto-style5"><strong>User ID &nbsp;&nbsp;&nbsp; :</strong></td>
                <td class="auto-style4">
                    <input id="uid" type="text" name="uid"/></td>
            </tr>
             <tr>
				<td class="auto-style2"><strong> Old Password
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</strong></td>
				<td><input id="password" type="password" name="password" /></td>
			</tr>
            <tr>
				<td class="auto-style2"><strong> New Password
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</strong></td>
				<td><input id="newpwd" type="password" name="newpwd"/></td>
			</tr>
			
			<tr>
				<td class="auto-style2"><strong> Confirm Password
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
:</strong></td>
				<td><input id="cnfpwd" type="password" name="cnfpwd"/></td>
			</tr>
			<tr style="width: 709px;">
					<td class="auto-style2"><strong>SecurityQuestion&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
					<td class="auto-style4" style="width: 255px;"><select
						id="questionno" name="questionno">
							<option value="1">Which is your Native Place?</option>
							<option value="2">What is your Nick Name?</option>
							<option value="3">What is your Favourite Animal?</option>
							<option value="4">Who is your Ideal person?</option>
					</select></td>

				</tr>
			<tr>
					<td class="auto-style7"><strong>Answer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</strong></td>
					<td class="auto-style9"><input id="answer" type="text" name="answer" /></td>
			</tr>
				
             <tr>
             	<td> <input id="Submit1" type="button" value="submit" onclick="valid()"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
        		<td> <input id="Reset1" type="reset" value="reset" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        	</tr>	
        </table>
        <br/>
</form>
</div>
<div id="footer">
	<p id="legal">&copy;2023 Compaus Portal. All Rights Reserved. | Designed by ABC Software</p>
</div>
</body>
</html>