<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="http://localhost:8080/Board/css/board.css" type="text/css" />
</head>
<body>
<div class="header-wrapper">
	<div class ="header-login">
	<%

try{	

String id = (String)session.getAttribute("id");
	
	if(id == null){
%>
	<a href = "http://localhost:8080/Board/main.jsp?pagefile=login/loginForm"> �α���</a> &nbsp;&nbsp; |&nbsp;&nbsp; <a href = "http://localhost:8080/Board/login/joinForm.jsp"> ȸ�� ����</a> 
	<%} else if(id.equals("admin")){
		%>
		<b>������</b>���� �α��� �ϼ̽��ϴ�.<br>
		<form method="post" action="http://localhost:8080/Board/login/logout.jsp">
			<input type="submit" value="�α׾ƿ�">
		</form>
		<form method="post" action="http://localhost:8080/Board/login/membercon.jsp">
			<input type="submit" value="ȸ������">
		</form>
		<form method="post" action="http://localhost:8080/Board/board/boardcon.jsp">
			<input type="submit" value="�Խ��ǰ���">
		</form>
	<%} else{%>
		<b><%=id %></b>���� �α��� �ϼ̽��ϴ�.<br>
		<form method="post" action="http://localhost:8080/Board/login/logout.jsp">
			<input type="submit" value="�α׾ƿ�">
		</form>
		<form method="post" action="http://localhost:8080/Board/login/mypage.jsp">
			<input type="submit" value="mypage">
		</form>
	<%}
	} catch(Exception e){
		e.printStackTrace();
	}
	%>
	</div>
	<div class="header pagewidth">
		<!-- TITLE -->
		<h1>My Marvel</h1> 
		<h2> </h2>
		<!-- END TITLE -->
	</div>
</div>



</body>
</html>