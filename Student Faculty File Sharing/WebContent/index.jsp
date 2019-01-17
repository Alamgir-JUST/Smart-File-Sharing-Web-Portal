<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Welcome to Student-Faculty file sharing Portal</title>
	<link rel="icon" 
      type="image/png" 
      href="image/title.png">
      
<style>
body, html {
    height: 100%;
    margin: 0;
}

.bg {
    /* The image used */
    background-image: url("image/cover.png");

    /* Full height */
    height: 100%; 

    /* Center and scale the image nicely */
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
}
.menu{
	margin-left:40%;
	font-size:30px;
}
.menu button{
	height:150px;
	width:150px;
	margin-top:55%;
	
}
.menu p{
	font-size:30px;
	font-family: "Times New Roman", Times, serif;
}

</style>

</head>
<body oncontextmenu="return false;">

<div class="bg">
	<div class="menu">
		<a href="facultylogin.jsp">
          <button class="w3-button w3-xlarge w3-circle w3-black"><p>Faculty</p></button>
          </a>
          <a href="index1.jsp">
  		  <button class="w3-button w3-xlarge w3-circle w3-teal"><p>Student</p></button>
  		  </a>
     </div>
</div>
</body>
</html>
