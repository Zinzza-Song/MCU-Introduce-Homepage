<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="Member.Login"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	String id = (String) session.getAttribute("id");
	String passwd = request.getParameter("passwd");
	Login manager = Login.getInstance(); //회원탈퇴처리 메소드 수행 후 탈퇴 상황 값 반환 
	int check = manager.deleteMember(id,passwd);
	if (check == 1)//탈퇴성공시 session.invalidate();//세션을 무효화
		if (check == 1) {
%>
<script type="text/javascript">
	alert("suceess");
	location.href = "../index.jsp";
</script>
<%
	} else {
%>
<script type="text/javascript">
	alert("fail");
	history.back();
</script>
<%
	}
	session.invalidate();
%>