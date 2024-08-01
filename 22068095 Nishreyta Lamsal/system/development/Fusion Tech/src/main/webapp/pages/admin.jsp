<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Panel</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin.css" media="all" />
</head>
<body>
	<sql:setDataSource var="dbConnection" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/fusiontech" user="root" password="" />

	<sql:query dataSource="${dbConnection}" var="products">
    SELECT * FROM `product` p JOIN `category` c 
ON p.category_id = c.category_id
    </sql:query>
    
    <sql:query var="orders" dataSource="${dbConnection}">
    SELECT p.*, cat.*, u.fullName 
    FROM order_list o join cart c on o.cart_id=c.cart_id 
    join `cart_items` ci on ci.cart_id=c.cart_id 
    join product p on ci.product_id=p.product_id 
    join category cat on p.category_id=cat.category_id 
    join user_details u on c.user_id=u.id;
    </sql:query>
    
	<div class="ap">
		<h1>
			Admin Panel 
		</h1>
		<a class="anp1" style="text-decoration: none;"
			href="${pageContext.request.contextPath}/pages/addproduct.jsp">
			Add	Products
		</a>
		<form method="post"
			action="${pageContext.request.contextPath}/LogoutServlet">
			<button class="anp2" type="submit">Logout</button>
		</form>
	</div>
	<div class="product-list">
		<h2>Product List</h2>
		<table>
			<thead>
				<tr>
					<th>Product Name</th>
					<th>Category Name</th>
					<th>Stock</th>
					<th>Rating</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>

			</tbody>
			<!-- Display product list data here -->
			<c:forEach var="product" items="${products.rows}">
				<tr>
					<td>${ product.product_name }</td>
					<td>${ product.category_name }</td>
					<td>${ product.stock }</td>
					<td>${ product.price }</td>
					<td>
						<form
							action="${ pageContext.request.contextPath }/DeleteProduct?id=${product.product_id}"
							method="post">
							<input type="submit" value="Delete">
						</form>
						<form action="${pageContext.request.contextPath}/ProductUpdate" method="POST" enctype="multipart/form-data">

    <input type="hidden" name="productId" value="${product.product_id}">
    <input type="submit" value="Update">
</form>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="order-list">
		<h2>Order List</h2>
		<table>
			<thead>
				<tr>
					<th>Ordered By</th>
					<th>Total</th>
					<th>Item</th>
					<th>Delivery Status</th>
				</tr>
			</thead>
			<tbody>

			</tbody>
			<!-- Display order list data here -->
			<c:forEach var="order" items="${orders.rows}">
				<tr>
					<td>${ order.fullName }</td>
					<td>${ order.price }</td>
					<td>${ order.product_name }</td>
					<td>
                        <select name="deliveryStatus">
                            <option value="Delivered">Delivered</option>
                            <option value="Pending">Pending</option>
                        </select>
                    </td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>