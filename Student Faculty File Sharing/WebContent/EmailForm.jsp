<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/main.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<title>Most welcome to student-faculty file sharing portal</title>
<link rel="icon" 
      type="image/png" 
      href="image/title.png">
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
	<div class="starting">
		<h2>Mail to your desired Faculty Member</h2>
		<hr class="style13">
	</div>
	<div class="mailclass">
		<form action="EmailSendingServlet" method="post">
        <table align="center">
            <tr>
                <td>Faculty Member Address</td>
                <td> : </td>
                <td><input type="text" name="recipient" size="50"/></td>
            </tr>
            <tr>
                <td>Subject</td>
                <td> : </td>
                <td><input type="text" name="subject" size="50"/></td>
            </tr>
            <tr>
                <td>Content</td>
                <td> : </td>
                <td><textarea rows="10" cols="50" name="content" placeholder="At first describe yourselves then type your message-------"></textarea> </td>
            </tr>
            <tr>
            	<td></td>
            	<td></td>
                <td align="center"><input type="submit" value="Send"/></td>
            </tr>
        </table>
         
    </form>
	</div>
</body>
</html>
<%@include file="footer.jsp"%>