<%@page import="controller.databaseConnection.DatabaseConnect"%>
<%@ page import="controller.statemanagement.*"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<head>

<meta name="viewpoint" content="width=device-width,initial-scale=1.0">

<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<title>Samrtphone website</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/navbar.css"
	type="text/css" media="all"/>

<script src="https://kit.fontawesome.com/31e4361ee7.js"></script>

</head>

<body>


	<nav class="Navigation">

		<a href="${pageContext.request.contextPath}/pages/index.jsp"
			class="logo">F.T.</a> <input type="checkbox" class="Menu-btn"
			id="Menu-btn"> <label for="Menu-btn" class="Menu-icon">
			<span class="nav-icon"> <i class="fa-solid fa-house"></i>

		</span>

		</label>

		<ul class="Menu">

			<li><a href="${pageContext.request.contextPath}/pages/index.jsp"
				class="active">Home</a></li>

			<li><a
				href="${pageContext.request.contextPath}/pages/products.jsp">Product</a></li>

		</ul>

		<div class="right-elements">
		
			<a href="register.jsp" class="user"> <i class="fa-solid fa-user"></i>

			</a>

		</div>

	</nav>

</body>

