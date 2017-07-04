<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
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
		pstmt = conn.prepareStatement("SELECT * FROM member WHERE id=?");
		pstmt.setString(1, info_id);
		rs = pstmt.executeQuery();
		rs.next();
		session.setAttribute("pass", (String)rs.getString("pass"));
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<html>
<head>
<title>회원관리 시스템 관리자모드(회원 정보 보기)</title>
</head>
<body>
	<center>
		<table border=1 width=300>
			<tr align=center>
				<td>아이디 :</td>
				<td><%=rs.getString("id")%></td>
			</tr>
			<tr align=center>
				<td>비밀번호 :</td>
				<td><%=rs.getString("pass")%></td>
			</tr>
			<tr align=center>
				<td>이름 :</td>
				<td><%=rs.getString("name")%></td>
			</tr>
			<tr align=center>
				<td>이메일 :</td>
				<td><%=rs.getString("email")%></td>
			</tr>
			<tr align=center>
				<td>자기소개 :</td>
				<td><%=rs.getString("intro")%></td>
			</tr>
			<tr align=center>
				<td>선호히어로 :</td>
				<td><a href="../<%=rs.getString("hero")%>.jsp"><%=rs.getString("hero")%></a></td>
			</tr>
			<tr align=center>
				<a href="modifyForm.jsp">수정</a>&nbsp;&nbsp;<a href="delete.jsp">탈퇴</a>
			</tr>
		</table>
	</center>
</body>
</html>
</html>