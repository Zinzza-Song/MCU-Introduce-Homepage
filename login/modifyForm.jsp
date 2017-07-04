<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="Member.Login" %>
    <%@ page import="Member.MemberInfo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>정보 수정</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");
	String pass = (String)session.getAttribute("pass");
	
	Login manager = Login.getInstance();
	MemberInfo m = manager.getMember(id, pass);
	
	try{
%>
<%=pass %>
<center>
	<form action="modifyPro.jsp" name="regFrm" method="post">
		<table border=1>
			<tr>
				<td colspan="2" align=center><b><font size=5>회원정보 수정페이지</font></b></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input id="id" name="id" type="text" size="20" maxlength="50" value="<%=id%>" readOnly></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input id="pass" name="pass" type="password" size="20"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input id="email" name="email" type="text" size="20"></td>
			</tr>
			<tr>
					<td>선호히어로</td>
					<td><select id="hero" name="hero">
							<option selected>히어로를 선택하세요
							<option>가오겔
							<option>닥터스트레인지
							<option>데어데블
							<option>스파이더맨
							<option>아이언맨
							<option>캡틴아메리카
							<option>토르
					</select></td>
				</tr>
				<tr>
					<td colspan="2" align=center>자기소개</td>>
				</tr>
				<tr>
					<td colspan="2" align=center><textarea id="intro" name="intro" cols="70" rows="10">자기소개</textarea></td>
				</tr>
				<tr>
					<td colspan="2" align=center><input type="submit" value="수정">&nbsp;<input type="button" 
					onClick="javascript:location.href='../index.jsp'" value="취소"></td>
				</tr>
		</table>
	</form>
</center>
<%}catch(Exception e){} %>
</body>
</html>