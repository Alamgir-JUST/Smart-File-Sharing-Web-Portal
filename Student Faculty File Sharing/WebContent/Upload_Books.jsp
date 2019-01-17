<%@page import="com.model.adminloginmodel"%>
<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/mycss.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<title>You are in Admin Panel-Uploading Books</title>
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
<%@include file="facultyheader/header.jsp"%>
<body oncontextmenu="return false;">
<%
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs =null;
%>
<div class="main">
	<div class="starting">
			<h2>Faculty Pnnel - Books Uploading</h2>
			<hr>
		</div>
	<div class="addingpart">
		<form action="upload_books_serv" method="post" enctype="multipart/form-data">
			<table align="center">
			
			<%
			try{
				conn = DBConnection.createConnection();
				String sql = "SELECT MAX(Books_Id) FROM tbl_books";
				pst = conn.prepareStatement(sql);
				rs = pst.executeQuery();
				while(rs.next()){
					int maxv = rs.getInt("MAX(Books_Id)");
			%>
			
				<tr>
					<td><p>Books ID</p></td>
					<td><p> : </p></td>
					<td><input type="text" name="books_id" value=<%=maxv+1%>></td>
				</tr>
				
				<tr>
					<td><p>Department</p></td>
					<td><p> : </p></td>
					<td>
					<p>
						<select name="department">
							<option>--Select--</option>
							<option>CSE</option>
							<option>EEE</option>
							<option>IPE</option>
							<option>BME</option>
							<option>PHYSICS</option>
							<option>CHEMISTRY</option>
							<option>ENGILS</option>
							<option>ACCOUNTING</option>
						</select>
						</p>
					</td>
				</tr>
				<tr>
					<td><p>Year</p></td>
					<td><p> : </p></td>
					<td>
					<p>
						<select name="year">
						<option>--Select--</option>
							<option>FIRST</option>
							<option>SECOND</option>
							<option>THIRD</option>
							<option>FOURTH</option>
							<option>MSC</option>
							</select>
							</p>
					</td>
				</tr>
				<tr>
					<td><p>Semister</p></td>
					<td><p> : </p></td>
					<td>
					<p>
						<select name="semister">
						<option>--Select--</option>
							<option>1ST</option>
							<option>2ND</option>
							<option>3RD</option>
							<option>4TH</option>
							<option>5TH</option>
							<option>6TH</option>
							<option>7TH</option>
							<option>8TH</option>
						</select>
						</p>
					</td>
				</tr>
				<tr>
					<td><p>Books Type</p></td>
					<td><p> : </p></td>
					<td><input type="text" name="type" placeholder="Enter the books type----"></td>
				</tr>
				<tr>
					<td><p>Books Name/Comments</p></td>
					<td><p> : </p></td>
					<td><input type="text" name="books_name" placeholder="Enter the books name--" required></td>
				</tr>
				<tr>
					<td><p>Published By</p></td>
					<td><p> : </p></td>
					<td><input type="text" name="member_name" value="<%=adminloginmodel.getUsername()%>"></td>
				</tr>
				<tr>
					<td><p>File Upload</p></td>
					<td><p> : </p></td>
					<td><input type="file" value="Choose File" name="books_file"></td>
				</tr>
				
							<% 
	}
	
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
			</table>
			<table align="center">
				<tr>
					
					<td><input type="Submit" value="Upload Books"></td>
				
				</tr>
				
			</table>
		</form>	
	</div>
	</div>
</body>
</html>
<%@include file="footer.jsp"%>