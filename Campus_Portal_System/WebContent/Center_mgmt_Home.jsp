<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Center Management</title>
</head>
<body>
	  
    <div style="height: 448px">
    
    
    <h1>Campus Portal System</h1>
    
    	
    	<h3>Welcome <%=session.getAttribute("Iname")%></h3>
        <iframe height="448px" width="250" src="frame2_cm.jsp" name="frame1">
        </iframe>
        <iframe height="448px" name="frame2" width="570">
        </iframe>

    </div>
</body>
</html>