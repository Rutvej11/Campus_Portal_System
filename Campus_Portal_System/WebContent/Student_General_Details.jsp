<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Campus Portal System</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" />

<title></title>
    <style type="text/css">


        .auto-style1 {
            color: #3399FF;
        }
        .auto-style2 {
            width: 220px;
        }
        #Text2 {
            width: 130px;
        }
        #Button1 {
            width: 113px;
        }
 </style>
    
<script type="text/javascript">
function valid()
{
	//PRNNO
	var prnno = document.form1.prnno.value;
	if (prnno.length == 0) 
	{
	   alert("Prn Number can not be empty");
       document.form1.prnno.value = "";
       document.form1.prnno.focus();
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
                  	alert("prnno contain only numbers");
                  	document.form1.prnno.value = "";
                  	document.form1.prnno.focus();
                 	 return;
                  }
              }
                   
	}
	
	//	MOBILE NUMBER
	var mobno = document.form1.mobno.value;
	if (mobno.length == 0) 
	{
	   alert("Mobile Number can not be empty");
       document.form1.mobno.value = "";
       document.form1.mobno.focus();
       return;
	}
	else
	{
			  for(var i=0;i<mobno.length;i++)
              {
                  if (mobno.charCodeAt(i) >= 48 && mobno.charCodeAt(i) <= 57)
                  {
        
                  }
                  else
                  {
                  	alert("mobno contain only numbers");
                  	document.form1.mobno.value = "";
                  	document.form1.mobno.focus();
                 	 return;
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
	   alert("Street can not be empty");
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
	
	//CITYS
	var city = document.form1.city.value;
	if (city.length == 0) 
	{
	   alert("city can not be empty");
       document.form1.city.value = "";
       document.form1.city.focus();
       return;
	}
	else
	{
		for(var i=0;i<city.length;i++)
        {
            if ((city.charCodeAt(i) >= 65 && city.charCodeAt(i) <= 90) || (city.charCodeAt(i) >= 97 && city.charCodeAt(i) <= 121))
            {  
            }
            else
            {
            	alert("City contain only alphabates");
            	document.form1.city.value = "";
            	document.form1.city.focus();
           	 return;
            }
        }
	}
	
	//STATE
	var state = document.form1.state.value;
	if (state.length == 0) 
	{
	   alert("state can not be empty");
       document.form1.state.value = "";
       document.form1.state.focus();
       return;
	}
	else
		{
			for(var i=0;i<state.length;i++)
	        {
	            if ((state.charCodeAt(i) >= 65 && state.charCodeAt(i) <= 90) || (state.charCodeAt(i) >= 97 && state.charCodeAt(i) <= 121))
	            {  
	            }
	            else
	            {
	            	alert("State contain only alphabates");
	            	document.form1.state.value = "";
	            	document.form1.state.focus();
	           	 return;
	            }
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
<div id="page">
<!-- 	start content -->
	<div id="content">
	</div>
</div>
<!-- end page -->
<!-- ======================================================================================================== -->
    
<form action="GeneralDetails" method="post" name="form1" id="form1">

        <h3>General Information</h3>
    <div style="height: 342px; margin-left: 4px; width: 761px;">
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<table align="center" style="width: 70%;">
            <tr>
                <td class="auto-style2"><strong>PRN No:</strong></td>
                <td>
                    <input id="prnno" type="text" name="prnno" /></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Date Of Birth:</strong></td>                	
            </tr>    
            <tr> 
            	<td></td>
            	<td><input type="date" name="dob" /></td>   
            </tr>
            <tr>
                <td class="auto-style2"><strong>Mobile Number:</strong></td>
                <td>
                    <input id="mobno" type="text" name="mobno" /></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Student Adress:</strong></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Street:</strong></td>
                <td>
                   <input type="text" name="street" id="street"> 
                </input></td>
                </td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Area:</strong></td>
                <td>
                    <input id="area" type="text" name="area" /></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Pincode:</strong></td>
                <td>
                    <input id="pincode" type="text" name="pincode" /></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>City:</strong></td>
                <td>
                    <input id="city" type="text" name="city" /></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>State:</strong></td>
                <td>
                    <input id="state" type="text" name="state"/></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <input id="Button1" type="button" value="Continue" onclick="valid()" /></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>

    <p>
&nbsp;</p>
        
</form>
<!-- ======================================================================================================== -->
<div id="footer">
	<p id="legal">&copy;2015 Compaus Portal. All Rights Reserved. | Designed by ABC Software</p>
</div>
</body>
</html>