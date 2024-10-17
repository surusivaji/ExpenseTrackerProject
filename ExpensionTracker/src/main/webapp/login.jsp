<%@page import="org.siva.expensiontracker.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Expense Tracker - Login</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
		<link href="./resources/css/index.css" rel="stylesheet">
		<link href="./resources/css/login.css" rel="stylesheet">
	</head>
	<body>
		<jsp:include page="./includes/navbar.jsp"></jsp:include>
		
		<%
			String passwordSuccess = (String) session.getAttribute("passwordSuccess");
			if (passwordSuccess!=null) 
			{%>
				<p style="color:green;text-align:center;font-size:18px;font-weight:bold;position:relative;top:120px;"><%=passwordSuccess%>😎😎😎</p>
				<% session.removeAttribute("passwordSuccess");
			}
		%>
		
		<%
			String isDelete = (String) session.getAttribute("userDeleteSuccess");
			if (isDelete!=null)
			{%>
				<p style="color:green;text-align:center;font-size:18px;font-weight:bold;position:relative;top:120px;"><%=isDelete%>😡😡😡</p>
			<% session.removeAttribute("userDeleteSuccess");
			}
		%>
		
		<div class="form-container">
			<h1>Login</h1>
			<form action="login" method="post">
				<div class="input-control">
					<label for="email">Email</label>
					<input type="text" id="email" name="email" autocomplete="off" required>
				</div>
				<div class="input-control">
					<label for="password">Password</label>
					<input type="password" id="password" name="password" autocomplete="off" required>
					<a href="forgetPassword.jsp">forget password</a>
				</div>
				<div class="button-control">
					<input type="submit" value="Login">
					<span>I don't have an account? <a href="register.jsp">Create Account</a></span>
				</div>
			</form>
		</div>
		<%
			String loginInfo = (String) session.getAttribute("loginInfo");
			if (loginInfo!=null) 
			{%>
				<p style="color:red;text-align:center;font-size:18px;font-weight:bold;margin-top:10px;"><%=loginInfo%>😡😡😡</p>
			<% session.removeAttribute("loginInfo");
			}
			String logoutInfo = (String) session.getAttribute("logoutInfo");
			if (logoutInfo!=null) 
			{%>
				<p style="color:red;text-align:center;font-size:18px;font-weight:bold;margin-top:10px;"><%=logoutInfo%>✌️✌️✌️</p>
			<% session.removeAttribute("logoutInfo");
			} 
		%>
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	</body>
</html>