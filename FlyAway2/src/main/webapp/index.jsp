<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FlyAway Portal </title>
</head>
<body>
<h2>Flyaway Portal(Home Page)</h2><br>
<form action=search-flights.jsp method="post">

FROM: <input type=text name="source" maxlength=40><br><br>
TO :<input type=text name="dest" maxlength=40><br><br>
Date: <input type=date name="date"><br><br>
Number of passengers : <input type=text name="numofPassengers"><br><br>
<input type=submit value="Search Flights">


</form>

<br><br><br><br>
<a href="admin-login.jsp">Click here for Admin login</a>

</body>
</html>