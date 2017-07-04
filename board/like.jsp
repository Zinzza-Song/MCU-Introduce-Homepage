<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="bMgr" class="Board.BoardMgr" />
<%
	int idx= Integer.parseInt(request.getParameter("idx"));
	bMgr.upLike(idx);
	String nowPage = request.getParameter("nowPage");
	response.sendRedirect("list.jsp?nowPage="+nowPage);
%>