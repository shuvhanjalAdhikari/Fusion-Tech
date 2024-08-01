<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SIGN IN</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/login.css" type="text/css"
	media="all" />
</head>
<body>
	<div class="wrapper">
		<div class="box">
			<div class="box-left">
				<img src="${pageContext.request.contextPath}/images/bg4.jpg" style="height: 100%; width: 100%;">
			</div>
			<div class="box-right">
				<a href="${pageContext.request.contextPath}/pages/index.jsp" class="logo">.F.T.</a>
				<h1>SIGN IN</h1>
				<form action="${pageContext.request.contextPath}/LoginServlet" method="post" id="panel-body">
					<input type="email" name="email" placeholder="EMAIL" /> 
					<input type="password" name="password" placeholder="PASSWORD" />
					<button>LOGIN</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>