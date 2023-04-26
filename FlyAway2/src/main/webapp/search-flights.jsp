<%@ page import="java.util.Properties" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.Date" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Results</title>
</head>
<body>
<%
//Step 1: Register JDBC driver
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
} 

catch(ClassNotFoundException e)
{
	e.printStackTrace();
}

//Step 2: Load properties.database file

		InputStream in = getServletContext().getResourceAsStream("/WEB-INF/database.properties");
	    Properties props = new Properties();
	    props.load(in);



//Extract url, userid and pwd from properties file
	    
	    String url= props.getProperty("url");
	    String userid= props.getProperty("userid");
	    String password= props.getProperty("password");
	    
	    
 //Connect to database using the driver registered above and get the connection object
	    
	    Connection connection = null;
	    
	    try {
	        connection = DriverManager.getConnection(url,userid,password);
	    
	    }
	    
	    catch (SQLException e) {
	    
	    	e.printStackTrace();
	    	
	    }
	    
%>



<% 

//Step4: Create Statement object
       
     
          PreparedStatement psmt=null;
          ResultSet rs=null;

         try {
        	 
        	 String date=request.getParameter("date");
        	 
        	  String src =request.getParameter("source");
        	  String dest=request.getParameter("dest");
        	  String noOfPassengers=request.getParameter("numofPassengers");
        	  
        	  session.setAttribute("src",src);
        	  session.setAttribute("destination",dest);
        	  session.setAttribute("noOfPer",noOfPassengers);
        	  session.setAttribute("dateOfTravel", date);
        	  
        	  if(src==""|| dest==""|| date==""|| noOfPassengers==""){
        		  out.println("Enter valid information<br><br><br>");
        	  }
       	
 
        	  else{  
 %>
<h2>Search Results</h2> 
 <table>

<thead>
<tr>
    <th scope="col" >Source</th>
    <th scope="col"> Destination</th>
    <th scope="col"> Airline Name</th>
    <th scope="col"> Date</th>
    <th scope="col">Price</th>
    <th scope="col">Select</th>
    
    </tr>
    </thead>
    
    <tbody>
 
 
 
 
 <%       	  
 
 
          	 psmt=connection.prepareStatement("Select * from flights where source=? and destination=? and Flight_date=?");
	         psmt.setString(1,src);
	         psmt.setString(2,dest);
	         psmt.setString(3,date);
	         rs=psmt.executeQuery();
	 
	         boolean empty=true;
	         while(rs.next()){
		     empty=false;
        	  
		     /*boolean empty=true;
        	
                rs = stmt.executeQuery("Select * from flights where source="+"'"+src+"'"+"and destination = "+"'"+ dest +"'"+ 
        	                           "and Flight_date= "+"'"+ date +"'");
               

             while (rs.next()){
            	 empty=false; */
            	 

%>
        

	    	   
<tr>	       
<td><%= rs.getString("source") %></td>
<td><%=rs.getString("destination") %></td>
<td><%=rs.getString("Airline_name") %></td>
<td><%= rs.getString("Flight_date") %></td>
<td><%=rs.getFloat("price") %></td>
<td>

<form action="user-details.jsp"  method="post">
<input type="hidden" name="src" value="<%=rs.getString("source")%>">
<input type="hidden" name="destination" value="<%=rs.getString("destination") %>">
<input type="hidden" name="airline" value="<%=rs.getString("Airline_name") %>">
<input type="hidden"  name="date" value="<%=rs.getString("Flight_date") %>">
<input type="hidden" name="ticket-price" value="<%=rs.getString("price") %>">

<input type=submit value="BOOK">

</form>

</td>
</tr>

<%
             }  //End of while
             
             if(empty){
            	 out.println("<br><br>No flights from "+ src + " to "+ dest+ " for date "+ date+"<br><br>" );
             }
               psmt.close();             
        	  }//End of else
        		  
             }  //End of try
    catch(SQLException e) {
    	
    	e.printStackTrace();
    	
    }
  
          
    //Close the database connection 

             try {
    	
    	          connection.close();	    
    }

            catch(SQLException e)

             { e.printStackTrace();

    }
          


%>

</tbody>
</table>

<br><br><a href="index.jsp">Go to Query form(Home Page) Again</a>

</body>
</html>