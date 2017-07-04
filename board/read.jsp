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
	bMgr.upCount(idx);//조회수 증가
	BoardBean bean = bMgr.getBoard(idx);//게시물 가져오기
	String name = bean.getName();
	String title = bean.getTitle();
	String reg_date = bean.getReg_date();
	String content = bean.getContent();
	String filename = bean.getFilename();
	int filesize = bean.getFilesize();
	int likes = bean.getLikes();
	int count = bean.getCount();
	session.setAttribute("bean", bean);//게시물을 세션에 저장
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>글보기</title>
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
				<h3>게시판 글보기</h3>
				<table border="0" cellpadding="3" cellspacing="0" width=100%>
					<tr>
						<td align="center" bgcolor="#DDDDDD" width="10%">이 름</td>
						<td bgcolor="#FFFFE8"><%=name%></td>
						<td align="center" bgcolor="#DDDDDD" width=10%>등록날짜</td>
						<td bgcolor="#FFFFE8"><%=reg_date%></td>
					</tr>
					<tr>
						<td align="center" bgcolor="#DDDDDD">제 목</td>
						<td bgcolor="#FFFFE8" colspan="3"><%=title%></td>
					</tr>
					<tr>
						<td align="center" bgcolor="#DDDDDD">첨부파일</td>
						<td bgcolor="#FFFFE8" colspan="3">
							<%
								if (filename != null && !filename.equals("")) {
							%> <a
							href="javascript:down('<%=filename%>')"><%=filename%></a>
							&nbsp;&nbsp;<font color="blue">(<%=filesize%>KBytes)
						</font> <%
 	} else {
 %> 등록된 파일이 없습니다.<%
 	}
 %>
 
						</td>
					</tr>
					
					<tr>
						<td colspan="4"><br />
						<pre><%=content%>    </pre><br /></td>
					</tr>
					<tr>
						<td colspan="4" align="right">추천수 : <%=likes%>/ 조회수 <%=count%>
						</td>
					</tr>
				</table>
				<hr />
				[<a href="update.jsp?nowPage=<%=nowPage%>&idx=<%=idx%>" >수 정</a> |
    <a href="reply.jsp?nowPage=<%=nowPage%>" >답 변</a> |
    <a href="delete.jsp?nowPage=<%=nowPage%>&idx=<%=idx%>">삭 제</a> |
    <a href="like.jsp?nowPage=<%=nowPage%>&idx=<%=idx%>">추천</a> ]<br>
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
