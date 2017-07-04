<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="Board.BoardBean"%>
<jsp:useBean id="bMgr" class="Board.BoardMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	String nowPage = request.getParameter("nowPage");
	int idx= Integer.parseInt(request.getParameter("idx"));
	if (request.getParameter("pass") != null) {
           
 	//비번을 입력을 해서 세션에 있는 pass 비교요청
	String inPass = request.getParameter("pass");
	BoardBean bean = (BoardBean) session.getAttribute("bean");
	String dbPass = bean.getPass();
	
	if (inPass.equals(dbPass)) {
		bMgr.deleteBoard(idx);
		String url = "list.jsp?nowPage=" + nowPage;
		response.sendRedirect(url);
	} else {
%>
<script type="text/javascript">
alert("입력하신 비밀번호가 아닙니다.");
history.back();
</script>
<%}
} else {
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>삭제하기</title>
<link rel="stylesheet" href="../css/board.css" type="text/css" />
<script type="text/javascript">
function check() {
	if (document.delFrm.pass.value == "") {
		alert("패스워드를 입력하세요.");
		document.delFrm.pass.focus();
		return false;
	}
	document.delFrm.submit();
}
</script>
</head>
<body>
<!-- TITLE -->
<jsp:include page="../top.jsp"/>
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
	<h3>게시글 삭제</h3>
	<h5>사용자의 비밀번호를 입력해주세요.</h5>
	<form name="delFrm" method="post" action="delete.jsp">
   	 <center>
	  <table align="center" border="0" width=91%>
	    <tr>
		<td align="center">
		<input type="password" name="pass" size="17" maxlength="15">
		</td>
	    </tr>
	    <tr>
		<td align="center">
		<input type="button" value="삭제완료" onClick="check()"> 
		<input type="reset" value="다시쓰기">
		<input type="button" value="뒤로" onClick="history.go(-1)">
		</td>
	    </tr>
	  </table>
            </center>
     	<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
     	<input type="hidden" name="idx" value="<%=idx%>">
	</form>
      </div>
      <div class="clear"></div>
   </div>
<%}%>

<!--  FOOTER START -->
<jsp:include page = "../footer.jsp"/>
<!-- FOOTER END -->
</div>
</body>
</html>


