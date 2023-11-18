<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Insert title here</title>

<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">

function valid()
{
	//USER ID VALIDATION
	var uid = document.form2.userid.value;
	if (uid.length == 0) 
	{
	   alert("user id can not be empty");
       document.form2.userid.value = "";
       document.form2.userid.focus();
       return;
	}
	else
	{
		  if(uid.length < 5 || uid.length > 20) 
	 	{
		   alert("User ID must be of length 5 to 20");
	       document.form2.userid.value = "";
	       document.form2.userid.focus();
	       return;
		}
	}
	
	//PASSWORD VALIDATION
	var pwd = document.form2.password.value;
	if (pwd.length == 0) 
	{
	   alert("Password can not be empty");
       document.form2.password.value = "";
       document.form2.password.focus();
       return;
	}
	else
	{
		
		 if(pwd.length<8 || pwd.length>12)
		 {
		 	alert("password length must be minimum 8 and maximum 12");
       		document.form2.password.value = "";
       		document.form2.password.focus();
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
                  document.form2.password.value = "";
                  document.form2.password.focus();
                  return;
              }
              
               if (alpha_flag == false)
                {
                  alert("Password must contain atleast one alphabate");
                  document.form2.password.value = "";
                  document.form2.password.focus();
                  return;
                }

              if (spflag == false) 
              {
                  alert("Password must contain atleast one special character");
                  document.form2.password.value = "";
                  document.form2.password.focus();
                  return;
              }
              
		 }
	
	}
	
	//CONFIRM PASSWORD VALIDATION
	var pwd2 = document.form2.password2.value;
	if (pwd2.length == 0) 
	{
	   alert("Confirm Password can not be empty");
       document.form2.password2.value = "";
       document.form2.password2.focus();
       return;
	}
	else
	{
		if(pwd2 != pwd)
		{
			alert("Password must be matched");
			
       		document.form2.password.value = "";
       		document.form2.password.focus();
       		document.form2.password2.value = "";
       		document.form2.password2.focus();
       		return;
		}
	}
	
	
	
	//NAME VALIDATION
	var fname = document.form2.fname.value;
	if (fname.length == 0) 
	{
	   alert("First name can not be empty");
       document.form2.fname.value = "";
       document.form2.fname.focus();
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
                  	alert("First Name contain only alphabates");
                  	document.form2.fname.value = "";
                  	document.form2.fname.focus();
                 	 return;
                  }
              }
	}
	
	var mname = document.form2.mname.value;
	if (mname.length == 0) 
	{
	   alert("Middle name can not be empty");
       document.form2.mname.value = "";
       document.form2.mname.focus();
       return;
	}
	else
	{
			  for(var i=0;i<mname.length;i++)
              {
                  if ((mname.charCodeAt(i) >= 65 && mname.charCodeAt(i) <= 90) || (mname.charCodeAt(i) >= 97 && mname.charCodeAt(i) <= 121))
                  {  
                  }
                  else
                  {
                  	alert("Middle Name contain only alphabates");
                  	document.form2.mname.value = "";
                  	document.form2.mname.focus();
                 	 return;
                  }
              }
	}
	
	var lname = document.form2.lname.value;
	if (lname.length == 0) 
	{
	   alert("Last name can not be empty");
       document.form2.lname.value = "";
       document.form2.lname.focus();
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
                  	document.form2.lname.value = "";
                  	document.form2.lname.focus();
                 	 return;
                  }
              }
	}
	
	
	
	// PRN NUMBER VALIDATION
	var prnno = document.form2.prnno.value;
	if (prnno.length == 0) 
	{
	   alert("PRN Number can not be empty");
       document.form2.prnno.value = "";
       document.form2.prnno.focus();
       return;
	}
	else
	{
			  for(var i=0;i<prnno.length;i++)
              {
                  if (prnno.charCodeAt(i) >= 48 && prnno.charCodeAt(i) <= 57)
                  {
                  }
                  else
                  {
                  	alert("PRN Number contain only numbers");
                  	document.form2.prnno.value = "";
                  	document.form2.prnno.focus();
                 	 return;
                  }
              }
                   
	}
	
	// EMAIL VALIDATION
	var emailid = document.form2.emailid.value;
	if (emailid.length == 0) 
	{
	   alert("Email ID can not be empty");
       document.form2.emailid.value = "";
       document.form2.emailid.focus();
       return;
	}
	else
	{
		if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(form2.emailid.value))  
  		{  
    
 		} 
 		else
  		{ 
  		 	  alert("You have entered an invalid email address!");
  		 	  document.form2.emailid.value = "";
       	      document.form2.emailid.focus(); 
   			  return (false)
		}
	}
	
	//ANSWER VALIDATION
	var answer = document.form2.answer.value;
	if (answer.length == 0) 
	{
	   alert("Answer can not be empty");
       document.form2.answer.value = "";
       document.form2.answer.focus();
       return;
	}
	
	document.form2.submit();
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
        <h3>Student Register</h3>
    <div style="height: 339px; margin-left: 4px">
        <form action="StudentRegister" method="post" name="form2">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <table align="center" style="width: 75%; height: 232px;">
				<tr>
					<td class="auto-style7"><strong>User
							ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							:</strong></td>
					<td class="auto-style9"><input id="userid" type="text" name="uid" /></td>
				</tr>
				<tr>
					<td class="auto-style7"><strong>Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							:</strong></td>
					<td class="auto-style9" style="width: 229px; "><input id="password" type="password" name="password" /></td>
				</tr>
				<tr>
					<td class="auto-style2"><strong> Confirm 
							&nbsp;&nbsp;&nbsp;Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</strong></td>
					<td><input id="password2" type="password" /></td>
				</tr>
				<tr style="width: 564px;">
					<td class="auto-style7"><strong>Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							:</strong></td>
					<td class="auto-style9"><strong>First Name </strong></td>
					<td class="auto-style10"><strong>Middle Name&nbsp;</strong></td>
					<td><strong>Last Name&nbsp;</strong></td>
				</tr>
				<tr>
					<td class="auto-style7">&nbsp;</td>
					<td class="auto-style9" style="width: 169px;"><input
						id="fname" type="text" style="width: 121px;"  name="fname"/></td>
					<td class="auto-style10"><input id="mname" type="text"
						style="width: 117px;" name="mname"/></td>
					<td><input id="lname" type="text" style="width: 100px;" name="lname"  /></td>
				</tr>
				<tr>
					<td class="auto-style7"><strong>Date of Birth
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							:</strong></td>
					<td class="auto-style9"><input id="dob" type="date" name="dob"/></td>
				</tr>
				<tr>
					<td class="auto-style7"><strong>PRN
							NO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							:</strong></td>
					<td class="auto-style9"><input id="prnno" type="text" name="prnno"/></td>
				</tr>
				<tr>
					<td class="auto-style7"><strong>Institute Name&nbsp;
							:</strong></td>
					<td class="auto-style9"><select id="iname" name="iname">
							<c:forEach items="${sessionScope.Iname}" var="item">

								<option value="<c:out value='${item}' />">
									<c:out value="${item}" />
								</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td class="auto-style7"><strong>Institute
							Code&nbsp;&nbsp;&nbsp;:</strong></td>
					<td class="auto-style9"><select id="icode" name="icode">
							<c:forEach items="${sessionScope.Icode}" var="item">

								<option value="<c:out value='${item}' />">
									<c:out value="${item}" />
								</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td class="auto-style7"><strong>Email
							Id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</strong></td>
					<td class="auto-style9"><input id="emailid" type="text" name="email" /></td>
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
					<td class="auto-style7"><input id="Button1" type="button"
						value="Submit" onclick="valid()" /></td>
					<td class="auto-style9"><input id="Reset1" type="reset"
						value="Reset" /></td>
				</tr>
			</table>
		</form>
    </div>
<div id="footer">
	<p id="legal">&copy;2015 Compaus Portal. All Rights Reserved. | Designed by ABC Software</p>
</div>
</body>
</html>