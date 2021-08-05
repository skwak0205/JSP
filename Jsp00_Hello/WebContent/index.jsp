<%@page import="com.dept.dto.DeptDto"%>
<%@page import="java.util.List"%>
<%@page import="com.dept.dao.DeptDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	// scriptlet : java code 영역
	DeptDao dao = new DeptDao();
	List<DeptDto> list = dao.selectList();
%>

	<h1>DEPT</h1>
	
	<table border="1">
		<tr>
			<th>deptno</th>
			<th>dname</th>
			<th>loc</th>
		</tr>
		
		<%
			// java code
			// 서버에서 컴파일 하면서 실행 후 html문서로 서버에서 응답
			for(int i = 0; i < list.size(); i++){
		%>
		
			<tr>
				<td><%=list.get(i).getDeptno() %></td> <%-- <%= %>: 자바의 값을 html에 넣어줌 --%>
				<td><%=list.get(i).getDname() %></td>
				<td><%=list.get(i).getLoc() %></td>
			</tr>
		
		<%
			}
		%>
	</table>

</body>
</html>