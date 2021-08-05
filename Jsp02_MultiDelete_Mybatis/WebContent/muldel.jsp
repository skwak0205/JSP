<%@page import="com.muldel.biz.MDBoardBiz"%>
<%@page import="com.muldel.biz.MDBoardBizImpl"%>
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
	// ?chk=value&chk=value&chk=value
	// 같은 이름으로 여러개의 값이 올 경우
	String[] seqs = request.getParameterValues("chk");

	if(seqs == null || seqs.length == 0){
%>

		<script type="text/javascript">
			alert("삭제할 글을 하나 이상 체크해 주세요!");
			location.href="boardlist.jsp";
		</script>

<%
	} else {
		MDBoardBiz biz = new MDBoardBizImpl();
		int res = biz.multiDelete(seqs);
		if(res == seqs.length){
%>
			<script type="text/javascript">
				alert("선택된 글들이 모두 삭제되었습니다.");
				location.href="boardlist.jsp";
			</script>
			
	<%
		} else {
	%>
			<script type="text/javascript">
				alert("선택된 글들이 삭제되지 않았습니다.");
				location.href="boardlist.jsp";
			</script>
	
	<%
		}	
	%>

<%
	}
%>



</body>
</html>