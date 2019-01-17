<%@page import="com.model.adminloginmodel"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/addquestion.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<title>You are in Admin panel-Add question</title>
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
<%@include file="facultyheader/header.jsp" %>
<body oncontextmenu="return false;">
	<%
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	int num = 0;
	%>
	<div class="main">
		<div class="starting">
			<h2>Admin Pannel - Question Adding</h2>
			<hr class="style13">
		</div>
		<div class="addpart">
			<form name="form" action="addques" method="post">
			<table align="center">
			<%
			try{
				conn = DBConnection.createConnection();
				String sql = "SELECT MAX(QuesNo) FROM tbl_question";
				//String sql = "select last (QuesNO) from tbl_question order by QuesNO";
				pst = conn.prepareStatement(sql);
				rs = pst.executeQuery();
				while(rs.next()){
					int maxv = rs.getInt("MAX(QuesNo)");		
			%>
			
				<tr>
					<td>Question No </td>
					<td>: </td>
					<td><input type="text"name="quesno" value=<%=maxv+1%>></td>
				</tr>
				<tr>
					<td>Exam Id </td>
					<td>: </td>
					<td><input type="text" name="examid" placeholder="Enter the Exam id(CSE, EEE, English...)" required ></td>
				</tr>
				<tr>
					<td>Question Label </td>
					<td>: </td>
					<td><input type="text" name="qlabel" placeholder="Enter the question label(Easy, Medium, Hard)..." required ></td>
				</tr>
				<tr>
					<td>Question </td>
					<td>: </td>
					<td>
						<input type="text" name="ques" placeholder="Enter the question..." required >
					</td>
				</tr>
				<tr>
					<td>Choice One</td>
					<td>: </td>
					<td><input type="text" name="ans1" placeholder="Enter option one..." required></td>
				</tr>
				<tr>
					<td>Choice Two</td>
					<td>: </td>
					<td><input type="text" name="ans2" placeholder="Enter option Two..." required></td>
				</tr>
				<tr>
					<td>Choice Three</td>
					<td>: </td>
					<td><input type="text" name="ans3" placeholder="Enter option Three..." required></td>
				</tr>
				<tr>
					<td>Choice Four</td>
					<td>: </td>
					<td><input type="text" name="ans4" placeholder="Enter option Four..." required></td>
				</tr>
				<tr>
					<td>Correct Ans. No. </td>
					<td>: </td>
					<td><input type="number" name="correctans"></td>
				</tr>
				<tr>
					<td colspan="3" align="center"><input type="submit" value="Add a question" name="button"></td>
				</tr>
			<% 
	}
	
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
				<tr>
					<td><%=(request.getAttribute("SUCCESS") == null) ? "": request.getAttribute("SUCCESS")%></td>
				</tr>
			</table>
			</form>
		</div>
	</div>
</body>
<%@include file="footer.jsp" %>
</html>