<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<title>Welcome to Student-Faculty File Sharing Portal</title>
<link rel="icon" 
      type="image/png" 
      href="image/title.png">
</head>
<style>

input[type=text]{
	margin-top:20px;
	background-color: ; /* Green */
    padding: 8px 50px;
    border-radius: 25px;
    border:1px solid blue;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
}
input[type=password]{
	background-color: ; /* Green */
    padding: 8px 51px;
    border-radius: 25px;
    border:1px solid blue;
    text-align: center;
    text-decoration: none;
    font-color:black;
    display: inline-block;
    font-size: 16px;
}
input[type=submit]{
	background-color: #a3a5af; /* Green */
    border: none;
    color: white;
    padding: 8px 50px;
    border-radius: 25px;
    border:1px solid blue;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin-top:20px;
    margin-left:140px;
}

.texth h2{
	background: #f4f4f4 none repeat scroll 0 0;
    font-family: "Times New Roman", Times, serif;
  	box-shadow: 2px 2px 0 1px #999;
  	color: #010002;
  	margin: 10px auto 25px;
  	padding: 4px;
  	text-align: center;
  	width: 780px;
}
.rightside{
	margin-left:auto;
	margin-right:auto;
	width:50%;
	border:1px solid black;
	text-align:center;
	border-radius:10px 50px;
}
.footer{
	display:block;
	margin-top:80px;
}


/* Single-direction drop shadow */

hr.style13 {
		height: 10px;
		border: 0;
		box-shadow: 0 10px 10px -10px #8c8b8b inset;
    	
    	}
</style>
<%@include file="Student_Header.jsp" %>
<body oncontextmenu="return false;">
<%
	String userName=(String)session.getAttribute("username");
	String userPwd=(String)session.getAttribute("password");
%>
	<div class="main">
		<div class="texth">
			<h2 align="center">Student-Faculty File Sharing - Student Login</h2>
			<hr class="style13">
		</div>
		<hr>
	<div class="bodysec">
		<div class="leftside">
			
		</div>
		<div class="rightside">
			
	<form action="LogServ" method="post">
		<table align="center">
			<tr align="center">
				<td><p>User Name : </p></td>
				<td><p><input type="text" name="username"></p></td>
			</tr>
			<tr>
				<td align="center"><p>Password : </p></td>
				<td><p><input type="password" name="password"></p></td>
			</tr>
			<tr>
				<td><p><input type="submit" value="Login"></p></td>
			</tr>
		</table>
		<p>New user??<a href="Student_Register.jsp">SignUp</a></p>
	</form>
		</div>
	</div>
	</div>
	 	
  <div class="footer">
  	<%@include file="footer.jsp" %>
  </div>
</body>
</html>