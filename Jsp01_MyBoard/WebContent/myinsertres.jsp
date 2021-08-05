<%@page import="com.my.dto.MyBoardDto"%>
<%@page import="com.my.biz.MyBoardBiz"%>
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
	String myname = request.getParameter("myname");
	String mytitle = request.getParameter("mytitle");
	String mycontent = request.getParameter("mycontent");
	
	MyBoardDto dto = new MyBoardDto();
	dto.setMyname(myname);
	dto.setMytitle(mytitle);
	dto.setMycontent(mycontent);
	
	MyBoardBiz biz = new MyBoardBiz();
	int res = biz.insert(dto);
	if(res > 0) {
%>
	
	<script type="text/javascript">
		alert("추가 성공!");
		location.href="mylist.jsp";
	</script>
		
<%
	} else {
%>

	<script type="text/javascript">
		alert("추가 실패!");
		history.back();
	</script>

<%
	}
%>


</body>
</html>