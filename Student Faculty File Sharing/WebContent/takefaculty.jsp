<%@page import="java.util.ArrayList"%>
<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert Faculty Members</title>
<link rel="icon" 
      type="image/png" 
      href="image/title.png">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
</head>
<body oncontextmenu="return false;">
<%
	ArrayList<Integer> myList = new ArrayList<Integer>();
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	int size=0;
	
	try{
		conn = DBConnection.createConnection();
		String sql = "select * from tbl_faculty";
		pst = conn.prepareStatement(sql);
		rs = pst.executeQuery();
		while(rs.next()){
			myList.add(rs.getInt("id"));
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>



</body>
</html>