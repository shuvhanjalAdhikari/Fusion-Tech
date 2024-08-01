<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/register.css">
</head>
<body>
	<div class="wrapper">
		<div class="box">
			<div class="box-left">
				<img src="${pageContext.request.contextPath}/images/signup.jpg" style="height: 100%; width: 100%;">
			</div>
			<div class="box-right">
				<a href="${pageContext.request.contextPath}/pages/index.jsp" class="logo">F.T.</a>
				<h1>
					SIGN UP
				</h1>
				<form action="${pageContext.request.contextPath}/UserRegister" method="post" class="register form" enctype="multipart/form-data">
					<input type="text" name="fullName" class="detail" placeholder="FULL NAME" size="40"><br>  
					<input type="text" name="username" class="detail" placeholder="USERNAME" size="40"><br>
					<input type="text" name="email" class="detail" placeholder="EMAIL" size="40"><br> 
					<input type="password" name="password" class="detail" placeholder="PASSWORD" size="40"><br>
					<input type="text" name="address" class="detail" placeholder="ADDRESS" size="40"><br>
					<input type="text" name="role" class="detail" placeholder="ROLE" size="40"><br>
					<input type="file" name="image" class="detail" placeholder="PROFILE PICTURE" size="40"><br> <br>
					<button value="Register" id="register-but">Register</button>
					<div>
						<p>Already have an account? <a href="login.jsp">LOG IN</a></p>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>