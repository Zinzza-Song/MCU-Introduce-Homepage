<!-- 로그인 처리 페이지  -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="Member.Login"%>
<%
	request.setCharacterEncoding("euc-kr");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");

	Login log = Login.getInstance();

	int check = log.userCheck(id, pwd);

	if (check == 1) {

		session.setAttribute("id", id);
		response.sendRedirect("../index.jsp");

	} else if (check == 0) {
%>
<script>
	alert("비밀번호가 맞지 않습니다.");
	history.go(-1);
</script>
<%
	} else {
%>
<script>
	alert("아이디가 맞지 않습니다..");
	history.go(-1);
</script>
<%
	}
%>

