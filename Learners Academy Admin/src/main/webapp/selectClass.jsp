<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Select a Class </title>
</head>
<body>

<h2> Select a class to view its class report</h2>
<br><br>

<form  action="viewclassreport.jsp" method="post">
<label for="cl">Select Class</label>
<select name="classes2">
<option value="Section A">Section A</option>
<option value="Section B">Section B</option>
<option value="Section C">Section C</option>
<option value="Section D">Section D</option>
</select>
<br><br><br>
<input type="submit" value="View Class Report">

</form>

</body>
</html>