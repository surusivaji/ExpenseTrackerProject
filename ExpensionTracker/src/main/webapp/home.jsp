<%@page import="org.siva.expensiontracker.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Expense Tracker - Home</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
		<link href="./resources/css/index.css" rel="stylesheet">
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
		
		<div id="demo" class="carousel slide" data-bs-ride="carousel">
  			<!-- Indicators/dots -->
  			<div class="carousel-indicators">
    			<button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
    			<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
   		 		<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
  			</div>
  			<!-- The slideshow/carousel -->
  			<div class="carousel-inner">
    			<div class="carousel-item active">
      				<img src="./resources/media/images/expense-2.jpg" alt="Los Angeles" class="d-block" style="width:100%;" height="625px">
    			</div>
    			<div class="carousel-item">
      				<img src="./resources/media/images/expense-1.jpg" class="d-block" style="width:100%" height="625px">
    			</div>
    			<div class="carousel-item">
      				<img src="./resources/media/images/expense-3.jpg" alt="New York" class="d-block" style="width:100%" height="625px">
    			</div>
  			</div>
  			<!-- Left and right controls/icons -->
  			<button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
    			<span class="carousel-control-prev-icon"></span>
  			</button>
  			<button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
    			<span class="carousel-control-next-icon"></span>
  			</button>
		</div>

		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	</body>
</html>