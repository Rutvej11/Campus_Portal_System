<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function valid()
{
	//COMPANY ID VALIDATION
	var cid = document.form2.cid.value;
	if (cid.length == 0) 
	{
	   alert("Company ID can not be empty");
       document.form2.cid.value = "";
       document.form2.cid.focus();
       return;
	}
	else
	{
		for(var i=0;i<cid.length;i++)
        {
            if (cid.charCodeAt(i) >= 48 && cid.charCodeAt(i) <= 57)
            {
            }
            else
            {
            	alert("Company ID contain only numbers");
            	document.form2.cid.value = "";
            	document.form2.cid.focus();
           	 return;
            }
        }
	}
	
	//JOB PROFILE VALIDATION
	var job = document.form2.job.value;
	if (job.length == 0) 
	{
	   alert("Job Profile can not be empty");
       document.form2.job.value = "";
       document.form2.job.focus();
       return;
	}
	
	//SALARY VALIDATION
	var salary = document.form2.salary.value;
	if (salary.length == 0) 
	{
	   alert("Salary can not be empty");
       document.form2.salary.value = "";
       document.form2.salary.focus();
       return;
	}
	else
	{
		for(var i=0;i<salary.length;i++)
        {
            if (salary.charCodeAt(i) >= 48 && salary.charCodeAt(i) <= 57)
            {
            }
            else
            {
            	alert("Salary Field contain only numbers");
            	document.form2.salary.value = "";
            	document.form2.salary.focus();
           	 return;
            }
        }
	}
	
	
	//10th FIELD VALIDATION
	var tenth = document.form2.tenth.value;
	if (tenth.length == 0) 
	{
	   alert("10th Field can not be empty");
       document.form2.tenth.value = "";
       document.form2.tenth.focus();
       return;
	}
	
	//12th FIELD VALIDATION
	var twelth = document.form2.twelth.value;
	if (twelth.length == 0) 
	{
	   alert("12th field can not be empty");
       document.form2.twelth.value = "";
       document.form2.twelth.focus();
       return;
	}
	
	//DEGREE FIELD VALIDATION
	var degree = document.form2.degree.value;
	if (degree.length == 0) 
	{
	   alert("12th field can not be empty");
       document.form2.degree.value = "";
       document.form2.degree.focus();
       return;
	}
	
	//VENUE FIELD VALIDATION
	var venue = document.form2.venue.value;
	if (venue.length == 0) 
	{
	   alert("Venue field can not be empty");
       document.form2.venue.value = "";
       document.form2.venue.focus();
       return;
	}
	
	//VENUE FIELD VALIDATION
	var idate = document.form2.idate.value;
	if (idate.length == 0) 
	{
	   alert("Venue field can not be empty");
       document.form2.idate.value = "";
       document.form2.idate.focus();
       return;
	}
	
	//TIME FIELD VALIDATION
	var itime = document.form2.itime.value;
	if (itime.length == 0) 
	{
	   alert("Time field can not be empty");
       document.form2.itime.value = "";
       document.form2.itime.focus();
       return;
	}
	
	document.form2.submit();
}
</script>
</head>

<body>

		<form action="CompanyRequirement" method="post" name="form2" id="form2">
   		<h1>Campus Portal System</h1>
        <h3>Company Requirement</h3>
    <div style="height: 342px; margin-left: 4px; width: 761px;">
        <br />
        <fieldset>
        <legend>General Company Information</legend>
        <table align="left" style="width: 70%;">
            <tr>
                <td class="auto-style2"><strong>Company ID:</strong></td>
                <td>
                    <input id="cid" type="text" name="cid" value="${Cid}" /></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Enter Job Profile :</strong></td>
                <td>
                    <input id="job" type="text" name="job" /></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Salary offered :</strong></td>
                <td><input type="text" name="salary"></td>
            </tr>
            </table>
        </fieldset>
            <fieldset>
            <legend>Criteria Required for Shorlisting Students</legend>
            <table>
		            <tr>
		                <td class="auto-style2"><strong>10th Percentage:</strong></td>
		                <td>
		                   <input type="text" name="tenth" id="tenth"> 
		                <td>&nbsp;</td>
		            </tr>
		            
		            <tr>
		                <td class="auto-style2"><strong>12th Percentage:</strong></td>
		                <td>
		                   <input type="text" name="twelth" id="twelth"> 
		                <td>&nbsp;</td>
		            </tr>
		            
		            <tr>
		                <td class="auto-style2"><strong>Graduation Percentage:</strong></td>
		                <td>
		                   <input type="text" name="degree" id="degree"> 
		                <td>&nbsp;</td>
		            </tr>
		            
            </table>
        	</fieldset>
        	
        	<fieldset>
            <legend>Process Information</legend>
            <table>
		            <tr>
		                <td class="auto-style2"><strong>Total Rounds:</strong></td>
		                <td>
		                   <input type="text" name="rounds" id="rounds" value="4" readonly="readonly"> 
		                <td>&nbsp;</td>
		            </tr>
		            
		            <tr>
		                <td class="auto-style2"><strong>Round Information:</strong></td>
		                <td>
		                   <input type="text" name="apti" id="apti" value="Aptitutde" readonly="readonly"> 
		                </td>
		                <td>
		                   <input type="text" name="gd" id="gd" value="Group Discussion" readonly="readonly"> 
		                </td>
		                <td>
		                   <input type="text" name="ti" id="ti" value="Technical Interview" readonly="readonly"> 
		                </td>
		                <td>
		                   <input type="text" name="hr" id="hr" value="HR" readonly="readonly"> 
		                </td>
		            </tr>
            </table>
        	</fieldset>
        	
        	
        	<fieldset>
            <legend>Other Information</legend>
            <table>
		            <tr>
		                <td class="auto-style2"><strong>Venue Inforamtion:</strong></td>
		                <td>
		                   <input type="text" name="venue" id="venue"> 
		                <td>&nbsp;</td>
		            </tr>
		            
		            <tr>
		                <td class="auto-style2"><strong>Date:</strong></td>
		                <td>
		                   <input type="date" name="idate" id="idate"> 
		                </td>
		            </tr>

		            <tr>
		                <td class="auto-style2"><strong>Time :</strong></td>
		                <td>
		                   <input type="text" name="itime" id="itime"> 
		                </td>
		                <td>
		                   <select name="tm">
		                   <option value="AM">AM</option>
		                   <option value="PM">PM</option>
		                   </select> 
		                </td>
		                
		            </tr>
		            
		            <tr> 
		                <td class="auto-style2">
		                    <input id="Button1" type="button" value="submit" onclick="valid()" /></td>
		                <td class="auto-style9"><input id="Reset1" type="reset"
						value="Reset" /></td>
		            </tr>
            </table>
        	</fieldset>
        	
        	
        	
        	
    </div>
    </form>
		


</body>
</html>