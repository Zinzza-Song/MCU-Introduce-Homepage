<%@ page contentType="application;charset=euc-kr"%>
<jsp:useBean id="bMgr" class="Board.BoardMgr" />
<%
  bMgr.downLoad(request, response,out,pageContext);
%>
