<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="Board.BoardMgr"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	
	String title = request.getParameter("title");
BoardMgr manager = BoardMgr.getInstance();
	int check = manager.erase(title);
	if (check == 1)
		if (check == 1) {
%>
<script type="text/javascript">
	alert("suceess");
	location.href = "boardcon.jsp";
</script>
<%
	} else {
%>
<script type="text/javascript">
	alert("fail");
	history.back();
</script>
<%}%>