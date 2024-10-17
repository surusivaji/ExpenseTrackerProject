<%@page import="org.siva.expensiontracker.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Expense Tracker - Display User</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
		<link href="./resources/css/index.css" rel="stylesheet">
		<link href="./resources/css/editUser.css" rel="stylesheet">
	</head>
	<body>
		<%
			User user = (User) session.getAttribute("user");
			if (user==null)
			{
				response.sendRedirect("login.jsp");
			}
		%>
		
		<jsp:include page="./includes/homenavbar.jsp"/>
		
		<div class="user-container">
			<h3>PROFILE</h3>
			<div class="profile-card">
				<img alt="profile" src="./resources/media/images/profile.png">
			</div>
			
			<form action="updateUser" method="post">
				<div class="info-container">
					<div class="input-control">
						<input type="text" id="userid" name="userid" value="<%=user.getUserid()%>" hidden="true">
						<label for="fullName">FullName</label>
						<input type="text" id="fullName" name="fullName" value="<%=user.getFullName()%>" required>
					</div>
					<div class="input-control">
						<label for="mobileNumber">MobileNumber</label>
						<input type="text" id="mobileNumber" name="mobileNumber" value="<%=user.getMobileNumber()%>" required>
					</div>
					<div class="input-control">
						<label for="email">Email</label>
						<input type="text" id="email" name="email" value="<%=user.getEmail()%>" required>
					</div>
				</div>
				
				<div class="info-container">
					<div class="input-control">
						<label for="password">Password</label>
						<input type="text" id="password" name="password" value="<%=user.getPassword()%>" required>
					</div>
					<div class="input-control">
						<label for="about">About</label>
						<input type="text" id="about" name="about" value="<%=user.getAbout()%>" required>
					</div>
					<div class="button-control">
						<input type="submit" value="Update" id="update">
						<a href="editUser.jsp"><input type="button" value="Cancel" id="cancel"></a>
					</div>
				</div>
			</form>
		</div>
		<%
			String isUpdate = (String) session.getAttribute("userUpationFail");
			if (isUpdate!=null) 
			{%>
				<p style="color:red;text-align:center;font-size:18px;font-weight:bold;margin-top:10px;"><%=isUpdate%>😡😡😡</p>
			<%	session.removeAttribute("userUpationFail");
			}
		%>
	</body>
</html>