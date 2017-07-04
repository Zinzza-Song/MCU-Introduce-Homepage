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
<title>ȸ������ �ý��� �����ڸ��(ȸ�� ���� ����)</title>
</head>
<body>
	<center>
		<table border=1 width=300>
			<tr align=center>
				<td>���̵� :</td>
				<td><%=rs.getString("id")%></td>
			</tr>
			<tr align=center>
				<td>��й�ȣ :</td>
				<td><%=rs.getString("pass")%></td>
			</tr>
			<tr align=center>
				<td>�̸� :</td>
				<td><%=rs.getString("name")%></td>
			</tr>
			<tr align=center>
				<td>�̸��� :</td>
				<td><%=rs.getString("email")%></td>
			</tr>
			<tr align=center>
				<td>�ڱ�Ұ� :</td>
				<td><%=rs.getString("intro")%></td>
			</tr>
			<tr align=center>
				<td>��ȣ����� :</td>
				<td><a href="../<%=rs.getString("hero")%>.jsp"><%=rs.getString("hero")%></a></td>
			</tr>
			<tr align=center>
				<a href="modifyForm.jsp">����</a>&nbsp;&nbsp;<a href="delete.jsp">Ż��</a>
			</tr>
		</table>
	</center>
</body>
</html>
</html>