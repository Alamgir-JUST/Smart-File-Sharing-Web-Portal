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
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<title>Your profile</title>
<link rel="icon" 
      type="image/png" 
      href="image/title.png">
</head>
<style>
	.footersec{
		margin-top:50px;
	}
	.profilesec{
		margin-top:10px;
	}
</style>
<%@include file="facultyheader/header.jsp" %>
<body oncontextmenu="return false;">
<div class="profilesec">
	<%@include file="fsprofile.jsp" %>
</div>
<div class="footersec">
<%@include file="footer.jsp" %>
</div>
</body>
</html>
