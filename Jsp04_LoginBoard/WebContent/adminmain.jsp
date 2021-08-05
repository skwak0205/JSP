<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-control", "no-store");
	response.setHeader("Expires", "0");
	
	/*
		데이터가 변경되었을 때, 이전 내용을 화면에 보여주는 이유는, 서버에서 응답된 값이 아닌 캐시에 저장된 값을 가져오기 때문
		
		- 브라우저가 캐시에 응답결과를 저장하지 않도록 설정하는 코드
		response.setHeader("Pragma", "no-cache");         // http 1.0
		response.setHeader("Cache-control", "no-store");  // http 1.1
		response.setHeader("Expires", "0");               // proxy server
		
		우리는 http 1.1 사용중 (tomcat server.xml에 있음!)
		
	*/

%>

<%@page import="com.login.dto.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	LoginDto dto = (LoginDto) session.getAttribute("dto");
	if (dto == null) {
		// session이 만료됨
		pageContext.forward("index.html");
		
	
		//response.sendRedirect("index.html");
		/*
			위와 같이 sendRedirect 사용하여 로그아웃 후 뒤로 가기를 눌렀을 경우,
			HTTP Status 500 – Internal Server Error 에러가 뜸.
			java.lang.NullPointerException
		*/
		
	}
%>

	<h1><%=dto.getMyname() %>님, 환영합니다.</h1>
	<a href="logincontroller.jsp?command=logout">로그아웃</a>
	<br />
	
	<div>
		<p>
			<a href="logincontroller.jsp?command=userlistall">회원정보 조회(all)</a>
		</p>
		
		<p>
			<a href="logincontroller.jsp?command=userlistenabled">회원정보 조회(enabled=y)</a>
		</p>
	
	</div>


</body>
</html>