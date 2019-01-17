<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All the members of Faculty Panel</title>      
        <link rel="icon" 
      type="image/png" 
      href="image/title.png">
    </head>
    <style>
    
    .mainclass{
    	margin-bottom:1500px;
    }
    .mainclass h2{
    	background: #f4f4f4 none repeat scroll 0 0;
    font-family: "Times New Roman", Times, serif;
  	box-shadow: 2px 2px 0 1px #999;
  	color: #010002;
  	margin: 10px auto 25px;
  	padding: 4px;
  	text-align: center;
  	width: 780px;
    }
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  width: auto;
  margin: auto;
  align:center;
  text-align: center;
  font-family: arial;
  margin-bottom:10px;
  margin-left:35px;
  margin-right:10px;
}

.title {
  color: grey;
  font-size: 18px;
}

button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}

.linksec a {
  text-decoration: none;
  font-size: 22px;
  color: black;
}

.card button:hover, a:hover {
  opacity: 0.7;
}
.footersec{

}
hr.style13 {
		height: 10px;
		border: 0;
		box-shadow: 0 10px 10px -10px #8c8b8b inset;
    	
    	}
.imgcenter{
	width:300px;
	height:300px;
	margin-left:auto;
	margin-right:auto;
	border-radius: 50%;
}
</style>
<%@include file="Student_Header.jsp" %>
    <body oncontextmenu="return false;">
    <div class="mainclass">
        		<div class="textpart">
        		<h2>Faculty Members of Student - Faculty File sharing Portal</h2>
        		<hr class="style13">
        		</div>
    <%
    	ArrayList<Integer> myList = new ArrayList();
    	Connection conn = null;
    	PreparedStatement pst = null;
    	ResultSet rs = null;
    %>
    <% 
    try{
		conn = DBConnection.createConnection();
		String sql = "select * from tbl_faculty";
		pst = conn.prepareStatement(sql);
		rs = pst.executeQuery();
		while(rs.next()){
			myList.add(rs.getInt("id"));
		}
	}catch(Exception e){
		e.printStackTrace();
	}
    
    %>
    
    <%
    	try{
    		
    		conn = DBConnection.createConnection();
        	String sql = "select * from tbl_faculty";
        	pst = conn.prepareStatement(sql);
        	rs = pst.executeQuery();
        	
        	while(rs.next()){
        		String name = rs.getString("Name");
        		String dep = rs.getString("Department");
        		String uni = rs.getString("University");
        		String desi = rs.getString("Designation");
        		String web = rs.getString("Website");
        		String twi = rs.getString("Twitter");
        		String linkedin = rs.getString("Linkedin");
        		String face = rs.getString("Facebook");
        		String image = rs.getString("Picture");
        		
        		%>
        		
			<div class="card" style="float:left;width:45%">
				  <img src="<%=image%>" class="imgcenter">
				  <h1><%=name %></h1>
				  <p class="title"><%=desi%></p>
				  <p><%=dep%></p>
				  <p><%=uni%> </p>
				  <div class="linksec" style="margin: 24px 0;">
				    <a href="<%=web%>"><i class="fa fa-dribbble"></i></a> 
			    	<a href="<%=twi%>"><i class="fa fa-twitter"></i></a>  
 					<a href="<%=linkedin%>"><i class="fa fa-linkedin"></i></a>
			    	<a href="<%=face%>"><i class="fa fa-facebook"></i></a> 
				 </div>
				 <p><button>Contact</button></p>
			</div>
        		
        		<% 
        	}
    		
    	}catch(Exception e){
    		e.printStackTrace();
    	}
%>    
 
 		</div>
       <div class="footersec">
       		<%@include file="footer.jsp" %>
       </div>
       
    </body>
</html>


