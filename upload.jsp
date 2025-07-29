<!DOCTYPE HTML>
<html>
<head>
	<%@include file="header.html"%>
</head>
<body>
	<%@include file="menu2.jsp"%>
	<div class="register-form-main">
		<div class="container">
			<div class="title-div">
				<h3 class="tittle">
					<span>U</span>pload File
				</h3>
				<div class="tittle-style" align="center">	
					<%
						String status = request.getParameter("status");
					
						HttpSession user = request.getSession();
						String uname = user.getAttribute("username").toString();
						String name = user.getAttribute("name").toString();

						if (status != null) {
					%>
							<p style="color: red; size: 50px;"><%=status%></p>
					<%
						}
						else
						{
					%>
							<p style="color: red; size: 50px;"> Welcome ! <%=name%> </p>
					<%		
						}
					%>
					
				</div>
			</div>
			<div class="login-form">
				<form name="form" action="AddFileServlet" method="post" enctype="multipart/form-data">
                    <div class="">
						<p>Select File</p>
						<input type="file" class="name" name="file" required="required"/>
					</div>
					<br /><br />
					<div class="">
						<p>Enter Access Date (dd-MM-yyyy)</p>
						<input type="text" class="name"  name="time" required="required"/>
					</div>
					<br />
					<input type="submit" value="Upload">
				</form>
			</div>
		</div>
	</div>
	<%@include file="footer.html"%>
</body>
</html>