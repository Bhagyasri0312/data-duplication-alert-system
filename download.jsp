<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.sql.PreparedStatement"%>
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
					<span>V</span>iew Files
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

			<%
				HttpSession user = request.getSession();
				String uname = user.getAttribute("username").toString();
				String name = user.getAttribute("name").toString();
	
				Connection con = Dbconnection.getConn();
				PreparedStatement st = con.prepareStatement("select * from files");
				ResultSet rt = st.executeQuery();
			%>

			<table id="customers">
				<tr>
					<td>FILE NAME</td>
					<td>OWNER NAME</td>
					<td>UPLOAD TIME</td>
					<td>DOWNLOAD</td>
					<td>Delete</td>
				</tr>
				<%
					while (rt.next()) 
					{
						String id = rt.getString("idfiles");
						String owner = rt.getString("owner_name");
				%>
						<tr>
							
							<td><%=rt.getString("filename")%></td>
							<td><%=owner%></td>
							<td><%=rt.getString("upload_time")%></td>
		
				<%
							java.sql.Date time = rt.getDate("time");
							java.util.Date date = new java.util.Date();
							java.sql.Date d = new java.sql.Date(date.getTime());
							
							// Calculate the difference in milliseconds
					        long diffInMillis = d.getTime() - time.getTime();
					        
					        // Convert milliseconds to days
					        long daysBetween = TimeUnit.DAYS.convert(diffInMillis, TimeUnit.MILLISECONDS);
		
							if (d.compareTo(time) == 0 || d.compareTo(time) == -1) 
							{
								if (owner.equals(uname)) 
								{
				%>
									<td align="center"><a href="download?fileid=<%=id%>&filename=<%=rt.getString("filename")%>">Download</a></td>
				<%
								} 
								else 
								{
				%>
									<td align="center"><a href="validate.jsp?fileid=<%=id%>">validate key</a></td>
				<%
								}
							} 
							else 
							{
				%>
									<td align="center">Expired</td>
				<%
							}
				%>
				
				<%
							if (owner.equals(uname)) 
							{
				%>
								<td><a href="download.jsp?fid=<%=id%>">delete</a></td>
				<%
							} 
							else 
							{
				%>
								<td><a href=""></a></td>
				<%
							}
				%>
						</tr>
				<%
					}
				%>
			</table>
		</div>

		<%
			String fid = request.getParameter("fid");
	
			if (fid != null) {
	
				PreparedStatement st1 = con.prepareStatement("delete from fileblocks where fileid='" + fid + "'");
				st1.executeUpdate();
	
				PreparedStatement st2 = con.prepareStatement("delete from files where idfiles='" + fid + "'");
				st2.executeUpdate();
	
				response.sendRedirect("download.jsp");
			}
		%>
		
	</div>
	<%@include file="footer.html"%>
</body>
</html>
