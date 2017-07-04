<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="Board.BoardBean"%>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	String nowPage = request.getParameter("nowPage");
	BoardBean bean = (BoardBean) session.getAttribute("bean");
	String title = bean.getTitle();
	String name = bean.getName();
	String content = bean.getContent();
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�� ����</title>
<link rel="stylesheet" href="../css/board.css" type="text/css" />
<script>
	function check() {
		if (document.updateFrm.pass.value == "") {
			alert("������ ���� �н����带 �Է��ϼ���.");
			document.updateFrm.pass.focus();
			return false;
		}
		document.updateFrm.submit();
	}
</script>
</head>
<body>
	<!-- TITLE -->
	<jsp:include page="../top.jsp" />
	<!-- END TITLE -->
	<div class="nav-wrapper">
		<div class="nav pagewidth">
			<ul>
				<!-- MENU -->
				<li><a href="../index.jsp">Home</a></li>
				<li class="selected"><a href="list.jsp">Board</a></li>

				<!-- END MENU -->
			</ul>
		</div>
	</div>
	<div class="pagewidth">
		<div class="page-wrap">
			<div class="content">
				<!-- CONTENT -->
				<h3>�Խ��� �ۼ���</h3>
				<form name="updateFrm" method="post" action="updateProc.jsp">
					<input type="hidden" name="nowPage" value="<%=nowPage%>">
					<input type="hidden" name="idx" value="<%=idx%>">
					<table width="70%" cellspacing="0" cellpadding="7">
						<tr>
							<td width="20%">�� ��</td>
							<td width="80%"><input type="text" name="name"
								value="<%=name%>" size="30" maxlength="20"></td>
						</tr>
						<tr>
							<td width="20%">�� ��</td>
							<td width="80%"><input type="text" name="title" size="50"
								maxlength="50" value="<%=title%>"></td>
						<tr>
							<td width="20%">�� ��</td>
							<td width="80%"><textarea name="content" rows="10" cols="50"><%=content%></textarea>
							</td>
						</tr>
						<tr>
							<td width="20%">��� ��ȣ</td>
							<td width="80%"><input type="password" name="pass" size="15"
								maxlength="15"> �����ÿ��� ��й�ȣ�� �ʿ��մϴ�.</td>
						</tr>
						<tr>
							<td colspan="2" height="5"><hr /></td>
						</tr>
						<tr>
							<td colspan="2"><input type="button" value="�����Ϸ�"
								onClick="check()"> <input type="reset" value="�ٽü���">
								<input type="button" value="�ڷ�" onClick="history.go(-1)">
							</td>
						</tr>
					</table>
				</form>
			</div>
		<div class="clear"></div>
		</div>
		<!--  FOOTER START -->
		<jsp:include page="../footer.jsp" />
		<!-- FOOTER END -->
	</div>
</body>
</html>

