<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/student_discussion.css"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>You are now in Student Discussion Session</title>
<link rel="icon" 
      type="image/png" 
      href="image/title.png">
</head>
<style>
	.tabledata{
		margin-top:20px;
		margin-bottom:20px;
	}
	.messagepart{
		margin-top:50px;
	}
	
	hr.style13 {
		height: 10px;
		border: 0;
		box-shadow: 0 10px 10px -10px #8c8b8b inset;
    	
    	}
</style>
<%@include file="Student_Header.jsp" %>
<body oncontextmenu="return false;">
	<div class="starting">
		<h2>You can discuss with other Students</h2>
		<hr class="style13">
	</div>
	<div class="tabledata">
		<%@include file="autoscrollingtable.jsp" %>
		<hr class="style13">
	</div>
	
	<div class="message_part">
	<form action="sdiscussion_serv" method="post" enctype="multipart/form-data">
		<table align="center">
			<tr>
				<td><p>Say Something</p></td>
				<td><p> : </p></td>
				<td>
					<textarea name="message" rows="2" cols="50" placeholder="Enter your message-----" ></textarea>		
					</td>
					<td><input type="file" name="dis_file" value="Choose File"></td>
				<td><input type="submit" value="Submit"></td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>
<%@include file="footer.jsp"%>