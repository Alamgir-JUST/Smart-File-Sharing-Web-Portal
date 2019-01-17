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
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student-Faculty file sharing portal-Result View</title>
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

	<h2 align="center">Faculty Panel- View Results</h2>
	<hr class="style13">
	</div>
	<table align="center" name="mytbl" border="1" width="100%">
	<tr bgcolor="#2E3644" style="color:#ffffff">
		<td align="center"><b>Department</b></td>
		<td align="center"><b>Year</b></td>
		<td align="center"><b>Semister</b></td>
		<td align="center"><b>Exam Type</b></td>
		<td align="center"><b>Name</b></td>
		<td align="center"><b>File</b></td>
		<td align="center"><b>Action</b></td>
	</tr>
	<%
	try{ 
		
	conn = DBConnection.createConnection();
	String sql ="SELECT * FROM tbl_result order by Result_Id desc";
	pst = conn.prepareStatement(sql);
	rs = pst.executeQuery();
	
	while(rs.next()){
	%>
	<tr>	
	<td align="center"><%=rs.getString("Department") %></td>
	<td align="center"><%=rs.getString("Year") %></td>
	<td align="center"><%=rs.getString("Semister") %></td>
	<td align="center"><%=rs.getString("Type") %></td>
	<td align="center"><%=rs.getString("Name") %></td>
	<td align="center"><center><a href="view_result.jsp?Result_Id=<%out.print(rs.getString("Result_Id"));%>">View</a></center></td>
	<td align="center"><center><a href="deleteresult.jsp?id=<%out.print(rs.getString("Result_Id"));%>">Delete</a></center></td>		
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
