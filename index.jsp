<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pagefile=request.getParameter("pagefile");
	if(pagefile==null){
		pagefile="home";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>MyMarvel</title>
<link rel="stylesheet" href="./css/board.css" type="text/css" />
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
    rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
    rel="stylesheet" type="text/css">
</head>
<body>
<!-- TITLE -->
	<jsp:include page = "top.jsp"/>
<!-- END TITLE -->
<div class="nav-wrapper">
	<div class="nav pagewidth">
		<ul>	
			<!-- MENU -->
			<li class="selected"><a href="index.jsp">Home</a></li>
			<%try{
				
					String id = (String)session.getAttribute("id");			
				
					if(id != null){
				%><li><a href="./board/list.jsp">Board</a></li><% 
			}
					}catch(Exception e){
					}%>
			<li><a href="movies.jsp">영화정보</a></li>
			<li><a href="drama.jsp">드라마정보</a></li>
			<li><a href="infi.jsp">인피니티스톤</a></li>
			<li><a href="charactor.jsp">캐릭터</a></li>
			
			<!-- END MENU -->
		</ul>
	</div>
</div>
<div class="pagewidth">
	<div class="page-wrap">
		<div class="content">
		<jsp:include page='<%=pagefile+".jsp"%>'/>
			<!-- CONTENT -->
			
		</div>
	<div class="sidebar">	
			<!-- SIDEBAR -->	
			<!-- SIDEBAR -->
		</div>
	
		<div class="clear"></div>		
	</div>

	<!--  FOOTER START -->
	<jsp:include page = "footer.jsp"/>

	<!-- FOOTER END -->
</div>	
</body>
</html>



	
	


