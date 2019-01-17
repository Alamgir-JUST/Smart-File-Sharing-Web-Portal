<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.OutputStream"%>
<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Blob"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to student-faculty file sharing</title>
<link rel="icon" 
      type="image/png" 
      href="image/title.png">
      <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
</head>
<body oncontextmenu="return false;">
	<%  	
			Connection conn = null;
			Statement st = null;
			ResultSet rs = null;
            String id=request.getParameter("Notice_Id");
            
            Blob file = null;
            byte[ ] fileData = null ;

            try
            {    
                conn = DBConnection.createConnection();
            
                String sqlString = "SELECT Notice_File FROM tbl_notice WHERE Notice_Id = '"+id+"'";
                st = conn.createStatement();
                
                rs=st.executeQuery(sqlString);
                
                if (rs.next()) 
                {
                    file = rs.getBlob("Notice_File");
                    fileData = file.getBytes(1,(int)file.length());
                } else 
                {
                    out.println("file not found!");
                    return;
                }
                
                response.setContentType("application/pdf");
                response.setHeader("Content-Disposition", "inline");
                response.setContentLength(fileData.length);
                
                OutputStream output = response.getOutputStream();
                output.write(fileData);
                
                output.flush();
                
            } catch (SQLException ex) 
             {
            	Logger.getLogger(Logger.class.getName()).log(Level.SEVERE, null, ex);} 
        %>
</body>
</html>