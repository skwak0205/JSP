<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	header {
		background-color: skyblue;
		height: 100px;
		
	}
	
	footer {
		background-color: skyblue;
		height: 50px;
		text-align: center;
		line-height: 25px;
	}
	
	a {
		text-decoration: none;
	}
</style>

</head>
<body>

	<!-- 
		상대 경로
		http://localhost:8787/(root) Jsp02_MultiDelete/(context root-프로젝트의 최상위) boardlist.jsp 
		- / : root (최상위 디렉토리)
		- ./ : 나와 같은 디렉토리 
		- ../ : 상위 디렉토리
	
	 -->

	<header>
		<a href="./boardlist.jsp">게시판 구현하기 연습!</a> <!-- ./boardlist.jsp 인 이유는 boardlist에서 include로 header를 포함했기 때문에 -->
	</header>

</body>
</html>