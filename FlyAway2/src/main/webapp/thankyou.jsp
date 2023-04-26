<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ticket Confirmation Page</title>
</head>
<body>

<b> Thank you for Confirmation</b><br><br>
<b> Your Ticket has been booked</b><br><br>
<b> Ticket Details</b><br><br>
Airline Name: <%= session.getAttribute("air_name") %><br><br>
From: <%= session.getAttribute("src") %><br><br>
To :<%= session.getAttribute("destination") %><br><br>
Date Of Travel :<%= session.getAttribute("dateOfTravel") %><br><br>
Ticket Price :<%=session.getAttribute("price") %><br><br>
No. of Passengers: <%= session.getAttribute("noOfPer") %><br><br>


<% 

int noOfPersons= Integer.parseInt((String)session.getAttribute("noOfPer"));
float price= Float.valueOf((String)session.getAttribute("price"));
float amt= (noOfPersons)* (price);

%>

<b> Passenger Details</b><br><br>
Passenger Name: <%=session.getAttribute("passengerName") %><br><br>
Email-id : <%= session.getAttribute("EmailId") %><br><br>
Phone: <%= session.getAttribute("phoneNo") %><br><br>

<b>Amount Paid :<%= amt %></b>


<br><br><br><br><br><a href="index.jsp">Go to Home Page</a>




</body>
</html>