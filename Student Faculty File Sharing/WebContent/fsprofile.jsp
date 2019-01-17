<%@page import="com.model.adminloginmodel"%>
<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Your Profile</title>
<link rel="icon" 
      type="image/png" 
      href="image/title.png">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<style>
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 700px;
  margin: auto;
  text-align: center;
  font-family: arial;
}

.title {
  color: grey;
  font-size: 18px;
}
.textpart h2{
	background: #f4f4f4 none repeat scroll 0 0;
    font-family: "Times New Roman", Times, serif;
  	box-shadow: 2px 2px 0 1px #999;
  	color: #010002;
  	margin: 10px auto 25px;
  	padding: 4px;
  	text-align: center;
  	width: 620px;
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
hr.style13 {
	height: 10px;
	border: 0;
	box-shadow: 0 10px 10px -10px #8c8b8b inset;
}
img{
  border-radius: 0%;
}
.linksec a {
  text-decoration: none;
  font-size: 22px;
  color: black;
}
hr.style13 {
		height: 10px;
		border: 0;
		box-shadow: 0 10px 10px -10px #8c8b8b inset;
    	
    	}
button:hover, a:hover {
  opacity: 0.7;
}
</style>
<body oncontextmenu="return false;">
<%
	Connection conn =null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	//String name = "alamgir";
	String name = adminloginmodel.getUsername();
	
%>
<%
	try{
		conn = DBConnection.createConnection();
		String sql = "select * from tbl_faculty where name=?";
		pst = conn.prepareStatement(sql);
		pst.setString(1, name);
		rs = pst.executeQuery();
		
		while(rs.next()) {
			String fname = rs.getString("Name");
			String dept = rs.getString("Department");
			String uni = rs.getString("University");
			String desi = rs.getString("Designation");
			String web = rs.getString("Website");
			String twi = rs.getString("Twitter");
			String linke = rs.getString("Linkedin");
			String face = rs.getString("Facebook");
			String yimage = rs.getString("Picture");
			%>
			<div class="textpart">
				<h2>Your Profile Description</h2>
				<hr class="style13">
			</div>
			<hr class="style13">
				<br>
			<div class="card">
			  
			  <img src="<%=yimage%>" style="width:100%">	   
			  <h1><%=fname %></h1>
			  <p class="title"><%=desi %></p>
			  <p><%=dept %></p>
			  <p><%=uni %></p>
			  
			  <div class="linksec" style="margin: 24px 0;">
			    <a href="<%=web%>"><i class="fa fa-dribbble"></i></a> 
			    <a href="<%=twi%>"><i class="fa fa-twitter"></i></a>  
 				<a href="<%=linke%>"><i class="fa fa-linkedin"></i></a>
			    <a href="<%=face%>"><i class="fa fa-facebook"></i></a> 
			 </div>
			<p><button>Contact</button></p>
			</table>
		</div>
		
			<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
</body>
</html>