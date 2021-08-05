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

<script type="text/javascript">
	function updateRole(myno) {
		location.href="logincontroller.jsp?command=updateroleform&myno="+myno;
	}
</script>

</head>
<body>

<%
	List<LoginDto> list = (List<LoginDto>)request.getAttribute("list");

	LoginDto logindto = (LoginDto) session.getAttribute("dto");
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
		<col width="50" />
		
		
		<tr>
			<th>NO</th>
			<th>ID</th>
			<th>NAME</th>
			<th>ADDR</th>
			<th>PHONE</th>
			<th>EMAIL</th>
			<th>ENABLED</th>
			<th>ROLE</th>
			<th>등급변경</th>
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
			<td><%=dto.getMyenabled() %></td>
			<td><%=dto.getMyrole() %></td>
			<td><input type="button" value="변경" onclick="updateRole(<%=dto.getMyno() %>)" /></td>
		</tr>

<%
		}
%>
		
		<tr>
			<td colspan="9">
				<input type="button" value="메인" onclick="" />
			</td>
		</tr>
	</table>
		

</body>
</html>