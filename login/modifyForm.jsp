<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="Member.Login" %>
    <%@ page import="Member.MemberInfo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ����</title>
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
				<td colspan="2" align=center><b><font size=5>ȸ������ ����������</font></b></td>
			</tr>
			<tr>
				<td>���̵�</td>
				<td><input id="id" name="id" type="text" size="20" maxlength="50" value="<%=id%>" readOnly></td>
			</tr>
			<tr>
				<td>��й�ȣ</td>
				<td><input id="pass" name="pass" type="password" size="20"></td>
			</tr>
			<tr>
				<td>�̸���</td>
				<td><input id="email" name="email" type="text" size="20"></td>
			</tr>
			<tr>
					<td>��ȣ�����</td>
					<td><select id="hero" name="hero">
							<option selected>����θ� �����ϼ���
							<option>������
							<option>���ͽ�Ʈ������
							<option>�����
							<option>�����̴���
							<option>���̾��
							<option>ĸƾ�Ƹ޸�ī
							<option>�丣
					</select></td>
				</tr>
				<tr>
					<td colspan="2" align=center>�ڱ�Ұ�</td>>
				</tr>
				<tr>
					<td colspan="2" align=center><textarea id="intro" name="intro" cols="70" rows="10">�ڱ�Ұ�</textarea></td>
				</tr>
				<tr>
					<td colspan="2" align=center><input type="submit" value="����">&nbsp;<input type="button" 
					onClick="javascript:location.href='../index.jsp'" value="���"></td>
				</tr>
		</table>
	</form>
</center>
<%}catch(Exception e){} %>
</body>
</html>