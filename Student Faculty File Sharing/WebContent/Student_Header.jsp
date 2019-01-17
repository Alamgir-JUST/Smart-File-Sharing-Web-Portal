<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel = "stylesheet" type="text/css" href="css/main.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<title>Welcome to Student-Faculty file sharing center</title>
</head>
<body oncontextmenu="return false;">
	<div class="main">
		<div class="imagepart">
			<img src="image/stbanner.png">
		</div>
		<div class="menu">
			<ul>
				<li><a href="student_index.jsp">Home</a></li>
				<li><a href="student_books.jsp">Books</a></li>
				<li><a href="student_notice.jsp">Notice</a></li>
				<li><a href="#">Result</a>
					<ul>
						<li><a href="student_results.jsp">Academic </a></li>
						<li><a href="before_result.jsp">Online</a></li>						
					</ul>
				</li>
				<li><a href="student_discussion.jsp">Student Discussion</a></li>
				<li><a href="http://localhost:8080/OnlineExam/BeforeExam.jsp">Online Exam</a>
					
				</li>
				<li><a href="EmailForm.jsp">Mail to Faculty</a></li>	
				<li><a href="facultyprofile.jsp">Faculty Members</a></li>			
				<li><a href="logout.jsp">Logout</a></li>
			</ul>
		 </div>
	</div>
</body>
</html>