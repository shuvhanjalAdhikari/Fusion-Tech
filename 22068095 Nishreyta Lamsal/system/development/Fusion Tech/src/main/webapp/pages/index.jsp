<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>	
	
<!DOCTYPE html>

<html>

<head>

<meta name="viewpoint" content="width=device-width,initial-scale=1.0">

<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<title>Fusion Tech</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css" type="text/css" media="all" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/products.css" type="text/css" media="all" />

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
	
	<section id="main"> 
		<div class="main-content">
			<div class="main-text">
				<span>Collections</span>

				<h1>The Best Selling Smartphones</h1>

				<p>Place your order now.</p>

				<a href="${pageContext.request.contextPath}/pages/products.jsp">Shop now</a>

			</div>

			<div class="main-img">

				<img src="${pageContext.request.contextPath}/images/lol.png" alt="" />

			</div>

		</div>

	</section>

	<section id="categories">

		<h2>categories</h2>

		<div class="category-container">

			<a href="index.jsp#Huawei" class="category-box"> <img src="${pageContext.request.contextPath}/images/5.webp"
				alt="category" /> <span>Huawei</span>

			</a> <a href="index.jsp#One Plus" class="category-box"> <img src="${pageContext.request.contextPath}/images/7.png"
				alt="category" /> <span>One Plus</span>

			</a> <a href="index.jsp#Samsung" class="category-box"> <img src="${pageContext.request.contextPath}/images/1.png"
				alt="category" /> <span>Samsung</span>

			</a> <a href="index.jsp#Iphone" class="category-box"> <img src="${pageContext.request.contextPath}/images/4.png"
				alt="category" /> <span>Iphone</span>

			</a>

		</div>

	</section>
	
		<section id="search" class="featureproduct" style="margin-bottom: 100px; margin-top: 50px;">

		<form method="get" action="" class="filter-form">
			<label for="category" class="filter-label">Category:</label> <select
				id="category" name="category">
				<option value="">All Categories</option>
				<option value="1">Iphone</option>
				<option value="2">Huawei</option>
				<option value="3">Samsung</option>
				<option value="4">One Plus</option>
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
	
	<section id="Iphone" class="feature-product">

		<h2>Iphone</h2>

		<div class="feature-product-container">

			<div class="feature-product-box">

				<div class="product-feature-img">

					<img src="${pageContext.request.contextPath}/images/phone1.png" alt="" />

				</div>

				<div class="product-feature-text-container">

					<div class="product-feature-text">

						<strong>Iphone 13</strong> <span>$350.00</span>

					</div>

					<div class="cart-like">

						<a href="#"><i class="fa-solid fa-cart-shopping"></i></a>

					</div>

				</div>

			</div>

			<div class="feature-product-box">

				<div class="product-feature-img">

					<img src="${pageContext.request.contextPath}/images/phone10.png" alt="" />

				</div>

				<div class="product-feature-text-container">

					<div class="product-feature-text">

						<strong>Iphone 15 pro</strong> <span>$300.00</span>

					</div>

					<div class="cart-like">

						<a href="#"><i class="fa-solid fa-cart-shopping"></i></a> 

					</div>

				</div>

			</div>

			<div class="feature-product-box">

				<div class="product-feature-img">

					<img src="${pageContext.request.contextPath}/images/phone3.png" alt="" />

				</div>

				<div class="product-feature-text-container">

					<div class="product-feature-text">

						<strong>Iphone 14</strong> <span>$425.00</span>

					</div>

					<div class="cart-like">

						<a href="#"><i class="fa-solid fa-cart-shopping"></i></a> 

					</div>

				</div>

			</div>

			<div class="feature-product-box">

				<div class="product-feature-img">

					<img src="${pageContext.request.contextPath}/images/phone11.png" alt="" />

				</div>

				<div class="product-feature-text-container">

					<div class="product-feature-text">

						<strong>iPhone 12</strong> <span>$295.00</span>

					</div>

					<div class="cart-like">

						<a href="#"><i class="fa-solid fa-cart-shopping"></i></a> 

					</div>

				</div>

			</div>

		</div>

	</section>

	<section id="Huawei" class="feature-product">

		<h2>Huawei</h2>

		<div class="feature-product-container">

			<div class="feature-product-box">

				<div class="product-feature-img">

					<img src="${pageContext.request.contextPath}/images/phone6.png" alt="" />

				</div>

				<div class="product-feature-text-container">

					<div class="product-feature-text">

						<strong>Huawei Nova 11</strong> <span>$350.00</span>

					</div>

					<div class="cart-like">

						<a href="#"><i class="fa-solid fa-cart-shopping"></i></a> 
					</div>

				</div>

			</div>

			<div class="feature-product-box">

				<div class="product-feature-img">

					<img src="${pageContext.request.contextPath}/images/phone7.png" alt="" />

				</div>

				<div class="product-feature-text-container">

					<div class="product-feature-text">

						<strong>Huawei P60 pro</strong> <span>$350.00</span>

					</div>

					<div class="cart-like">

						<a href="#"><i class="fa-solid fa-cart-shopping"></i></a> 

					</div>

				</div>

			</div>

			<div class="feature-product-box">

				<div class="product-feature-img">

					<img src="${pageContext.request.contextPath}/images/phone12.png" alt="" />

				</div>

				<div class="product-feature-text-container">

					<div class="product-feature-text">

						<strong>Huawei Mate X3 </strong> <span>$350.00</span>

					</div>

					<div class="cart-like">

						<a href="#"><i class="fa-solid fa-cart-shopping"></i></a> 

					</div>

				</div>

			</div>

			<div class="feature-product-box">

				<div class="product-feature-img">

					<img src="${pageContext.request.contextPath}/images/phone13.png" alt="" />

				</div>

				<div class="product-feature-text-container">

					<div class="product-feature-text">

						<strong>Huawei P50 Pocket </strong> <span>$350.00</span>

					</div>

					<div class="cart-like">

						<a href="#"><i class="fa-solid fa-cart-shopping"></i></a> 

					</div>

				</div>

			</div>

		</div>

	</section>

	<section id="One Plus" class="feature-product">

		<h2>One Plus</h2>

		<div class="feature-product-container">

			<div class="feature-product-box">

				<div class="product-feature-img">

					<img src="${pageContext.request.contextPath}/images/phone9.png" alt="" />

				</div>

				<div class="product-feature-text-container">

					<div class="product-feature-text">

						<strong>One Plus 11</strong> <span>$350.00</span>

					</div>

					<div class="cart-like">

						<a href="#"><i class="fa-solid fa-cart-shopping"></i></a> 

					</div>

				</div>

			</div>

			<div class="feature-product-box">

				<div class="product-feature-img">

					<img src="${pageContext.request.contextPath}/images/phone8.png" alt="" />

				</div>

				<div class="product-feature-text-container">

					<div class="product-feature-text">

						<strong>One Plus 12</strong> <span>$350.00</span>

					</div>

					<div class="cart-like">

						<a href="#"><i class="fa-solid fa-cart-shopping"></i></a> 

					</div>

				</div>

			</div>

			<div class="feature-product-box">

				<div class="product-feature-img">

					<img src="${pageContext.request.contextPath}/images/phone15.png" alt="" />

				</div>

				<div class="product-feature-text-container">

					<div class="product-feature-text">

						<strong>OnePlus Open</strong> <span>$350.00</span>

					</div>

					<div class="cart-like">

						<a href="#"><i class="fa-solid fa-cart-shopping"></i></a> 

					</div>

				</div>

			</div>

			<div class="feature-product-box">

				<div class="product-feature-img">

					<img src="${pageContext.request.contextPath}/images/phone16.png" alt="" />

				</div>

				<div class="product-feature-text-container">

					<div class="product-feature-text">

						<strong>OnePlus 12R</strong> <span>$350.00</span>

					</div>

					<div class="cart-like">

						<a href="#"><i class="fa-solid fa-cart-shopping"></i></a> 

					</div>

				</div>

			</div>

		</div>

	</section>

	<section id="Samsung" class="feature-product">

		<h2>Samsung</h2>

		<div class="feature-product-container">

			<div class="feature-product-box">

				<div class="product-feature-img">

					<img src="${pageContext.request.contextPath}/images/phone4.png" alt="" />

				</div>

				<div class="product-feature-text-container">

					<div class="product-feature-text">

						<strong>Samsung S23</strong> <span>$350.00</span>

					</div>

					<div class="cart-like">

						<a href="#"><i class="fa-solid fa-cart-shopping"></i></a> 

					</div>

				</div>

			</div>

			<div class="feature-product-box">

				<div class="product-feature-img">

					<img src="${pageContext.request.contextPath}/images/phone2.png" alt="" />

				</div>

				<div class="product-feature-text-container">

					<div class="product-feature-text">

						<strong>Samsung A52</strong> <span>$350.00</span>

					</div>

					<div class="cart-like">

						<a href="#"><i class="fa-solid fa-cart-shopping"></i></a> 

					</div>

				</div>

			</div>

			<div class="feature-product-box">

				<div class="product-feature-img">

					<img src="${pageContext.request.contextPath}/images/phone5.png" alt="" />

				</div>



				<div class="product-feature-text-container">

					<div class="product-feature-text">

						<strong>Samsung M31</strong> <span>$350.00</span>

					</div>

					<div class="cart-like">

						<a href="#"><i class="fa-solid fa-cart-shopping"></i></a> 

					</div>

				</div>

			</div>

			<div class="feature-product-box">



				<div class="product-feature-img">

					<img src="${pageContext.request.contextPath}/images/phone14.png" alt="" />

				</div>

				<div class="product-feature-text-container">

					<div class="product-feature-text">

						<strong>Samsung Z Fold 5</strong> <span>$350.00</span>

					</div>

					<div class="cart-like">

						<a href="#"><i class="fa-solid fa-cart-shopping"></i></a> 

					</div>

				</div>

			</div>

		</div>

	</section>

	<%@ include file="footer.jsp"%>
</body>
</html>