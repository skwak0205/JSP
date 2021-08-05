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
	LoginDto dto = (LoginDto)request.getAttribute("dto");
%>

	<h1>UPDATE ROLE</h1>

	<form action="logincontroller.jsp" method="post">
		<input type="hidden" name="command" value="updaterole" />
		<input type="hidden" name="myno" value=<%=dto.getMyno() %> />
		
		<table border="1">
			<tr>
				<th>번호</th>
				<td><%=dto.getMyno() %></td>
			</tr>
			
			<tr>
				<th>이름</th>
				<td><%=dto.getMyrole() %></td>
			</tr>
			
			<tr>
				<th>등급</th>
				<td>
					<select name="myrole">
						<option value="USER" <%=dto.getMyrole().equals("USER") ? "selected" : "" %> >일반회원</option>
						<option value="ADMIN" <%=dto.getMyrole().equals("ADMIN") ? "selected" : "" %> >관리자</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="submit" value="변경완료" />
				</td>
			</tr>
			
			
		
		</table>
		
		
	</form>

</body>
</html>