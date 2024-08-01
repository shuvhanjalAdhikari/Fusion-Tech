<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Products</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/yourproducts.css"
	type="text/css" />
</head>
<body>
<c:set var="userEmail" value="${cookie.user.value}" />
	<sql:setDataSource var="dbConnection" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/fusiontech" user="root" password="" />

	<sql:query dataSource="${dbConnection}" var="products">
SELECT p.*, cat.* FROM `cart_items` ci 
join cart c on ci.cart_id=c.cart_id 
join product p on ci.product_id=p.product_id 
join category cat on p.category_id=cat.category_id 
join user_details u on c.user_id=u.id 
where u.email='${userEmail}'
	
</sql:query>

	<%@ include file="usernav.jsp"%>

	<div class="product-list">
		<h2>Purchase History</h2>
		<table>
			<thead>
				<tr>
					<th>Product Name</th>
					<th>Category</th>
					<th>Price</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="product" items="${products.rows}">
					<tr>
						<td>${ product.product_name }</td>
						<td>${ product.category_name }</td>
						<td>${ product.price }</td>
					</tr>
				</c:forEach>
			</tbody>
			<!-- Display product list data here -->
		</table>
	</div>
</body>
</html>