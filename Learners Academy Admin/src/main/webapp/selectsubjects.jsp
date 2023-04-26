<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Select Subjects</title>
</head>
<body>
<h2>Assign Classes for subjects</h2><br><br>
<form action="assignsubjects.jsp"  method="post">

<label for="cl">Select class</label>
<select name="classes">
<option value="1">Section A</option>
<option value="2">Section B</option>
<option value="3">Section C</option>
<option value="4">Section D</option>
</select>

<label for="sub">Select a subject</label>
<select name="subjects">
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