<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������</title>
<link rel="stylesheet" href="../css/board.css" type="text/css" />
</head>
<body>

	<center>
		<form name="join_reg" method="post" action="join_reg.jsp">
			<table border=1>

				<tr>
					<td colspan="2" align=center><b><font size=5>ȸ������
								������</font></b></td>
				</tr>
				<tr>
					<td>�̸�</td>
					<td><input id="name" name="name" type="text" size="50"></td>
				</tr>
				<tr>
					<td>���̵�</td>
					<td><input id="id" name="id" type="text" size="50"
						maxlength="50" placeholder="ID�� �Է����ּ���" autofocus> 
					</td>
				</tr>
				<tr>
					<td>��й�ȣ</td>
					<td><input id="pass" name="pass" type="password" size="50"
						placeholder="6~16�� ����/����" maxlength="16"></td>
				</tr>
				<tr>
					<td>�̸���</td>
					<td><input id="email" name="email" type="text" size="50"></td>
				</tr>
				<tr>
					<td>��ȣ�����</td>
					<td><select id="hero" name="hero">
							<option selected>����θ� �����ϼ���
							<option>���̾��
							<option>ĸƾ�Ƹ޸�ī
							<option>�丣
							<option>������
							<option>���ͽ�Ʈ������
							<option>�����̴���
							<option>�����
					</select></td>
				</tr>
				<tr>
					<td colspan="2" align=center>�ڱ�Ұ�</td>>
				</tr>
				<tr>
					<td colspan="2" align=center><textarea id="intro" name="intro" cols="70" rows="10">�ڱ�Ұ�</textarea></td>
				</tr>
				<tr>
					<td colspan="2" align=center>
					<input type="submit" value="�����ϱ�">&nbsp;&nbsp;<input type="reset" value="�ٽ��ۼ�">
				</tr>

			</table>

		</form>
	</center>

</body>
</html>