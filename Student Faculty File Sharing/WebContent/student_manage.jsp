<%@page import="com.model.adminloginmodel"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<title>Admin Panel-User Control</title>
<link rel="icon" 
      type="image/png" 
      href="image/title.png">
</head>
<%@include file="facultyheader/header.jsp" %>

<style>
	.headpart h2{
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
</style>
<body oncontextmenu="return false;">
	<%
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	
	%>
	<div class="headpart">
		<h2>Faculty Panel- User Control</h2>
		<hr class="style13">
	</div>
	<div class="tbldata">
		<table align="center" name="mytbl" border="1" width="100%">
		<tr bgcolor="#2E3644" style="color:#ffffff">
			<td align="center"><b>Number</b></td>
			<td align="center"><b>Student-Id</b></td>
			<td align="center"><b>User-Name</b></td>
			<td align="center"><b>Email</b></td>
			<td align="center"><b>Subject</b></td>
			<td align="center"><b>University</b></td>
			<td align="center"><b>Actions</b></td>
		</tr>
		<%
		try{
			conn = DBConnection.createConnection();
			String sql = "select * from student";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			
			while(rs.next()){
				%>
				<tr>
				<td align="center"><%=rs.getInt("id") %></td>
				<td align="center"><%=rs.getString("Student_Id") %></td>
				<td align="center"><%=rs.getString("Uname") %></td>
				<td align="center"><%=rs.getString("Email") %></td>
				<td align="center"><%=rs.getString("Subject") %></td>
				<td align="center"><%=rs.getString("University") %></td>
				<td align="center"><a href='deleteuser.jsp?d=<%=rs.getString("id")%>'>Remove</a></td>
				</tr>
				<%
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		%>
		</table>
	</div>
</body>
<%@include file="footer.jsp" %>
</html>