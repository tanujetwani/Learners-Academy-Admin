<%@ page import="java.util.Properties" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List Of Airlines</title>
</head>
<body>

<h2>Master List of Airlines</h2>

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
	    
	  //Step4: Create Statement object
	       
	       Statement stmt=null;

	      try {
	            stmt = connection.createStatement();
	}

	       catch(SQLException e) {

	           e.printStackTrace();
	         }

	          ResultSet rs= null;

	    
%>

<table>
<thead>
<tr>
    <th scope="col" >Airline Name</th>
</tr>
</thead>

<tbody>

<%         try{
	
               	boolean empty=true;
                 rs=stmt.executeQuery("Select Airline_name from flights group by Airline_name");
                 
                while(rs.next()){
                	
                	empty=false;
 %>  
 
 <tr>
     <td><%= rs.getString("Airline_name") %></td>
     
     </tr>
     
     
<%
                }  //End of while
                	
                	
                if(empty){
               	 out.println("<br><br>No data of Airlines present in database<br><br>" );
                }
                
          } //End of try
          
      catch(SQLException e){
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

<br><br><br><a href="logout.jsp">Click here to  logout</a>

</body>
</html>