<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<meta name="viewpoint" content="width=device-width,initial-scale=1.0">
<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<title>Fusion Tech Products</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/products.css"
	type="text/css" />
<script src="https://kit.fontawesome.com/31e4361ee7.js"></script>
</head>
<body>
	<sql:setDataSource var="dbConnection" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/fusiontech" user="root" password="" />

	<sql:query dataSource="${dbConnection}" var="products">
    SELECT * FROM product p
    <c:if test="${not empty param.category}">
        WHERE p.category_id = '${param.category}'
        <c:if test="${not empty param.price}">AND</c:if>
		</c:if>
		<c:if test="${empty param.category and not empty param.price}">
        WHERE
    </c:if>
		<c:if test="${not empty param.price}">
        p.price <= ${Integer.parseInt(param.price)}
    </c:if>
		<c:if test="${not empty param.rating}">
			<c:choose>
				<c:when test="${empty param.category and empty param.price}">WHERE</c:when>
				<c:otherwise>AND</c:otherwise>
			</c:choose>
        p.rating >= ${param.rating}
    </c:if>
	</sql:query>
	
	<%@ include file="navbar.jsp"%>

	<section id="search" class="featureproduct">

		<form method="get" action="" class="filter-form">
			<label for="category" class="filter-label">Category:</label> <select
				id="category" name="category">
				<option value="">All Categories</option>
				<option value="1">Iphone</option>
				<option value="2">Samsung</option>
				<option value="3">One Plus</option>
				<option value="4">Huawei</option>
			</select> <label for="price" class="filter-label">Price:</label> <input
				type="text" id="price" name="price" class="filter-input"
				placeholder="Enter maximum price"> <label for="rating"
				class="filter-label">Rating:</label> <select id="rating"
				name="rating">
				<option value="">All Ratings</option>
				<option value="5">5 Stars</option>
				<option value="4">4 Stars and Up</option>
				<option value="3">3 Stars and Up</option>
				<option value="2">2 Stars and Up</option>
				<option value="1">1 Star and Up</option>
			</select>

			<button type="submit" class="filter-button">Search</button>
		</form>

	</section>


	<section id="suit" class="featureproduct">
		<div class="featureproductcontainer">
			<c:forEach var="product" items="${products.rows}">
				<div class="featureproductbox">
					<div class="productfeatureimg">
						<img src="http://localhost:8081/Fusion Tech/images/${product.product_img}"
							alt="" />
					</div>
					<div class="productfeaturetextcontainer">
						<div class="productfeaturetext">
							<strong>${product.product_name}</strong> <span>$${product.price}.00</span>
						</div>
						<div class="cart-like">
							<a href="${pageContext.request.contextPath}/pages/login.jsp"><i class="fa-solid fa-cart-shopping"></i></a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>

<%@ include file="footer.jsp"%>

</body>
</html>
