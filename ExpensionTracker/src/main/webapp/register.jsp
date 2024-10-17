<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Expense Tracker - Register</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
		<link href="./resources/css/index.css" rel="stylesheet">
		<link href="./resources/css/register.css" rel="stylesheet">
	<body>
		<jsp:include page="./includes/navbar.jsp"></jsp:include>
		
		<div class="form-container">
			<h1>Registration</h1>
			<form action="userRegistration" method="post">
				<div class="input-control">
					<label for="fullName">Full Name</label>
					<input type="text" id="fullName" name="fullName" autocomplete="off" required>
				</div>
				<div class="input-control">
					<label for="email">Email</label>
					<input type="text" id="email" name="email" autocomplete="off" required>
				</div>
				<div class="input-control">
					<label for="password">Password</label>
					<input type="text" id="password" name="password" autocomplete="off" required>
				</div>
				<div class="input-control">
					<label for="mobileNumber">Mobile Number</label>
					<input type="text" id="mobileNumber" name="mobileNumber" autocomplete="off" required>
				</div>
				<div class="input-control">
					<label for="about">About</label>
					<input type="text" id="email" name="about" autocomplete="off" required>
				</div>
				<div class="button-control">
					<input type="submit" value="Register">
					<span>I have an account? <a href="login.jsp">Login</a></span>
				</div>
			</form>
		</div>
		
		<%
			String success = (String) session.getAttribute("msgSuccess");
			String fail = (String) session.getAttribute("msgFail");
			if (success!=null)
			{%>
				<p style='color:green;text-align:center;font-size:18px;font-weight:bold;margin-top:5px;'><%= success %>😎😎😎</p>
			<%  session.removeAttribute("msgSuccess");
			}
			if (fail!=null) 
			{%>
				<p style='color:red;text-align:center;font-size:18px;font-weight:bold;margin-top:5px;'><%= fail %>😡😡😡</p>
			<% session.removeAttribute("msgFail");
			}
		%>
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	</body>
</html>