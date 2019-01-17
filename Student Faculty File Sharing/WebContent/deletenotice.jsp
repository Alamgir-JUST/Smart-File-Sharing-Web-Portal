<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%
	String idd = request.getParameter("id");
	int no = Integer.parseInt(idd);
	Connection conn = DBConnection.createConnection();
	Statement st =conn.createStatement();
	st.executeUpdate("delete from tbl_notice where Notice_Id='"+no+"'");
	out.println("Notice Deteted!!!!");
	response.sendRedirect("Notice_view.jsp");
	
%>
	
