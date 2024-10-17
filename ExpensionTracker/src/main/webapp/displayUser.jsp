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
		<link href="./resources/css/displayUser.css" rel="stylesheet">
	</head>
	<body>
		<%
			User user = (User) session.getAttribute("user");
			if (user==null) 
			{
				response.sendRedirect("login.jsp");
			}
		%>
		<jsp:include page="./includes/homenavbar.jsp"></jsp:include>
		
		<%
			String isUpdate = (String) session.getAttribute("userUpdationSuccess");
			if (isUpdate!=null) 
			{%>
				<p style="color:green;text-align:center;font-size:18px;font-weight:bold;position:relative;top:87px;"><%=isUpdate%>✌️✌️✌️</p>
			<%	 
			session.removeAttribute("userUpdationSuccess");
			}
		%>
		
		<%
			String isDelete = (String) session.getAttribute("userDeleteFail");
			if (isDelete!=null)
			{%>
				<p style="color:red;text-align:center;font-size:18px;font-weight:bold;position:relative;top:87px;"><%=isDelete%>😡😡😡</p>
			<% session.removeAttribute("userDeleteFail");
			}
		%>
		
		<div class="user-container">
		
			<h3>PROFILE</h3>
			<div class="profile-card">
				<img alt="profile" src="./resources/media/images/profile.png">
			</div>
			
			<div class="user-info">
				<div class="info-container">
					<div class="input-control">
						<label for="fullName">FullName</label>
						<input type="text" id="fullName" name="fullName" value="<%=user.getFullName()%>" disabled="disabled">
					</div>
					<div class="input-control">
						<label for="mobileNumber">MobileNumber</label>
						<input type="text" id="mobileNumber" name="mobileNumber" value="<%=user.getMobileNumber()%>" disabled="disabled">
					</div>
					<div class="input-control">
						<label for="email">Email</label>
						<input type="text" id="email" name="email" value="<%=user.getEmail()%>" disabled="disabled">
					</div>
				</div>
				<div class="info-container">
					<div class="input-control">
						<label for="password">Password</label>
						<input type="text" id="password" name="password" value="<%=user.getPassword()%>" disabled="disabled">
					</div>
					<div class="input-control">
						<label for="about">About</label>
						<input type="text" id="about" name="about" value="<%=user.getAbout()%>" disabled="disabled">
					</div>
					<div class="button-control">
						<a href="editUser.jsp"><input type="submit" value="Edit Account" id="edit"></a>
						<a href="deleteUser?userid=<%= user.getUserid()%>"><input type="submit" value="Delete Account" id="delete"></a>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>