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
	alert("������ ���� �Ͽ����ϴ�.");
	location.href="../index.jsp";
</script>
<%}else{%>
<script type="text/javascript">
	alert("���� ������ ���� �Ͽ����ϴ�.");
	history.back();
</script>
<%}%>