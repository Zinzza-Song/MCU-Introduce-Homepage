<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="Member.Login"%>
<%@ page import="java.sql.Timestamp"%>
<%request.setCharacterEncoding("euc-kr");%>
<jsp:useBean id="member" class="Member.MemberInfo">
	<jsp:setProperty name="member" property="*"/>
</jsp:useBean>

<%
	member.setReg_date(new Timestamp(System.currentTimeMillis()));
	Login manager = Login.getInstance();
	boolean result = manager.insertMember(member);
	
	if(result){
%>
<script type="text/javascript">
	alert("ȸ�������� �Ͽ����ϴ�.");
	location.href("../index.jsp");
</script>
<%} else{%>
<script type="text/javascript">
	alert("ȸ�����Կ� ���� �Ͽ����ϴ�.");
	history.back();
</script>
<%}%>