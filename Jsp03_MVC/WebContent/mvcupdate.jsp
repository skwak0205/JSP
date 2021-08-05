<%@page import="com.mvc.dto.MVCDto"%>
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
	// 형변환 하는 이유 : Object 객체를 가지고 오는 것이기 때문
	MVCDto dto = (MVCDto)request.getAttribute("select");
%>

	<h1>Update</h1>

	<form action="mvccontroller.jsp" method="post">
		<input type="hidden" name="command" value="updateres" />
		<input type="hidden" name="seq" value=<%=dto.getSeq() %> />
		
		<table border="1">
			<tr>
				<th>작성자</th>
				<td><%=dto.getWriter() %></td>
			</tr>
	
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value=<%=dto.getTitle() %> /></td>
			</tr>
	
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="content"><%=dto.getContent() %></textarea></td>
			</tr>
	
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="수정" />
					<input type="button" value="취소" onclick="location.href='mvccontroller.jsp?command=detail&seq=<%=dto.getSeq() %>'" />
				</td>
			</tr>
		</table>
	</form>

</body>
</html>