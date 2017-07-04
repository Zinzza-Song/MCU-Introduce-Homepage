<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
       <%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.Vector" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<%
	String info_id = (String)session.getAttribute("id");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/jsptest");
		conn = ds.getConnection();
		pstmt = conn.prepareStatement("SELECT * FROM charactor where name='데어데블'");
		rs = pstmt.executeQuery();
		//rs.next();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</head>
<body>
<!-- TITLE -->
	<jsp:include page = "top.jsp"/>
<!-- END TITLE -->

<div class="nav-wrapper">
	<div class="nav pagewidth">
		<ul>	
			<!-- MENU -->
			<li><a href="index.jsp">Home</a></li>
			<%try{
				
					String id = (String)session.getAttribute("id");			
				
					if(id != null){
				%><li><a href="./board/list.jsp">Board</a></li><% 
			}
					}catch(Exception e){
					}%>
			<li><a href="movies.jsp">영화정보</a></li>
			<li><a href="drama.jsp">드라마정보</a></li>
			<li ><a href="infi.jsp">인피니티스톤</a></li>
			<li class="selected"><a href="charactor.jsp">캐릭터</a></li>
			<!-- END MENU -->
		</ul>
	</div>
</div>
<center>
		<table border=1 width=300>
			<tr>
				<th>캐릭터이름</th><th>배우이름</th><th colspan="3">등장영화</th>
			</tr>
			<%while(rs.next()) {%>
			<tr>
				<td><%=rs.getString("name") %></td><td><%=rs.getString("actor")%></td><td colspan="3"><%=rs.getString("movie") %></td>
			</tr>
			<%} %>
		</table>
		<video src="./movie/데어데블.mp4" width="600" height="400" controls></video>
	</center>
<!--  FOOTER START -->
		<jsp:include page="footer.jsp" />
		<!-- FOOTER END -->
</body>
</html>