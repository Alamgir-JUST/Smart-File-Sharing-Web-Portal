<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Faculty Panel - Student Faculty file sharing </title>
</head>
<style>
/*
	Main menu----------
*/
.menu{background:#2e3644;min-height: 53px;font-family: "Times New Roman", Times, serif;}
.menu ul{margin:0;padding: 0;list-style: none}
.menu ul li{float: left;border-left: 1px solid #34B98B;border-right: 1px solid #B5D46;position: relative;}
.menu ul li:first-child{border-left: 0px solid}
.menu ul li:last-child{border-right: 0px solid}
.menu ul li a{color:#fff;display: block;padding: 15px}
.menu ul li a:hover{background: #1B5D46}

.menu ul li ul{position: absolute;left: -999999px}
.menu ul li:hover ul{left: 0px}
.menu ul li ul{background: #fff}
.menu ul li ul li{float:none;width: 250px;border-bottom: 1px solid #37c594;border-right: 0px solid}
.menu ul li ul li:last-child{border-bottom: : 0px solid #37c594}
.menu ul li ul li a{background:#2D9F77;color: #fff; padding:5px 15px}
.menu ul li ul li a:hover{}
.imagepart{

}
.imagepart img{
	width:100%;
	height: auto;
}

</style>
<body>
	<div class="main">
		<div class="imagepart">
			<img src="image/fbanner.png">
		</div>
		<div class="menu">
			<ul>
				<li><a href="facultyindex.jsp">Home</a></li>
				<li><a href="Upload_Books.jsp">Upload Books</a></li>
				<li><a href="Upload_Notice.jsp">Upload Notice</a></li>
				<li><a href="Upload_Result.jsp">Upload Result</a></li>
				
				<li><a href="#">Update</a>
					<ul>
						<li><a href="addques.jsp">Add Ques</a></li>
						<li><a href="insert_faculty.jsp">Update Profile</a></li>
					</ul>
				
				</li>
				
				<li><a href="#">Reports</a>
					<ul>
						<li><a href="Books_view.jsp">View Books</a></li>
						<li><a href="queslist.jsp">View Questions</a></li>
						<li><a href="Notice_view.jsp">View Notice</a></li>
						<li><a href="Result_view.jsp">View Results</a></li>						
					</ul>
				</li>
				<li><a href="admin_discussion.jsp">Admin Discussion</a></li>		
				<li><a href="#">Manage Students</a>
					<ul>
						<li><a href="student_manage.jsp">View Students</a></li>
						<li><a href="usermessageshow.jsp">Students Message</a></li>	
					</ul>
				</li>		
				<li><a href="faculty_single_profile.jsp">Profile</a></li>
					
				<li><a href="logout.jsp">Logout</a></li>
			</ul>
		 </div>
	</div>
</body>
</html>