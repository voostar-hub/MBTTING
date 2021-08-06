<%@page import="member.MemberDBBean"%>
<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%
	String nick = (String)session.getAttribute("nick");
	String pwd = request.getParameter("user_pw");
	MemberDBBean manager = MemberDBBean.getInstance();
	
	String pw = manager.getPW(nick);
	
	if(pw.equals(pwd)){ // 기존 패스워드와 작성한 패스워드가 같은지 비교
%>
		<script>
			alert("비밀번호가 확인되었습니다.");
			document.location.href="memberUpdate.jsp";
		</script>
<%
	} else { // 패스워드가 틀리다면
%>
		<script>
			alert("비밀번호가 맞지 않습니다.");
			history.go(-1);
		</script>
<%
	}
%>




