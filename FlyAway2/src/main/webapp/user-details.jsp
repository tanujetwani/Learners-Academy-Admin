<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Passenger Personal Details</title>
</head>
<body>
<h1><b>   Personal Details Form </b></h1>

<form action=payment.jsp method="post">
Name: <input type=text name="passenger-name"><br><br>
Email-id: <input type="email"  name="email-id"><br><br>
Phone: <input type=text name="phone"><br><br>
<input type=submit value="Register">

</form>
<%
String Airline_name=request.getParameter("airline");
String ticketPrice=request.getParameter("ticket-price");

session.setAttribute("air_name", Airline_name);
session.setAttribute("price",ticketPrice);



%>
</body>
</html>