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

<script type="text/javascript">
	function updateinfo(myno) {
		location.href="logincontroller.jsp?command=updateinfoform&myno="+myno;
	}
	
	function cancel(myno) {
		location.href="logincontroller.jsp?command=cancel&myno="+myno;
	}

</script>

</head>
<body>

<%
	LoginDto dto = (LoginDto)request.getAttribute("dto");
%>


	<h1>USER INFO</h1>
	
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

		
		<tr>
			<td colspan="8">
				<input type="button" value="정보수정" onclick="updateinfo(<%=dto.getMyno() %>)" />
				<input type="button" value="탈퇴" onclick="cancel(<%=dto.getMyno() %>)" />
				<input type="button" value="메인" onclick="" />
			</td>
		</tr>
	</table>

</body>
</html>