<%@page import="member.MemberDBBean"%>
<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%
	String nick = (String)session.getAttribute("nick");
	String pwd = request.getParameter("user_pw"); //입력한 비밀번호
	MemberDBBean manager = MemberDBBean.getInstance();
	String pw = manager.getPW(nick); // 현재 접속중인 아이디의 DB에 저장된 비밀번호
	
	boolean result = manager.deleteMember(nick, pw);;
	
	if(result){ // result = true 면 탈퇴  
%>
		<script>
			alert("탈퇴되었습니다. 메인 화면으로 이동합니다.");
			location.href="../mbtting_board/mainpage.jsp";
		</script>
<%
		session.invalidate();
	} else { // false
%>
		<script>
			alert("비밀번호가 맞지 않습니다.");
			history.go(-1);
		</script>
<%
	}
%>




