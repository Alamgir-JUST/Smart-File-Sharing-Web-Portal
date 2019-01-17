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
.main{
	min-height:250px;
}
.main h2{
	background: #f4f4f4 none repeat scroll 0 0;
    font-family: "Times New Roman", Times, serif;
  	box-shadow: 2px 2px 0 1px #999;
  	color: #010002;
  	margin: 10px auto 25px;
  	padding: 4px;
  	text-align: center;
  	width: 620px;
}
hr.style13 {
	height: 10px;
	border: 0;
	box-shadow: 0 10px 10px -10px #8c8b8b inset;
}

.rightside{
		text-align:center;
		margin-top:px;
		width:50%;
		margin-left:auto;
		margin-right:auto;
		min-height:px;
		border-radius: 10px 50px;
	    background: ;
	    border:1px solid black;
	    padding: 20px; 
	    height: 220px;
	    margin-bottom:20px;
}
input[type=text]{
margin-top:10px;
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
.rightside p{
	margin-top:10px;
	font-size:20px;
	
}
</style>
<%@include file="facultyheader/header.jsp" %>
<body oncontextmenu="return false;">
<div class="main">
	<h2>Faculty panel - User Login</h2>
	<hr class="style13">
	<br>
	
	<div class="rightside">
	<form action="adlogserv" method="post">
		<table align="center">
			<tr>
				<td><p>Name</p></td>
				<td><p> : </p></td>
				<td><input type="text" name="username"></td>
			</tr>
			<tr>
				<td><p>Password</p></td>
				<td><p> : </p></td>
				<td><input type="password" name="password"></td>
			</tr>
			
		</table>
		<table>
			<tr>
				<td>
				<input type="submit" value="Login"></td>
			</tr>
		</table>
	</form>
	</div>
</div>
</body>

</html>
<%@include file="footer.jsp" %>