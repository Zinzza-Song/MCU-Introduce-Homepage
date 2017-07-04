<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.Vector" %>
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
		pstmt = conn.prepareStatement("select * from movie as m inner join infi as i on m.name=i.movie");
		rs = pstmt.executeQuery();
		//rs.next();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ȭ-���Ǵ�Ƽ����</title>
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
			<li><a href="./board/list.jsp">Board</a></li>
			<li><a href="movies.jsp">��ȭ����</a></li>
			<%try{
				
					String id = (String)session.getAttribute("id");			
				
					if(id != null){
				%><li><a href="./board/list.jsp">Board</a></li><% 
			}
					}catch(Exception e){
					}%>
			<li><a href="infi.jsp">���Ǵ�Ƽ����</a></li>
			<li><a href="charactor.jsp">ĳ����</a></li>
			<!-- END MENU -->
		</ul>
	</div>
</div>
<center>
		<table border=1 width=300>
			<tr>
				<th>�����̸�</th><th>�ɷ�</th><th colspan="2">���念ȭ</th><th colspan="2">������(��)</th><th colspan="2">������</th><th colspan="4">�ٰŸ�</th>
			</tr>
			<%while(rs.next()) {%>
			<tr>
				<td><%=rs.getString("stone") %></td><td><%=rs.getString("ability")%></td>
				<td colspan="2"><%=rs.getString("movie") %></td><td colspan="2"><%=rs.getString("oweners") %></td>
				<td colspan="2"><%=rs.getString("relese_date") %></td><td colspan="4"><%=rs.getString("story") %></td>
			</tr>
			<%} %>

		</table>
		<hr/>	
	</center>
<!--  FOOTER START -->
		<jsp:include page="footer.jsp" />
		<!-- FOOTER END -->
</body>
</html>