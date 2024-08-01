<%@page import="controller.statemanagement.SessionManagement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%!SessionManagement mySession = new SessionManagement();%>
<%
//setting absolute path
String mainPath = request.getContextPath();
// invoking session username
String user = (String) session.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Profile</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/userprofile.css"
	type="text/css" />
</head>
<body>


	<sql:setDataSource var="dbConnection" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/fusiontech" user="root" password="" />


	<sql:query dataSource="${dbConnection}" var="user">
	SELECT * FROM USER_DETAILS WHERE email='${user}'
	</sql:query>
	<div class="container">
	<c:forEach var="user" items="${user.rows}">
		<div class="left-column">
			<div class=logo>
				<a href="${pageContext.request.contextPath}/pages/userindex.jsp">Fusion Tech</a>
			</div>
			<div class="profile-picture">
				<img src="http://localhost:8081/Fusion Tech/images/${user.image}" alt="Profile Picture">
			</div>
			<form action="${pageContext.request.contextPath}/LogoutServlet"
				method="post" class="logout">
				<button type="submit">Logout</button>
			</form>
		</div>
		<div class="right-column">
			
				<h2>Edit Profile</h2>
				<form method="post" action="${ pageContext.request.contextPath }/UpdateUser">
					<label for="full-name">Full Name</label> <input
						value="${user.fullName}" type="text" id="full-name"
						name="full-name"> <label for="username">Username</label> <input
						value="${user.username}" type="text" id="username" name="username">
					<label for="email">Email Address</label> <input
						value=${user.email } type="email" id="email" name="email">
					<div style="display: none;">
						<label for="user-id">User ID</label> <input type="text"
							id="user-id" name="user-id">
					</div>
					<label for="password">New Password</label> <input type="password"
						id="password" name="password">

					<button type="submit" class="update-info">Update</button>
				</form>
		</div>
		</c:forEach>
	</div>
</body>
</html>