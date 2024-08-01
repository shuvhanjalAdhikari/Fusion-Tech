<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css" type="text/css" media="all" />
</head>
<body>
	<nav class="Navigation">

		<a href="${pageContext.request.contextPath}/pages/userindex.jsp" class="logo">F.T.</a> <input type="checkbox"
			class="Menu-btn" id="Menu-btn"> <label for="Menu-btn"
			class="Menu-icon"> <span class="nav-icon"> <i
				class="fa-solid fa-house"></i>

		</span>

		</label>

		<ul class="Menu">

			<li><a href="${pageContext.request.contextPath}/pages/userindex.jsp"
				class="active">Home</a></li>

			<li><a
				href="${pageContext.request.contextPath}/pages/userproduct.jsp">Product</a></li>

			<li><a href="${pageContext.request.contextPath}/pages/yourproducts.jsp">Your Products</a></li>
			<li><a href="${pageContext.request.contextPath}/pages/yourproducts.jsp">About Us</a></li>

		</ul>

		<div class="right-elements">

			
			<a href="${pageContext.request.contextPath}/pages/cart.jsp" class="cart"> <i class="fa-solid fa-cart-shopping"></i>

			</a> <a href="userprofile.jsp" class="user"> <i
				class="fa-solid fa-user"></i>

			</a>

		</div>

	</nav>
</body>
</html>