<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="Member.Login"%>
<%request.setCharacterEncoding("euc-kr");%>
<jsp:useBean id="member2" class="Member.MemberInfo">
	<jsp:setProperty name="member2" property="*" />
</jsp:useBean>
<%
	Login manager = Login.getInstance();
	
	int check = manager.updateMember(member2);
	
	if(check == 1){
%>
<script type="text/javascript">
	alert("정보를 수정 하였습니다.");
	location.href="../index.jsp";
</script>
<%}else{%>
<script type="text/javascript">
	alert("정보 수정에 실패 하였습니다.");
	history.back();
</script>
<%}%>