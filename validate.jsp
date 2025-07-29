
<!DOCTYPE HTML>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="pack.Dbconnection"%>
<%@page import="java.sql.Connection"%>
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
					<span>V</span>alidate File key
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
				
				<form name="form" action="validate.jsp" name="appform">
					
					<input type="hidden" name="fid" value="<%=request.getParameter("fileid")%>">
					
                    <div class="">
						<p>Enter Key</p>
						<input type="text" class="name" name="filekey" required="required"/>
					</div>

					<br />
					<input type="submit" value="Download">
				</form>
			</div>
		</div>
		
		<%
			String fid=request.getParameter("fid");
			String ukey=request.getParameter("filekey");
			
			if(fid!=null && ukey!=null)
			{
				Connection con = Dbconnection.getConn();
				PreparedStatement st = con.prepareStatement("select * from files where idfiles='"+fid+"'");
				ResultSet rt = st.executeQuery();
				
				String fkey="";
				String fname="";
				
				while (rt.next()) {
					fkey= rt.getString("accesskey");
					fname= rt.getString("filename");
				}
				
				if(fkey.equals(ukey))
				{
					response.sendRedirect("download?fileid="+fid+"&filename="+fname);
				}
				else
				{
					response.sendRedirect("download.jsp?status=invalid access");
				}
			}
		%>
		
	</div>
	<%@include file="footer.html"%>
</body>
</html>