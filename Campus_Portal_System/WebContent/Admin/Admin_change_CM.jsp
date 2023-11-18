<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    import="java.sql.*" import="java.io.PrintWriter" import="java.sql.ResultSet"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function valid()
{
	var new_code=document.form1.new_code.value;
	
	if(new_code.length==0)
	{
		alert("New Center Code can't be empty");
		document.form1.new_code.value="";
		document.form1.new_code.focus();
		return;
	}
	document.form1.submit();
	
}

</script>

</head>
<body>

<fieldset>
		
<form action="http://localhost:8080/Campus_Portal_System/UpdateInstituteFlag" method="post" name="form1" id="form1">

 			<table>
 					<tr>
 					<td>  Already Exit Institute Code </td> 
 					<td><input type="text" value="<%=session.getAttribute("existing_cm")%>" name="old_code"  readonly="readonly"></td>
 					</tr>
 					
 					<tr>
 						<td>  Enter new Center code</td>
	    	  			<td><input type="text" name="new_code" id="new_code"></td>
 					</tr>
 					<tr>
 					    <td>
 					        <input type="button"  value="Change_CM" onclick="valid()" />
 					    </td>
                        					
 					</tr>
 			</table>



</form>
</fieldset>


</body>
</html>