<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>
<link rel="stylesheet" href="../css/board.css" type="text/css" />
</head>
<body>

	<center>
		<form name="join_reg" method="post" action="join_reg.jsp">
			<table border=1>

				<tr>
					<td colspan="2" align=center><b><font size=5>회원가입
								페이지</font></b></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input id="name" name="name" type="text" size="50"></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input id="id" name="id" type="text" size="50"
						maxlength="50" placeholder="ID를 입력해주세요" autofocus> 
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input id="pass" name="pass" type="password" size="50"
						placeholder="6~16자 숫자/문자" maxlength="16"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input id="email" name="email" type="text" size="50"></td>
				</tr>
				<tr>
					<td>선호히어로</td>
					<td><select id="hero" name="hero">
							<option selected>히어로를 선택하세요
							<option>아이언맨
							<option>캡틴아메리카
							<option>토르
							<option>가오겔
							<option>닥터스트레인지
							<option>스파이더맨
							<option>데어데블
					</select></td>
				</tr>
				<tr>
					<td colspan="2" align=center>자기소개</td>>
				</tr>
				<tr>
					<td colspan="2" align=center><textarea id="intro" name="intro" cols="70" rows="10">자기소개</textarea></td>
				</tr>
				<tr>
					<td colspan="2" align=center>
					<input type="submit" value="가입하기">&nbsp;&nbsp;<input type="reset" value="다시작성">
				</tr>

			</table>

		</form>
	</center>

</body>
</html>