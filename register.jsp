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
					<span>R</span>register
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
				<form name="form" action="registration" name="appform">
					
					<div class="">
						<p>Name</p>
						<input type="text" class="name" name="name" required="required"/>
					</div>
					
                    <div class="">
						<p>User Name</p>
						<input type="text" class="name" name="username" required="required"/>
					</div>

					<div class="">
						<p>Password</p>
						<input type="password" class="name" name="password" required="required"/>
					</div>
					
					<div class="">
						<p>Email</p>
						<input type="email" class="name" name="mail" required="required"/>
					</div>

                    <div class="">
						<p>Mobile</p>
						<input type="text" class="name" name="mobile" required="required" pattern="[6789][0-9]{9}" title="Please enter valid phone number"/>
					</div>

					<br />
					<input type="submit" value="Register">
				</form>
			</div>
		</div>
	</div>
	<%@include file="footer.html"%>
</body>
</html>