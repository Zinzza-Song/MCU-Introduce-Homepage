<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- TITLE -->
	<jsp:include page = "top.jsp"/>
<!-- END TITLE -->

<div class="nav-wrapper">
	<div class="nav pagewidth">
		<ul>	
			<!-- MENU -->
			<li><a href="index.jsp">Home</a></li>
			<%try{
				
					String id = (String)session.getAttribute("id");			
				
					if(id != null){
				%><li><a href="./board/list.jsp">Board</a></li><% 
			}
					}catch(Exception e){
					}%>
			<li><a href="movies.jsp">영화정보</a></li>
			<li><a href="drama.jsp">드라마정보</a></li>
			<li ><a href="infi.jsp">인피니티스톤</a></li>
			<li class="selected"><a href="charactor.jsp">캐릭터</a></li>
			<!-- END MENU -->
		</ul>
	</div>
</div>

<center>
	<table border=1 width=300>
		<tr><th>캐릭터목록</th></tr>
		<tr><th><a href="가오겔.jsp">가오겔</a></th></tr>			
		<tr><th><a href="닥터스트레인지.jsp">닥터스트레인지</a></th></tr>			
		<tr><th><a href="스파이더맨.jsp">스파이더맨</a></th></tr>			
		<tr><th><a href="아이언맨.jsp">아이언맨</a></th></tr>			
		<tr><th><a href="토르.jsp">토르</a></th></tr>			
		<tr><th><a href="캡틴아메리카.jsp">캡틴아메리카</a></th></tr>
		<tr><th><a href="데어데블.jsp">데어데블</a></th></tr>					
	</table>
</center>
<!--  FOOTER START -->
		<jsp:include page="footer.jsp" />
		<!-- FOOTER END -->
</body>
</html>