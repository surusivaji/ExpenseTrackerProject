<%@page import="org.siva.expensiontracker.model.Expense"%>
<%@page import="java.util.List"%>
<%@page import="org.siva.expensiontracker.model.User"%>
<%@page import="org.siva.expensiontracker.dao.IExpenseDaoImpl"%>
<%@page import="org.siva.expensiontracker.dao.IExpenseDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Expense Tracker - View Expense</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
		<link href="./resources/css/index.css" rel="stylesheet">
		<link href="./resources/css/viewExpense.css" rel="stylesheet">
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
		
			<h1>View Expense</h1>
			
			<%
			String updateStatus = (String) session.getAttribute("updateInfo");
			if (updateStatus!=null) 
			{%>
				<p style="text-align:center;color:green;font-size:18px;font-weight:600"><%= updateStatus%>😎😎😎</p>
			 	<% session.removeAttribute("updateInfo");
			}
			String success = (String) session.getAttribute("deleteSuccess");
			String fail = (String) session.getAttribute("deleteFail");
			if (success!=null)
			{%>
				<p style='color:green;text-align:center;font-size:18px;font-weight:bold;margin-top:10px;'><%= success %>😎😎😎</p>
			<%  session.removeAttribute("deleteSuccess");
			}
			if (fail!=null) 
			{%>
				<p style='color:red;text-align:center;font-size:18px;font-weight:bold;margin-top:10px;'><%= fail %>😡😡😡</p>
			<% session.removeAttribute("deleteFail");
			}
		%>
		
		<table>
			<thead>
				<tr id="thead">
					<th>Title</th>
					<th>Description</th>
					<th>Date</th>
					<th>Time</th>
					<th>Price</th>
					<th colspan="2" align="center">Action</th>
				</tr>
			</thead>
			<%
				IExpenseDao dao = new IExpenseDaoImpl();
				List<Expense> expenses = dao.getExpensesByUser(user);
			%>
			<tbody>
			<%
				for (Expense expense : expenses) 
				{%>
					<tr id="tbody">
						<td><%= expense.getTitle() %></td>
						<td><%= expense.getDescription() %></td>
						<td><%= expense.getDate() %></td>
						<td><%= expense.getTime() %></td>
						<td><%= expense.getPrice() %></td>
						<td><a href="editExpense.jsp?expenseid=<%= expense.getExpenseid()%>"><input type="button" value="Edit" id="edit"></a></td>
						<td><a href="deleteExpense?expenseid=<%=expense.getExpenseid()%>"><input type="button" value="Delete" id="delete"></a></td>
					</tr>	
				<%}
			%>
			</tbody>
		</table>
		
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	</body>
</html>