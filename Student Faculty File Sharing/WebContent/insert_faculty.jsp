<%@page import="com.model.adminloginmodel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    	<link rel="stylesheet" typw="text/css" href="css/mycss.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
        <title>Welcome to student-faculty file sharing portal</title>
        <link rel="icon" 
      type="image/png" 
      href="image/title.png">
    </head>
    <style>
    	.formsection{
    	`margin-top:500px;
    	}
    	hr.style13 {
		height: 10px;
		border: 0;
		box-shadow: 0 10px 10px -10px #8c8b8b inset;
    	
    	}
    	..main p{
	font-family: "Times New Roman", Times, serif;
	font-size:20px;
}
    </style>
    <%@include file="facultyheader/header.jsp" %>
    <body oncontextmenu="return false;">
    	<div class="formsection">
    	<div class="starting">
    		<h2>Update Your Profile with your Information</h2>
    		<hr class="style13">
    	</div>
    	<div class="main">
        <form action="FileUploadServlet" method="post" enctype="multipart/form-data">
            <table align="center">
                <tr>
                    <td><p>Name</p></td>
                    <td><p> : </p></td>
                    <td><input type="text" name="name" value="<%=adminloginmodel.getUsername()%>" required/></td>
                </tr>
                <tr>
                    <td><p>Password</p></td>
                    <td><p> : </p></td>
                    <td><input type="password" name="password" required/></td>
                </tr>
                <tr>
                    <td><p>Department</p></td>
                    <td><p> : </p></td>
                    <td><input type="text" name="department" placeholder="Enter your Department--" required/></td>
                </tr>
                <tr>
                    <td><p>University</p></td>
                    <td><p> : </p></td>
                    <td><input type="text" name="university" placeholder="Enter your University--" required/></td>
                </tr>
                <tr>
                    <td><p>Designation</p></td>
                    <td><p> : </p></td>
                    <td><input type="text" name="designation" placeholder="Enter your Post---" required/></td>
                </tr>
                <tr>
                    <td><p>Website</p></td>
                    <td><p> : </p></td>
                    <td><input type="text" name="website" placeholder="your Web Link--" required/></td>
                </tr>
                <tr>
                    <td><p>Twitter</p></td>
                    <td><p> : </p></td>
                    <td><input type="text" name="twitter" placeholder="Your Twitter Link--" required/></td>
                </tr>
                <tr>
                    <td><p>Linkedin</p></td>
                    <td><p> : </p></td>
                    <td><input type="text" name="linkedin" placeholder="Your Linkedin Link--" required/></td>
                </tr>
                <tr>
                    <td><p>Facebook</p></td>
                    <td><p> : </p></td>
                    <td><input type="text" name="facebook" placeholder="Your facebook Link--" required/></td>
                </tr>
                <tr>
                    <td><p>Picture</p></td>
                    <td><p> : </p></td>
                    <td><input type="file" name="picture" placeholder="Your Twitter Link--" required/></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><input type="submit" value="Submit"></td>
                </tr>
            </table>

        </form><br>
        </div>
    </div>
</body>
</html>
<%@include file="footer.jsp"%>