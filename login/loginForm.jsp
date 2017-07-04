<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인</title>
<link rel="stylesheet" href="../css/board.css" type="text/css" />
</head>
<body>
<div class="pagewidth">
	<div class="page-wrap">
		<div class="login">
		<!-- login form start  -->
		<form name="loginForm" action="/Board/login/login_reg.jsp" method="post">
		<center>
		<table>
		<tr>
		<td colspan ="2" align=center>
		로그인 페이지 
		</td>
		</tr>
		<tr>
		<td align="right">아이디</td> <td align="center"><input type="text" name ="id"/> </td> </tr>
		<tr>
		<td align="right">비밀번호</td> <td align="center"><input type="password" name="pwd"/></td>
		</tr>
		<tr>
		<td colspan="2" align="center">
		<a href="javascript:loginForm.submit()">로그인</a>&nbsp;&nbsp;
		<a href="/Board/login/joinForm.jsp">회원가입</a>
		</td>
		</tr>
		</table>
		
		</center>
		</form>
		<!-- login Form  end  -->
		</div>
		
		<div class="clear"></div>		

	</div>
</div>
</body>
</html>