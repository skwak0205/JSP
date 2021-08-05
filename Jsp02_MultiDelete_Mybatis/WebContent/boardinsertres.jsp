<%@page import="com.muldel.biz.MDBoardBizImpl"%>
<%@page import="com.muldel.biz.MDBoardBiz"%>
<%@page import="com.muldel.dto.MDBoardDto"%>
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
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	MDBoardDto dto = new MDBoardDto(writer, title, content);
	MDBoardBiz biz = new MDBoardBizImpl();
	int res = biz.insert(dto);
	if(res > 0) {
%>
	
		<script type="text/javascript">
			alert("글 추가 성공!")
			location.href="boardlist.jsp";
		</script>
<%
	} else {
%>
		<script type="text/javascript">
			alert("글 추가 실패!");
			location.href="boardinsert.jsp";
		</script>

<%
	}
%>

</body>
</html>