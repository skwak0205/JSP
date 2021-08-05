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
	int seq = Integer.parseInt(request.getParameter("seq"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	MDBoardDto dto = new MDBoardDto(seq, title, content);
	MDBoardBiz biz = new MDBoardBizImpl();
	
	int res = biz.update(dto);
	if(res > 0) {
%>

	<script type="text/javascript">
		alert("글 수정 성공!");
		location.href="boardselect.jsp?seq=<%=seq%>";
	</script>

<%
	} else {
%>

	<script type="text/javascript">
		alert("글 수정 실패!")
		location.href="boardupdate.jsp?seq=<%=seq %>";
	</script>

<%
	}
%>

</body>
</html>