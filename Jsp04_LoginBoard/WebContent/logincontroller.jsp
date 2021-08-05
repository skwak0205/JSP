<%@page import="java.util.List"%>
<%@page import="com.login.dto.LoginDto"%>
<%@page import="com.login.dao.LoginDao"%>
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
	System.out.println("[" + command + "]");
	
	LoginDao dao = new LoginDao();
	
	if (command.equals("login")) {
		// 1.
		String myid = request.getParameter("myid");
		String mypw = request.getParameter("mypw");
		
		// 2.
		LoginDto dto = dao.login(myid, mypw);
		
		
		if (dto != null) {
			// 3.
			// session scope에 담기
			session.setAttribute("dto", dto);
			
			// 특정 시간동안 활동이 없으면 session 만료
			// session은 만료되기 전까지 어디서든 사용 가능
			session.setMaxInactiveInterval(10 * 60);
			
			// 4.
			if (dto.getMyrole().equals("ADMIN")) {
				response.sendRedirect("adminmain.jsp");
				
			} else if (dto.getMyrole().equals("USER")) {
				// session은 만료되기 전까지 어디서든 사용 가능
				// 그래서 sendRedirect 사용
				response.sendRedirect("usermain.jsp");
			}
		} else {
%>
			<script type="text/javascript">
				alert("login 실패");
				location.href="index.html";
			</script>
<%
		} 
		
	} else if (command.equals("logout")) {
		// session 만료
		session.invalidate();
		response.sendRedirect("index.html");
		
	} else if (command.equals("userlistall")) {
		List<LoginDto> list = dao.selectAllList();
		request.setAttribute("list", list);
		pageContext.forward("userlistall.jsp");
	
	} else if (command.equals("userlistenabled")) {
		List<LoginDto> list = dao.selectEnabledList();
		request.setAttribute("list", list);
		pageContext.forward("userlistenabled.jsp");
		
	} else if (command.equals("updateroleform")) {
		int myno = Integer.parseInt(request.getParameter("myno"));
		LoginDto dto = dao.selectOne(myno);
		request.setAttribute("dto", dto);
		pageContext.forward("updateroleform.jsp");
		
	} else if (command.equals("updaterole")) {
		int myno = Integer.parseInt(request.getParameter("myno"));
		String myrole = request.getParameter("myrole");
		int res = dao.updateRole(myno, myrole);
		if(res > 0) {	
%>

			<script type="text/javascript">
				alert("회원등급 조정 성공");
				location.href="logincontroller.jsp?command=userlistenabled";
			</script>
	
<%
		} else {
%>
			<script type="text/javascript">
				alert("회원등급 조정 실패");
				location.href="logincontroller.jsp?command=updateroleform&myno=<%=myno%>";
			</script>
<%
		}

	} else if (command.equals("registerform")) {
		response.sendRedirect("registerform.jsp");
		
	} else if (command.equals("idchk")) {
		String myid = request.getParameter("myid");
		LoginDto dto = dao.idCheck(myid);
		
		boolean idnotused = true;
		if (dto.getMyid() != null) {
			idnotused = false;
		}
		
		response.sendRedirect("idchk.jsp?idnotused="+idnotused);
		
	} else if (command.equals("register")) {
		String myid = request.getParameter("myid");
		String mypw = request.getParameter("mypw");
		String myname = request.getParameter("myname");
		String myaddr = request.getParameter("myaddr");
		String myphone = request.getParameter("myphone");
		String myemail = request.getParameter("myemail");
		
		LoginDto dto = new LoginDto(0, myid, mypw, myname, myaddr, myphone, myemail, null, null);
		int res = dao.insert(dto);
		if (res > 0) {
%>
			<script type="text/javascript">
				alert("회원 가입 성공");
				location.href="index.html";
			</script>
<%
		} else {
%>			
			<script type="text/javascript">
				alert("회원 가입 실패");
				location.href="logincontroller.jsp?command=registerform";
			</script>

<%
		}
		
	} else if (command.equals("userinfo")) {
		int myno = Integer.parseInt(request.getParameter("myno"));
		LoginDto dto = dao.selectOne(myno);
		request.setAttribute("dto", dto);
		pageContext.forward("userinfo.jsp");
		
	} else if (command.equals("updateinfoform")) {
		int myno = Integer.parseInt(request.getParameter("myno"));
		LoginDto dto = dao.selectOne(myno);
		request.setAttribute("dto", dto);
		pageContext.forward("updateinfoform.jsp");
		
	} else if (command.equals("updateinfo")) {
		int myno = Integer.parseInt(request.getParameter("myno"));
		String mypw = request.getParameter("mypw");
		String myaddr = request.getParameter("myaddr");
		String myphone = request.getParameter("myphone");
		String myemail = request.getParameter("myemail");
		LoginDto dto = new LoginDto(myno, null, mypw, null, myaddr, myphone, myemail, null, null);
		
		int res = dao.update(dto);
		if (res > 0) {
%>
			<script type="text/javascript">
				alert("정보 수정 성공");
				location.href="logincontroller.jsp?command=userinfo&myno=<%=myno%>";
			</script>
<%
		} else {
%>
			<script type="text/javascript">
				alert("정보 수정 실패");
				location.href="logincontroller.jsp?command=updateinfoform&myno=<%=myno%>";
			</script>
<%
		}
		
	} else if (command.equals("cancel")) {
		int myno = Integer.parseInt(request.getParameter("myno"));
		int res = dao.delete(myno);
		if (res > 0) {
%>

			<script type="text/javascript">
				alert("탈퇴 성공");
				location.href="index.html";
			</script>

<%
		} else {
%>
			<script type="text/javascript">
				alert("탈퇴 실패");
				location.href="logincontroller.jsp?command=userinfo&myno=<%=myno %>";
			</script>
<%
		}
	}

%>


	<h1 style="color: red;">잘못왔다!!!!!</h1>
	<p>
		내가 보이면....<br />
		command 확인!!!!!!<br />
	</p>


</body>
</html>