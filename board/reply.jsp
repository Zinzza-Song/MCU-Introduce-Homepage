<%@ page language="java" contentType="text/html; charset=EUC-KR"    pageEncoding="EUC-KR"%>
<%@ page import="Board.BoardBean"%>
<jsp:useBean id="bean" class="Board.BoardBean" scope="session"/>
<%
  String nowPage = request.getParameter("nowPage");
  String title = bean.getTitle();
  String content = bean.getContent(); 
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시물 답글</title>
<link rel="stylesheet" href="../css/board.css" type="text/css" />
<script>
function check() {
   if (document.post.pass.value == "") {
 alert("패스워드를 입력하세요.");
 document.post.pass.focus();
 return false;
 }
   document.post.submit();
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
<h3>게시판 답변</h3>
<form name="post" method="post" action="replyProc.jsp" >
 <table border="0">
 <tr>
 </tr>
  <tr>
  <td width="20%">제 목</td>
  <td width="80%">
  <input type="text" name="title" size="50" value="답변 : <%=title%>" maxlength="50"></td> 
   </tr>
 <tr>
     <td width="20%">내 용</td>
     <td width="80%">
     <textarea name="content" rows="12" cols="50"><%=content %>
     
========답변 글을 쓰세요.=======
      </textarea>
      </td>
      </tr>
 <tr>
     <td width="20%">비밀 번호</td> 
     <td width="80%">
  <input type="password" name="pass" size="15" maxlength="15"></td> 
    </tr>
 <tr>
     <td colspan="2" height="5"><hr/></td>
    </tr>
<tr> 
     <td colspan="2">
      <input type="button" value="답변등록"  onClick="check()">
      <input type="reset" value="다시쓰기">
      <input type="button" value="뒤로" onClick="history.back()"></td>
    </tr> 
   </table>

 <input type="hidden" name="likes" value="0" >
 <input type="hidden" name="nowPage" value="<%=nowPage%>">
 <input type="hidden" name="ref" value="<%=bean.getRef()%>">
 <input type="hidden" name="pos" value="<%=bean.getPos()%>">
 <input type="hidden" name="depth" value="<%=bean.getDepth()%>">
 <input type="hidden" name="name" value=<%=session.getAttribute("id") %>>
</form> 
</div>

<div class="clear"></div>
</div>
<!--  FOOTER START -->
<jsp:include page = "../footer.jsp"/>
<!-- FOOTER END -->
</div>
</body>
</html>

