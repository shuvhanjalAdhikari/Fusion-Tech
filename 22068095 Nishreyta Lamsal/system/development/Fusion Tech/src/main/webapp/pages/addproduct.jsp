<%@page import="resources.myConstants"%>
<%@page import="java.util.List"%>
<%@page import="controller.databaseConnection.DatabaseConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Product</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/addproduct.css" type="text/css"
	media="all" />
</head>
<body>

	<sql:setDataSource var="dbConnection" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/fusiontech" user="root" password=""/>
	
	<!-- Executing Query Using SQL Tag Library -->
	<sql:query var="allCategories" dataSource="${dbConnection}">
		SELECT category_id, category_name from category
	</sql:query>


	<div class="content-container">
		<h1>Add Product</h1>
		<div class="container">

			<form action="${pageContext.request.contextPath}/Product" method="POST" enctype="multipart/form-data">
				<label for="product-name">Product Name <span
					class="required">*</span></label> <input type="text" id="product-name"
					name="product-name" required> <label for="product-category">Product
					Category</label> <select id="product-category" name="product-category">
					<c:forEach var="category" items="${allCategories.rows}">
										<option value="${category.category_id}">${category.category_name}</option>
					</c:forEach>
				</select> <label for="product-price">Product Price <span
					class="required">*</span></label> <input type="text" id="product-price"
					name="product-price" min="0" required> <label
					for="product-price">Stock <span class="required">*</span></label> <input
					type="number" id="Stock" name="Stock" required> <label
					for="product-image">Upload Product Image<span
					class="required"></span></label> <input type="file" id="product-image"
					name="product-image" required>

				<button type="submit">Add Product</button>
				<button type="reset">Reset</button>
				<button type="button" onclick="location.href='${pageContext.request.contextPath}/pages/admin.jsp'">Cancel</button>
			</form>
		</div>
	</div>
</body>
</html>