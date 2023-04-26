<%@ page import="java.util.Properties" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Page</title>
</head>
<body>

<%
String passName=request.getParameter("passenger-name");
String emailId= request.getParameter("email-id");
String phone=request.getParameter("phone");


//if(session.getAttribute("user_name")==null){
	
  //      response.sendRedirect("user-details.jsp");	
	

if (passName==""|| emailId==""||phone==""){
	out.println("<b>Enter valid information .Press Back key to go to Personal Details Form.</b>");
	//out.println("<a href="+ "'"+ "user-details.jsp" +"'>Go to Personal Details Form</a>");
	//out.println("</html>");

}
else{
	session.setAttribute("passengerName",passName);
	session.setAttribute("EmailId",emailId);
	session.setAttribute("phoneNo",phone);
	
	float price1;

	int noOfPersons= Integer.parseInt((String)session.getAttribute("noOfPer"));
	//System.out.println(session.getAttribute("price"));
	//System.out.println(session.getAttribute("air_name"));
	price1= Float.parseFloat((String)session.getAttribute("price"));
	
	float amt= (noOfPersons)* (price1);

%>
<h2>Payment Page</h2><br><br>
<form action="thankyou.jsp" method="post">
<b>Airline Name: <%=session.getAttribute("air_name") %></b><br><br>
<b>From: <%=session.getAttribute("src") %></b><br><br>
<b>To:  <%=session.getAttribute("destination") %></b><br><br>
<b>Date Of Travel : <%=session.getAttribute("dateOfTravel") %></b><br><br>
<b>Number of Passengers: <%=session.getAttribute("noOfPer") %></b><br><br>
<b>Ticket Price :<%=session.getAttribute("price") %></b><br><br><br>
<b>Amount to be paid: <%= amt %></b><br><br><br><br>
<button>Confirm Booking</button>                      
</form>

<%
} //End of else
	%>


















                      
</body>
</html>