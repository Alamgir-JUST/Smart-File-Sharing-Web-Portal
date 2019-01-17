<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<title>Login with your UserName and Password</title>
<link rel="icon" 
      type="image/png" 
      href="image/title.png">
</head>
</head>

<style>
input[type="text"], input[type="password"] {
	background-color: ; /* Green */
    padding: 6px 50px;
    border-radius: 25px;
    border:1px solid blue;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
}

input[type="submit"]{
	background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 8px 50px;
    border-radius: 25px;
    border:1px solid blue;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: px;
    margin-top:20px;
    margin-left:40px;
}

form{
	border:2px solid black;
}
</style>
<body oncontextmenu="return false;">
<%
	String userName=(String)session.getAttribute("username");
	String userPwd=(String)session.getAttribute("password");
%>
	<form action="LogServ" method="post">
		<table>
			<tr>
				<td>User Name : </td>
				<td><input type="text" name="username"></td>
			</tr>
			<tr>
				<td>Password : </td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td><input type="submit" value="Login"></td>
			</tr>
		</table>
		<p>New user??<a href="Student_Register.jsp">SignUp</a></p>
	</form>
	</body>

</html>