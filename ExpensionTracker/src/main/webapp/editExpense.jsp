<%@page import="org.siva.expensiontracker.model.Expense"%>
<%@page import="org.siva.expensiontracker.dao.IExpenseDaoImpl"%>
<%@page import="org.siva.expensiontracker.dao.IExpenseDao"%>
<%@page import="org.siva.expensiontracker.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Expense Tracker - Edit Expense</title>
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
		
		<%
			String tempid = request.getParameter("expenseid");
			int expenseid = Integer.parseInt(tempid);
			IExpenseDao dao = new IExpenseDaoImpl();
			Expense expense = dao.getExpenseByExpenseId(expenseid);
		%>
		
		<div class="form-container">
			<h1>Edit Expense</h1>
			<form action="updateExpense" method="post">
				<input type="text" name="expenseid" value="<%=expense.getExpenseid()%>" hidden="true">
				<div class="input-control">
					<label for="title">Title</label>
					<input type="text" id="title" name="title" value="<%=expense.getTitle()%>" required>
				</div>
				<div class="input-control">
					<label for="date">Date</label>
					<input type="date" id="date" name="date" value="<%=expense.getDate()%>" required>
				</div>
				<div class="input-control">
					<label for="time">Time</label>
					<input type="time" id="time" name="time" value="<%=expense.getTime()%>" required>
				</div>
				<div class="input-control">
					<label for="description">Description</label>
					<input type="text" id="description" name="description" value="<%=expense.getDescription()%>" required>
				</div>
				<div class="input-control">
					<label for="price">Price</label>
					<input type="text" id="price" name="price" value="<%=expense.getPrice()%>" required>
				</div>
				<div class="button-control">
					<input type="submit" value="Update">
				</div>
			</form>
		</div>
		
		<%
			String updateStatus = (String) session.getAttribute("updateError");
			if (updateStatus!=null) 
			{%>
				<p style="text-align:center;color:red;font-size:20px;font-weight:600"><%= updateStatus%></p>
			<%}
		%>
		
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	</body>
</html>