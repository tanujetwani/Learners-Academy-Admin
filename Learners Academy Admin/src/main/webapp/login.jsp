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
String username=request.getParameter("username");
String pwd=request.getParameter("pwd");

if(username==""|| pwd==""){
	out.write("Enter valid information<br><br>");
	out.write("<a href=" +"'"+ "index.jsp"+"'"+ ">Go to Admin login Page</a>");
}
	
else{
		
		if (username.equals("admin@learners.com") && pwd.equals("ad12")) {
			response.sendRedirect("admin-dashboard.jsp");
		}
		
		else{
			out.write("Invalid username or password<br><br>");
			out.write("<a href=" +"'"+ "index.jsp"+"'"+ ">Go to Admin login Page</a>");
			
		}
		
}//End of outer else
		%>


</body>
</html>