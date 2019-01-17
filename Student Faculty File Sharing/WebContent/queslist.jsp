<%@page import="com.model.adminloginmodel"%>
<%@page import="com.model.loginmodel"%>
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
<link rel="stylesheet" type="text/css" href="css/question_list.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Faculty File Sharing Question list for Online Exam</title>
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
%>
	<div class="fpart">

	<h2 align="center">faculty Panel- Question List</h2>
	<hr class="style13">
	</div>
	<table align="center" name="mytbl" border="1" width="100%">
	<tr bgcolor="#2E3644" style="color:#ffcccc">
		<td align="center"><b>Question No.</b></td>
		<td align="center"><b>ExamId</b></td>
		<td align="center"><b>QLabel</b></td>
		<td align="center"><b>Question</b></td>
		<td align="center"><b>Actions</b></td>
	</tr>
	<%
	try{ 
		
	conn = DBConnection.createConnection();
	String sql ="SELECT * FROM tbl_question order by QuesNo";
	pst = conn.prepareStatement(sql);
	rs = pst.executeQuery();
	
	while(rs.next()){
	%>
	<tr>	
	<td><%=rs.getString("QuesNo") %></td>
	<td><%=rs.getString("examid") %></td>
	<td><%=rs.getString("qlabel") %></td>
	<td><%=rs.getString("Ques") %></td>
	<td>
	<a href='deleteques.jsp?d=<%=rs.getString("Quesno")%>'>Delete</a>
	</td>		
	</tr>
	
	<% 
	}
	
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
	</table>	
</body>
<%@include file="footer.jsp" %>
</html>
