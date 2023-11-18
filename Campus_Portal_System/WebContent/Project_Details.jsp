<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Project Details</title>
<script type="text/javascript">
function valid()
{
	//PROJECT TITLE
	var project_title = document.form1.project_title.value;
	if (project_title.length == 0) 
	{
	   alert("Project Title can not be empty");
       document.form1.project_title.value = "";
       document.form1.project_title.focus();
       return;
	}
	
	//PROJECT DURATION
	var project_duration = document.form1.project_duration.value;
	if (project_duration.length == 0) 
	{
	   alert("Project duration can not be empty");
       document.form1.project_duration.value = "";
       document.form1.project_duration.focus();
       return;
	}
	
	//PROJECT PLATFORM
	var project_platform = document.form1.project_platform.value;
	if (project_platform.length == 0) 
	{
	   alert("Project Platform can not be empty");
       document.form1.project_platform.value = "";
       document.form1.project_platform.focus();
       return;
	}
	
	//PROJECT DESCRIPTION
	var project_description = document.form1.project_description.value;
	if (project_description.length == 0) 
	{
	   alert("Project Description can not be empty");
       document.form1.project_description.value = "";
       document.form1.project_description.focus();
       return;
	}
	
	document.form1.submit();
}
</script>

</head>
<body>
<form action="ProjectDetails" method="post" name="form1">
<fieldset>
<legend>Project Details</legend>
<table>
<tr>
<td>	Qualification:</td><td><select name="qualifiacation">
				<option value="B.E.">B.E</option>
				<option value="M.E.">M.E</option>
			  </select>
			 </td>
</tr>
<tr><td>Project Title:</td><td><input type="text" name="project_title"/></td></tr>
<tr><td>Duration:</td>	<td><input type="text" name="project_duration"/></td></tr>
<tr><td>Platform:	</td><td><input type="text" name="project_platform"/></td></tr>
<tr><td>Description:</td><td> <textarea rows="5"  cols="30" name="project_description"></textarea> </td></tr>
			<tr><td><input type="button" value="Continue" onclick="valid()"/></td>
			<td><input type="reset" value="Reset"/></td></tr>	
</table>	  
</fieldset>
</form>
</body>
</html>