<%@page import="org.siva.expensiontracker.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Expense Tracker - Add Expense</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
		<link href="./resources/css/index.css" rel="stylesheet">
		<link href="./resources/css/addExpense.css" rel="stylesheet">
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
		
		<div class="form-container">
			<h1>Add Expense</h1>
			<form action="addExpense" method="post">
				<div class="input-control">
					<label for="title">Title</label>
					<input type="text" id="title" name="title" autocomplete="off" required>
				</div>
				<div class="input-control">
					<label for="date">Date</label>
					<input type="date" id="date" name="date" autocomplete="off" required>
				</div>
				<div class="input-control">
					<label for="time">Time</label>
					<input type="time" id="time" name="time" autocomplete="off" required>
				</div>
				<div class="input-control">
					<label for="description">Description</label>
					<input type="text" id="description" name="description" autocomplete="off" required>
				</div>
				<div class="input-control">
					<label for="price">Price</label>
					<input type="text" id="price" name="price" autocomplete="off" required>
				</div>
				<div class="button-control">
					<input type="submit" value="Add">
				</div>
			</form>
		</div>
		
		<%
			String success = (String) session.getAttribute("addSuccess");
			String fail = (String) session.getAttribute("addFail");
			if (success!=null)
			{%>
				<p style='color:green;text-align:center;font-size:18px;font-weight:bold;margin-top:10px;'><%= success %>😎😎😎</p>
			<%  session.removeAttribute("addSuccess");
			}
			if (fail!=null) 
			{%>
				<p style='color:red;text-align:center;font-size:18px;font-weight:bold;margin-top:10px;'><%= fail %>😡😡😡</p>
			<% session.removeAttribute("addFail");
			}
		%>
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	</body>
</html>