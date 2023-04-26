<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Assign teachers</title>
</head>
<body>

<h2>Assign Teachers to a class for a subject</h2>
<br><br>

<form action="assignTeachers.jsp" method="post">
<label for="tea">Select Teachers</label>
<select name="teacher">
<option value="1">Reena</option>
<option value="2">Sita</option>
<option value="3">Shalu</option>
<option value="4">Ramesh</option>
<option value="5">Suresh</option>
</select>

<label for="cl">Select class</label>
<select name="classes1">
<option value="1">Section A</option>
<option value="2">Section B</option>
<option value="3">Section C</option>
<option value="4">Section D</option>
</select>

<label for="sub">Select a subject</label>
<select name="subjects1">
<option value="1">Java</option>
<option value="2">DotNet</option>
<option value="3">English</option>
<option value="4">Maths</option>
<option value="5">Science</option>
<option value="6">Hindi</option>
</select>
<br><br><br>

<input type="submit" value="Assign">


</form>

</body>
</html>