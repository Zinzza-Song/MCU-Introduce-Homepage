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
			<li><a href="movies.jsp">��ȭ����</a></li>
			<li><a href="drama.jsp">�������</a></li>
			<li ><a href="infi.jsp">���Ǵ�Ƽ����</a></li>
			<li class="selected"><a href="charactor.jsp">ĳ����</a></li>
			<!-- END MENU -->
		</ul>
	</div>
</div>

<center>
	<table border=1 width=300>
		<tr><th>ĳ���͸��</th></tr>
		<tr><th><a href="������.jsp">������</a></th></tr>			
		<tr><th><a href="���ͽ�Ʈ������.jsp">���ͽ�Ʈ������</a></th></tr>			
		<tr><th><a href="�����̴���.jsp">�����̴���</a></th></tr>			
		<tr><th><a href="���̾��.jsp">���̾��</a></th></tr>			
		<tr><th><a href="�丣.jsp">�丣</a></th></tr>			
		<tr><th><a href="ĸƾ�Ƹ޸�ī.jsp">ĸƾ�Ƹ޸�ī</a></th></tr>
		<tr><th><a href="�����.jsp">�����</a></th></tr>					
	</table>
</center>
<!--  FOOTER START -->
		<jsp:include page="footer.jsp" />
		<!-- FOOTER END -->
</body>
</html>