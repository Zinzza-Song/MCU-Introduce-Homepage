<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<jsp:useBean id="bMgr" class="Board.BoardMgr"/>
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
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<%
  bMgr.insertBoard(request);
  response.sendRedirect("list.jsp");
%>
