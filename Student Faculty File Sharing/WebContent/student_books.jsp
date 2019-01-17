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
<link rel="stylesheet" type="text/css" href="css/question_list.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to student-faculty file sharing portal</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
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


<%
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
%>
	<div class="fpart">

	<h2 align="center">Available Books for Student-----</h2>
	<hr class="style13">
	</div>
	<table align="center" name="mytbl" border="1" width="100%">
	<tr bgcolor="#2E3644" style="color:#ffffff">
		<td align="center"><b>Department</b></td>
		<td align="center"><b>Year</b></td>
		<td align="center"><b>Semister</b></td>
		<td align="center"><b>Type</b></td>
		<td align="center"><b>Name</b></td>
		<td align="center"><b>Publisher</b></td>
		<td align="center"><b>File</b></td>
	</tr>
	<%
	try{ 
		
	conn = DBConnection.createConnection();
	String sql ="SELECT * FROM tbl_books order by Books_Id desc";
	pst = conn.prepareStatement(sql);
	rs = pst.executeQuery();
	
	while(rs.next()){
	%>
	<tr>	
	<td align="center"><%=rs.getString("Department") %></td>
	<td align="center"><%=rs.getString("Year") %></td>
	<td align="center"><%=rs.getString("Semister") %></td>
	<td align="center"><%=rs.getString("Books_Type") %></td>
	<td align="center"><%=rs.getString("Books_Name") %></td>
	<td align="center"><%=rs.getString("Publishers") %></td>
	<td align="center"><center><a href="view_books.jsp?Books_Id=<%out.print(rs.getString("Books_Id"));%>">View</a></center></td>		
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
