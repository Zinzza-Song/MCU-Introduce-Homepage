<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="Member.Login"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	
	String id = request.getParameter("id");
	Login manager = Login.getInstance();
	int check = manager.out(id);
	if (check == 1)
		if (check == 1) {
%>
<script type="text/javascript">
	alert("suceess");
	location.href = "membercon.jsp";
</script>
<%
	} else {
%>
<script type="text/javascript">
	alert("fail");
	history.back();
</script>
<%}%>