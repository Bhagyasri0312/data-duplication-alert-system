<%@page import="java.util.Iterator"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pack.decryption"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.InputStream"%>
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
					<span>U</span>pload File
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
			
				<%
					String fname =request.getParameter("filename");
					
					ArrayList<String> list=new ArrayList<String>();
					
					FileInputStream fis=new FileInputStream("C:\\Users\\kondr\\OneDrive\\Desktop\\Secure Deduplication\\"+fname);
					
					//=====================================
					
					byte[] bytes=new byte[1024];
					
					int position=0;
					
					while((position=fis.read(bytes))!=-1)
					{
						list.add(new String(bytes));
						bytes=new byte[1024];
					}
					
					fis.close();
					
					//=====================================
							
					session.setAttribute("filelist",list);
					session.setAttribute("filename",fname);
				
				%>
				
				<form name="form" action="upload" method="post" name="appform">
				<%
						Iterator<String> it=list.iterator();
						
						int j=1;
						
						while(it.hasNext())
						{
							String blo=it.next();
					%>
							<div class="">
								<p>File Block <%=j%>:</p>
								<textarea class="name" name="content" required="required" rows="10" cols="70"><%=blo%></textarea>
							</div>
							<br /><br />
					
					<%
							j++;
						}
					%>
					<br />
					<input type="submit" value="Upload">
				</form>
				
			</div>
		</div>
	</div>
	<%@include file="footer.html"%>
</body>
</html>