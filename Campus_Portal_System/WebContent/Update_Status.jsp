<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

		<form action="StatusRegister" method="post">
		<c:forEach items="${sessionScope.status}" var="st">	
		 <fieldset>
        <legend>Student Process Information</legend>
        <table align="left" style="width: 70%;">
            <tr>
                <td class="auto-style2"><strong>PRN NO:</strong></td>
                <td>
                    <input id="prn" type="text" name="prn" value="${st.getPrn()}"  readonly="readonly"/></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Current Round :</strong></td>
                <td>
                    <input id="rd" type="text" name="rd" value="${st.getRoundname()}" readonly="readonly" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Round Status :</strong></td>
                <td><input type="text" value="${st.getRoundstatus()}" readonly="readonly" name="cstatus"></td>
                <td class="auto-style2"><strong>Update Round Status :</strong></td>
                <td>
                		<select name="ustatus">
                		<option value="WAIT">WAIT</option>
                		<option value="PASS">PASS</option>
                		<option value="FAIL">FAIL</option>
                		</select>
                </td>
                <td></td>
                
            </tr>
            <tr>
                <td class="auto-style2"><strong>Final Result :</strong></td>
                <td><input type="text" value="${st.getFresult()}" readonly="readonly" name="fresult"></td>
            </tr>
            
			<tr>
                <td><input type="submit" value="Submit"></td>
                <td><input type="reset" value="Reset"></td>
            </tr>
			
            </table>
        </fieldset>
		</c:forEach>
		
		</form>
		 
</body>
</html>