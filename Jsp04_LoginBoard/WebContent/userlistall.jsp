<%@page import="com.login.dto.LoginDto"%>
<%@page import="java.util.List"%>
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
	List<LoginDto> list = (List<LoginDto>)request.getAttribute("list");
%>

	<h1>USER LIST</h1>
	
	<table border="1">
		<col width="50" />
		<col width="100" />
		<col width="100" />
		<col width="500" />
		<col width="200" />
		<col width="200" />
		<col width="50" />
		<col width="100" />
		
		<tr>
			<th>NO</th>
			<th>ID</th>
			<th>NAME</th>
			<th>ADDR</th>
			<th>PHONE</th>
			<th>EMAIL</th>
			<th>ENABLED</th>
			<th>ROLE</th>
		</tr>
		
<%
		for(LoginDto dto : list) {
%>

		<tr>
			<td><%=dto.getMyno() %></td>
			<td><%=dto.getMyid() %></td>
			<td><%=dto.getMyname() %></td>
			<td><%=dto.getMyaddr() %></td>
			<td><%=dto.getMyphone() %></td>
			<td><%=dto.getMyemail() %></td>
			<td><%=dto.getMyenabled().equals("Y") ? "가입" : "탈퇴" %></td>
			<td><%=dto.getMyrole() %></td>
		</tr>

<%
		}
%>
		
		<tr>
			<td colspan="8">
				<input type="button" value="메인" onclick="" />
			</td>
		</tr>
	</table>
		



</body>
</html>