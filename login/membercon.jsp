<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		pstmt = conn.prepareStatement("SELECT id FROM member");
		rs = pstmt.executeQuery();
		rs.next();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원관리</title>
</head>
<body>
<!-- TITLE -->
	<jsp:include page = "../top.jsp"/>
<!-- END TITLE -->

<div class="nav-wrapper">
	<div class="nav pagewidth">
		<ul>	
			<!-- MENU -->
			<li><a href="../index.jsp">Home</a></li>
			<%try{
				
					String id = (String)session.getAttribute("id");			
				
					if(id != null){
				%><li><a href="./board/list.jsp">Board</a></li><% 
			}
					}catch(Exception e){
					}%>
			<li><a href="../movies.jsp">영화정보</a></li>
			<li><a href="../drama.jsp">드라마정보</a></li>
			<li><a href="../infi.jsp">인피니티스톤</a></li>
			<li><a href="../charactor.jsp">캐릭터</a></li>
			<!-- END MENU -->
		</ul>
	</div>
</div>
<center>
		<table border=1 width=300>
			<tr>
				<th colspan="2">회원목록</th>
			</tr>
			<%while(rs.next()) {%>
			<tr>
				<td><%=rs.getString("id") %></td><td><form action="out.jsp" method="post" name="out"><input type="hidden" value="<%=rs.getString("id")%>" id="id" name="id">
				<input type="submit" value="강퇴"></form></td>
			</tr>
			<%} %>
		</table>
	</center>
<!--  FOOTER START -->
		<jsp:include page="../footer.jsp" />
		<!-- FOOTER END -->
</body>
</html>