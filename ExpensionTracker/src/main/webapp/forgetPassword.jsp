<%@page import="org.siva.expensiontracker.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Expense Tracker - Forget Password</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
		<link href="./resources/css/index.css" rel="stylesheet">
		<link href="./resources/css/login.css" rel="stylesheet">
		<link href="./resources/css/forgetPassword.css" rel="stylesheet">
	</head>
	<body>
		<jsp:include page="./includes/navbar.jsp"></jsp:include>
		
		<div class="form-container">
			<h1>Forget Password</h1>
			<form action="Next" method="post">
				<div class="input-control">
					<label for="email">Email</label>
					<input type="text" id="email" name="email" autocomplete="off" required>
				</div>
				<div class="input-control">
					<label for="mobileNumber">Mobile Number</label>
					<input type="text" id="mobileNumber" name="mobileNumber" autocomplete="off" required>
				</div>
				<div class="button-control">
					<input type="submit" value="Next">
				</div>
			</form>
		</div>
		
		<%
			String isError = (String) session.getAttribute("mailError");
			if (isError!=null) 
			{%>
				<p style="color:red;text-align:center;font-size:18px;font-weight:bold;margin-top:10px;"><%=isError%>😡😡😡</p>
				<% session.removeAttribute("mailError");
			}				
		%>
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	</body>
</html>