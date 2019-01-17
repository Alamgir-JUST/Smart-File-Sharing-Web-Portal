<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%
	String idd = request.getParameter("id");
	int no = Integer.parseInt(idd);
	Connection conn = DBConnection.createConnection();
	Statement st =conn.createStatement();
	st.executeUpdate("delete from tbl_books where Books_Id='"+no+"'");
	out.println("Books Deteted!!!!");
	response.sendRedirect("Books_view.jsp");
	
%>
	
