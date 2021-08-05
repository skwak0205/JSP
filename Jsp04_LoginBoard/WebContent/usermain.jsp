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
	
%>

	<h1><%=dto.getMyname() %>님, 환영합니다.</h1>
	
	<p>
		<a href="logincontroller.jsp?command=logout">로그아웃</a>
	</p>

	<div>
		<p>
			<a href="logincontroller.jsp?command=userinfo&myno=<%=dto.getMyno() %>">내 정보 보기</a>
		</p>
	</div>
</body>
</html>