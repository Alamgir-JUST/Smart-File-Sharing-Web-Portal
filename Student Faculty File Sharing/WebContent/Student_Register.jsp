<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/Register.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to Student-Faculty File Sharing Portal</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<link rel="icon" 
      type="image/png" 
      href="image/title.png">
<script>
//Validation start---------

function validate(){
	var name = document.form.name.value;
	var uname = document.form.uname.value;
	var pass = document.form.pass.value;
	var repass = document.form.repass.value;
	var email = document.form.email.value;
	var sub = document.form.subject.value;
	var univer = document.form.university.value;
	
	
	
	if(name==null || name==""){
		alert("Name can't blank");
		return false;
	}
	if(uname==null || uname==""){
		alert("UserName can't blank");
		return false;
	}
	if(pass.length<6){
		alert("Password length more than 6 characters");
		return false;
	}
	if(pass.localeCompare(repass)!=0){
		alert("Password not matched!!!!");
		return false;
	}
	//Email Validation start
	var x = document.form.email.value;
	var atpos = x.indexOf("@");
    var dotpos = x.lastIndexOf(".");
    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
        alert("Not a valid e-mail address");
        return false;
    }
	//Email validation finish
}
</script>

<link rel="stylesheet" type="text/css" href="CSS/register.css" >
</head>

<style>
	hr.style13 {
		height: 10px;
		border: 0;
		box-shadow: 0 10px 10px -10px #8c8b8b inset;
    	
    	}
</style>

<%@include file="Student_Header.jsp" %>


<body oncontextmenu="return false;">

<div class="main">
	<div class="first">
		<h2>Student Faculty File Sharing-User Registration Form</h2>
		<hr class="style13">
	</div>
	<div class="bparttwo">
	
	<div class="firstpart">
		
		<img src="image/register.png" height="390px" width="500px">
	</div>
	<div class="secondpart">
	<form name="form" action="RegServ" method="post" onsubmit="return validate()">
		<table align="center">
		<tr>
		<td>Name : </td>
		<td><input type="text" name="name"/> </td>
		</tr>
		
		<tr>
		<td>Username : </td>
		<td><input type="text" name="uname"/> </td>
		</tr>
		
		<tr>
		<td>Password : </td>
		<td><input type="password" name="pass"/> </td>
		</tr>
		
		<tr>
		<td>Retype Pass : </td>
		<td><input type="password" name="repass"/> </td>
		</tr>
		
		<tr>
		<td>Email : </td>
		<td><input type="text" name="email"/> </td>
		</tr>
		
		<tr>
		<td>Subject : </td>
		<td><input type="text" name="subject"/> </td>
		</tr>
		
		<tr>
		<td>University : </td>
		<td><input type="text" name="university"/> </td>
		</tr>
		</table>
		<table>
		<tr>
		<td><input type="submit" value="Signup"/> </td>
		<td><input type="reset" value="Reset"/> </td>
		</tr>
		</table>
		<p align="center">Already Registered??<a href="index1.jsp">Login </a>Here</p>
	</form>
	</div>
	</div>
	<div class="footer">
	
	</div>
</div>
</body>
<%@include file="footer.jsp" %>
</html>

