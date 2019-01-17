<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<title>Welcome to student-faculty file sharing portal</title>
<link rel="icon" 
      type="image/png" 
      href="image/title.png">
</head>
<style>
	* {
  font-family: 'open sans';
  
}
#contain {
  height: 300px;  
  overflow-y: scroll;  
}
#table_scroll {
  width: 100%;
  margin-top: 10px;
  margin-bottom: 10px;
}
#table_scroll tbody td {
  padding: 10px;
  background-color: #808080;
  color: #fff;
}
#table_fixed{
	width:100%;
}
#table_fixed thead th {
  padding:10px;
  text-align:center;
  background-color: #2E3644;
  color: #ffffff;
  font-weight: 100;
}

</style>
<body oncontextmenu="return false;">
<%
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
%>
<script>
$(document).ready(function() {
	  
	  pageScroll();
	  $("#contain").mouseover(function() {
	    clearTimeout(my_time);
	  }).mouseout(function() {
	    pageScroll();
	  });
	  
	  getWidthHeader('table_fixed','table_scroll');
	  
	});

	var my_time;
	function pageScroll() {
		var objDiv = document.getElementById("contain");
	  objDiv.scrollTop = objDiv.scrollTop + 1;  
	  if ((objDiv.scrollTop + 100) == objDiv.scrollHeight) {
	    objDiv.scrollTop = 0;
	  }
	  my_time = setTimeout('pageScroll()', 25);
	}

	function getWidthHeader(id_header, id_scroll) {
	  var colCount = 0;
	  $('#' + id_scroll + ' tr:nth-child(1) td').each(function () {
	    if ($(this).attr('colspan')) {
	      colCount += +$(this).attr('colspan');
	    } else {
	      colCount++;
	    }
	  });
	  
	  for(var i = 1; i <= colCount; i++) {
	    var th_width = $('#' + id_scroll + ' > tbody > tr:first-child > td:nth-child(' + i + ')').width();
	    $('#' + id_header + ' > thead th:nth-child(' + i + ')').css('width',th_width + 'px');
	  }
	}
</script>

	<table border="0" id="table_fixed">
    <thead>
      <tr>      
        <th>Published By</th>
        <th>Message</th>
        <th>File</th>
        <th>Time</th>
      </tr>
    </thead>
</table>
<div id="contain">  
  <table border="0" id="table_scroll">
    <tbody>
      <%
	try{ 
		
	conn = DBConnection.createConnection();
	String sql ="SELECT * FROM tbl_sdiscussion order by id";
	pst = conn.prepareStatement(sql);
	rs = pst.executeQuery();
	
	while(rs.next()){
	%>
	<tr>	
	<td align="center" ><%=rs.getString("messageby") %></td>
	<td align="left" style="width: 350px; word-wrap:break-word;"><%=rs.getString("Message") %></td>
	<%
		if(rs.getString("File")!=null && rs.getString("File")!=""){
			%>
			<td align="center" style="color:#ffffff"><center><a href="view_sdiscusion_file.jsp?id=<%out.print(rs.getString("id"));%>"><p style="color:#ffffff">View</p></a></center></td>
			<%
		}else{
			%>
			<td align="center"><center>----</a></center></td>
			<% 
		}
	%>
			
	<td align="center"><%=rs.getString("pub_date") %></td>
	</tr>
	
	<% 
	}
	
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
    </tbody>
  </table>
</div>
</body>
</html>
