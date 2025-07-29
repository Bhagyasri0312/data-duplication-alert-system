<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="pack.Dbconnection"%>

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
					<span>V</span>iew Uploads
				</h3>
			</div>

			<%
				Connection con = Dbconnection.getConn();
				Statement st = con.createStatement();
				ResultSet rt = st.executeQuery("select * from files");
			%>

			<table id="customers">
				<tr>
					<td>FILE NAME</td>
					<td>OWNER NAME</td>
					<td>UPLOAD TIME</td>
				</tr>
				<%
					while (rt.next()) 
					{
				%>
						<tr>
							<td><%=rt.getString("filename")%></td>
							<td><%=rt.getString("owner_name")%></td>
							<td><%=rt.getString("upload_time")%></td>
						</tr>
				<%
					}
				%>
			</table>

		</div>
	</div>
	<%@include file="footer.html"%>
</body>
</html>