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
<title>�Խù� ���</title>
<link rel="stylesheet" href="../css/board.css" type="text/css" />
<script>
function check() {
   if (document.post.pass.value == "") {
 alert("�н����带 �Է��ϼ���.");
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
<h3>�Խ��� �亯</h3>
<form name="post" method="post" action="replyProc.jsp" >
 <table border="0">
 <tr>
 </tr>
  <tr>
  <td width="20%">�� ��</td>
  <td width="80%">
  <input type="text" name="title" size="50" value="�亯 : <%=title%>" maxlength="50"></td> 
   </tr>
 <tr>
     <td width="20%">�� ��</td>
     <td width="80%">
     <textarea name="content" rows="12" cols="50"><%=content %>
     
========�亯 ���� ������.=======
      </textarea>
      </td>
      </tr>
 <tr>
     <td width="20%">��� ��ȣ</td> 
     <td width="80%">
  <input type="password" name="pass" size="15" maxlength="15"></td> 
    </tr>
 <tr>
     <td colspan="2" height="5"><hr/></td>
    </tr>
<tr> 
     <td colspan="2">
      <input type="button" value="�亯���"  onClick="check()">
      <input type="reset" value="�ٽþ���">
      <input type="button" value="�ڷ�" onClick="history.back()"></td>
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

