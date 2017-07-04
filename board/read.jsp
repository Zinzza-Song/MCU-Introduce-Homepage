<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="Board.BoardBean"%>
<jsp:useBean id="bMgr" class="Board.BoardMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	int idx = Integer.parseInt(request.getParameter("idx"));
	String nowPage = request.getParameter("nowPage");
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	bMgr.upCount(idx);//��ȸ�� ����
	BoardBean bean = bMgr.getBoard(idx);//�Խù� ��������
	String name = bean.getName();
	String title = bean.getTitle();
	String reg_date = bean.getReg_date();
	String content = bean.getContent();
	String filename = bean.getFilename();
	int filesize = bean.getFilesize();
	int likes = bean.getLikes();
	int count = bean.getCount();
	session.setAttribute("bean", bean);//�Խù��� ���ǿ� ����
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ۺ���</title>
<link rel="stylesheet" href="../css/board.css" type="text/css" />
<script type="text/javascript">
	function list() {
		document.listFrm.action = "list.jsp";
		document.listFrm.submit();
	}

	function down(filename) {
		document.downFrm.filename.value = filename;
		document.downFrm.submit();
	}
	function read(idx) {
		document.readFrm.idx.value = idx;
		document.readFrm.action = "read.jsp";
		document.readFrm.submit();
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
				<h3>�Խ��� �ۺ���</h3>
				<table border="0" cellpadding="3" cellspacing="0" width=100%>
					<tr>
						<td align="center" bgcolor="#DDDDDD" width="10%">�� ��</td>
						<td bgcolor="#FFFFE8"><%=name%></td>
						<td align="center" bgcolor="#DDDDDD" width=10%>��ϳ�¥</td>
						<td bgcolor="#FFFFE8"><%=reg_date%></td>
					</tr>
					<tr>
						<td align="center" bgcolor="#DDDDDD">�� ��</td>
						<td bgcolor="#FFFFE8" colspan="3"><%=title%></td>
					</tr>
					<tr>
						<td align="center" bgcolor="#DDDDDD">÷������</td>
						<td bgcolor="#FFFFE8" colspan="3">
							<%
								if (filename != null && !filename.equals("")) {
							%> <a
							href="javascript:down('<%=filename%>')"><%=filename%></a>
							&nbsp;&nbsp;<font color="blue">(<%=filesize%>KBytes)
						</font> <%
 	} else {
 %> ��ϵ� ������ �����ϴ�.<%
 	}
 %>
 
						</td>
					</tr>
					
					<tr>
						<td colspan="4"><br />
						<pre><%=content%>    </pre><br /></td>
					</tr>
					<tr>
						<td colspan="4" align="right">��õ�� : <%=likes%>/ ��ȸ�� <%=count%>
						</td>
					</tr>
				</table>
				<hr />
				[<a href="update.jsp?nowPage=<%=nowPage%>&idx=<%=idx%>" >�� ��</a> |
    <a href="reply.jsp?nowPage=<%=nowPage%>" >�� ��</a> |
    <a href="delete.jsp?nowPage=<%=nowPage%>&idx=<%=idx%>">�� ��</a> |
    <a href="like.jsp?nowPage=<%=nowPage%>&idx=<%=idx%>">��õ</a> ]<br>
			</div>

			<form name="downFrm" action="download.jsp" method="post">
				<input type="hidden" name="filename">
			</form>

			<form name="listFrm" method="post">
				<input type="hidden" name="idx" value="<%=idx%>"> <input
					type="hidden" name="nowPage" value="<%=nowPage%>">
				<%
					if (!(keyWord == null || keyWord.equals("null"))) {
				%>
				<input type="hidden" name="keyField" value="<%=keyField%>">
				<input type="hidden" name="keyWord" value="<%=keyWord%>">
				<%
					}
				%>
			</form>
			<div class="clear"></div>
		</div>
		<!--  FOOTER START -->
		<jsp:include page="../footer.jsp" />
		<!-- FOOTER END -->
	</div>
	
</body>
</html>
