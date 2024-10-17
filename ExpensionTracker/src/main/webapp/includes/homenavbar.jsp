<%@page import="org.siva.expensiontracker.model.User"%>
<%
	User user = (User) session.getAttribute("user");
	if (user==null) 
	{
		response.sendRedirect("login.jsp");
	}
	else 
	{%>
		<div class="navbar">
		<div class="logo">
			<span><i class="fa-solid fa-money-check"></i>Expense Tracker</span>
		 	<a href="home.jsp"><i class="fa-solid fa-house"></i>Home</a>
		 	<a href="addExpense.jsp"><i class="fa-solid fa-plus"></i>Add Expense</a>
		 	<a href="viewExpense.jsp"><i class="fa-solid fa-list"></i>View Expense</a>
		</div>
		<div class="buttons">
			<a href="displayUser.jsp"><i class="fa-solid fa-user"></i><%= user.getFullName() %></a>
			<a href="logout"><i class="fa-solid fa-right-to-bracket"></i>Logout</a>
		</div>
	</div>
	<%}
%>
