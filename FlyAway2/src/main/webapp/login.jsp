<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
</head>
<body>
<%  
String usrnm=request.getParameter("username");
String pwd=request.getParameter("pwd");

if(usrnm==""||pwd==""){       
	
	out.write("Enter valid information<br><br>");
	//response.sendRedirect("admin-login.jsp");
	out.write("<a href=" + "'" +"admin-login.jsp" +"'"+ ">Go to Admin login</a>");
}

else{
	
if (usrnm.equals("admin@flyaway.com") && pwd.equals("ad123")) {
	
	response.sendRedirect("admin-dashboard.jsp");
	
}


else{
	
	out.write("<b>Incorrect username or password</b><br><br>");
	out.write("<a href=" + "'" +"admin-login.jsp" +"'"+ ">Go to Admin login</a>");
}
}//End of outer else

%>

<br><br><br><a href="index.jsp">Click here to go to Home Page</a>
</body>
</html>