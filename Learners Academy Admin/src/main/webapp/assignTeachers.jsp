<%@ page import="java.util.Properties" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Assigning Teachers</title>
</head>
<body>

<%

String teacher=request.getParameter("teacher");
String classes1=request.getParameter("classes1");
String subject=request.getParameter("subjects1");
int class_id=Integer.parseInt(classes1);
int subject_id=Integer.parseInt(subject);
int teacher_id=Integer.parseInt(teacher);
String className=null;
String subjectName=null;
String teacherName=null;


switch(classes1){

case "1" : {className="Section A"; break;}
case "2" : {className="Section B"; break;}
case "3" : {className="Section C";break;}
case "4" : {className="Section D" ; break;}
}

switch(subject){
 
case "1" : {subjectName="Java"; break;}
case "2" : {subjectName="DotNet"; break;}
case "3" : {subjectName="English"; break;}
case "4" : {subjectName="Maths"; break;}
case "5" : {subjectName="Science"; break;}
case "6" : {subjectName="Hindi"; break;}

}

switch(teacher){

case "1":{teacherName="Reena"; break;}
case "2":{teacherName="Sita"; break;}
case "3":{teacherName="Shalu"; break;}
case "4":{teacherName="Ramesh"; break;}
case "5":{teacherName="Suresh"; break;}

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
	    
	  //Step4: Create Statement object
	       
	         Statement stmt=null;
	  
	         try {
		            stmt = connection.createStatement();
	         }

		       catch(SQLException e) {

		           e.printStackTrace();
		         }

		          ResultSet rs= null;


		          try{
		        		
		        	   	boolean empty=true;
		        	     rs=stmt.executeQuery("Select * from classes where Id= "+ class_id + " and sid= "+ subject_id);
		        	     
		        	    while(rs.next()){
		        	    	
		        	    	empty=false;
		        	    	
		        	    }  //End of while
		            	
		            	
		                if(empty){
		                	
		                	 PreparedStatement psmt=null;
		                	 
		                try{	 
		                	 psmt=connection.prepareStatement("insert into classes(Id,cname,tid,sid) values(?,?,?,?)");
		     	            psmt.setInt(1,class_id);
		     	            psmt.setString(2,className);
		     	            psmt.setInt(3,teacher_id);
		     	            psmt.setInt(4,subject_id);
		     	            psmt.executeUpdate();
		     	            //out.write("I'm in if");
		     	            out.write("Teacher "+teacherName+ " is assigned to class "+ className +" with subject " + subjectName );
		                }
		                
		                catch(SQLException e){
		                	
		                	e.printStackTrace();
		                }

		                } //End of if  
		                
		                else{
		                	PreparedStatement psmt=null;
		                	 
		                	//out.write("There is a record<br>");
		                	//System.out.println("There is a record");
			                try{	 
			                	// psmt=connection.prepareStatement("update classes set tid="+ teacher_id+ "where Id=" +"'"+ class_id+"' and sid="+"'"+ subject_id+"'");
			     	            
			     	            psmt=connection.prepareStatement("update classes set tid=? where Id=? and sid=?");
			     	            psmt.setInt(1,teacher_id);
			     	            psmt.setInt(2,class_id);
			     	            psmt.setInt(3,subject_id);
			     	            psmt.executeUpdate();
			     	            out.write("Teacher "+teacherName+ " is assigned to class "+ className +" with subject " + subjectName );
			                }
			                
			                catch(SQLException e){
			                	
			                	e.printStackTrace();
			                }

		                }//End of else
		                	
		          }//End of try
		          
		          catch(Exception e){
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
<a href="admin-dashboard.jsp">Go to Admin Dashboard</a>

</body>
</html>