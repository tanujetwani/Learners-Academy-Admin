<%@ page import="java.util.Properties" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Class Report</title>
</head>
<body>

<h2>Class Report for class <%=request.getParameter("classes2") %></h2>

<% 
String class_section=request.getParameter("classes2");
		int class_id=0;

switch(class_section){
          
case "Section A" :{class_id=1;break;}
case "Section B" :{class_id=2;break;}
case "Section C" :{class_id=3;break;}
case "Section D" :{class_id=4;break;}


}
		
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

<h3>List of Subjects</h3>
	    
<%
	  //Step4: Create Statement object
	       
     
         PreparedStatement psmt=null;
         ResultSet rs=null;
         
         try{
        	 psmt=connection.prepareStatement("Select sname from subjects where Id in (select sid from classes where Id=?)");
        	 psmt.setInt(1,class_id);
        	 rs=psmt.executeQuery();
        	 
        	 boolean empty=true;
        	 while(rs.next()){
        		 empty=false;
         
           
	        	    
%>	        	    	
	          
	          <%=rs.getString("sname") %><br>
	          
	          
	                       	    	
<%        	    	
	        	    }  //End of while
                if(empty){
                	out.write("No subjects assigned for class "+ class_section);
                	
                }
	        	    
	          }  //End of try 	    

             catch(SQLException e){
            	 e.printStackTrace();
             }
	          //rs.close();
	          psmt.close();
%>

<hr>

<br>
<h4>List Of Teachers</h4>

<%


           PreparedStatement psmt1=null;
            ResultSet rs1=null;
            
            try{
           	 psmt1=connection.prepareStatement("Select tname from teachers where Id in (select tid from classes where Id=?)");
           	 psmt1.setInt(1,class_id);
           	 rs1=psmt1.executeQuery();
           	 
           	 boolean empty=true;
           	 while(rs1.next()){
           		 empty=false;
           		 

%>

          <%=rs1.getString("tname") %><br>

<%

	    }//End of while
	    	
	    	
	    if(empty){
        	out.write("No teachers assigned for class "+ class_section);
        	
              }
    	    
           }  //End of try 	    

     catch(SQLException e){
    	 e.printStackTrace();
     }
	    	psmt1.close();

%>

<hr>
<br>

<h4>List of students</h4>

<%
Statement stmt2=null;

try {
          stmt2 = connection.createStatement();
      }

catch(SQLException e) {

         e.printStackTrace();
       }

ResultSet rs2= null;

try{
		
	   	boolean empty=true;
	     rs2=stmt2.executeQuery("Select stuname from students where class_id="+ class_id);
	    		 
	    while(rs2.next()){
	    	
	    	empty=false;

%>

          <%=rs2.getString("stuname") %><br>

<%

	    }//End of while
	    	
	    	
	    if(empty){
        	out.write("No students assigned to class "+ class_section);
        	
              }
    	    
           }  //End of try 	    

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
<br><br>
<a href="admin-dashboard.jsp">Go to Admin dashboard</a>


</body>
</html>