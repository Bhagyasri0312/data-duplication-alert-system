
<!DOCTYPE HTML>
<html>
<head>
	<%@include file="header.html"%>
</head>
<body>
	<%@include file="menu1.html"%>
	<div class="register-form-main">
		<div class="container">
			<div class="title-div">
				<h3 class="tittle">
					<span>U</span>ser Login
				</h3>
				<div class="tittle-style" align="center">	
					<%
						String status = request.getParameter("status");

						if (status != null) {
					%>
							<h1></h1>
							<p style="color: red; size: 50px;"><%=status%></p>
					<%
						}
					%>
					
				</div>
			</div>
			<div class="login-form">
				<form name="form" action="user_login" method="post" name="appform">
                    <div class="">
						<p>User Name</p>
						<input type="text" class="name" name="username" required="required"/>
					</div>

					<div class="">
						<p>Password</p>
						<input type="password" class="name" name="password" required="required"/>
					</div>
					<br />
					<input type="submit" value="Login">
				</form>
			</div>
		</div>
	</div>
	<%@include file="footer.html"%>
</body>
</html>