<%@page import="com.mvc.dto.MVCDto"%>
<%@page import="java.util.List"%>
<%@page import="com.mvc.biz.MVCBizImpl"%>
<%@page import="com.mvc.biz.MVCBiz"%>
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
	String command = request.getParameter("command");
	System.out.println("<"+command+">");
	
	MVCBiz biz = new MVCBizImpl();
	
	if(command.equals("list")) {
		// 1. 전달된 값이 있으면 받아주자.
		// 2. 필요하다면, db와 연결하자.
		List<MVCDto> list = biz.selectList();
		
		// 3. 보내줄 값이 있다면, request에 담자.
		request.setAttribute("list", list);	// setAttribute(String name, Object o) --> Object가 제일 큰 범위라서 사용
		
		// 4. 보내자.
		pageContext.forward("mvclist.jsp");
		
	} else if (command.equals("insertform")) {
		// 1. 
		// 2.
		// 3.
		// 4.
		response.sendRedirect("mvcinsert.jsp");
		
	} else if (command.equals("insertres")) {
		// 1.
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		// 2.
		MVCDto dto = new MVCDto(writer, title, content);
		int res = biz.insert(dto);
		
		// 3.
		// 4.
		if (res > 0) {
			
%>
			<script type="text/javascript">
				alert("글 작성 성공!");
				location.href="mvccontroller.jsp?command=list";
			</script>
		
<%
		} else {
%>
		
			<script type="text/javascript">
				alert("글 작성 실패!");
				location.href="mvccontroller.jsp?command=insertform";
			</script>
<%
		}
	} else if (command.equals("detail")) {
		int seq = Integer.parseInt(request.getParameter("seq"));
		MVCDto dto = biz.selectOne(seq);
		request.setAttribute("detail", dto);
		pageContext.forward("mvcselect.jsp");
	
	} else if (command.equals("updateform")){
		int seq = Integer.parseInt(request.getParameter("seq"));
		MVCDto dto = biz.selectOne(seq);
		request.setAttribute("select", dto);
		pageContext.forward("mvcupdate.jsp");
		
	} else if (command.equals("updateres")) {
		int seq = Integer.parseInt(request.getParameter("seq"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		MVCDto dto = new MVCDto(seq, title, content);
		int res = biz.update(dto);
		if (res > 0) {
			List<MVCDto> list = biz.selectList();
			request.setAttribute("list", list);
			pageContext.forward("mvclist.jsp");
		} else {
			MVCDto updateDto = biz.selectOne(seq);
			request.setAttribute("detail", updateDto);
			pageContext.forward("mvc.select.jsp");
		}
	} else if (command.equals("delete")) {
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		int res = biz.delete(seq);
		if (res > 0) {

%>

			<script type="text/javascript">
				alert("글 삭제 성공!");
				location.href="mvccontroller.jsp?command=list";
			</script>

<%
		} else {
%>

			<script type="text/javascript">
				alert("글 삭제 실패!");
				location.href="mvccontroller.jsp?command=detail&seq=<%=seq %>";
			</script>

<%
		}
	}
%>
		


	<h1>잘못왔다....</h1>
</body>
</html>