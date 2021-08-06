<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bd" class="board.BoardBean"></jsp:useBean>
<jsp:setProperty property="*" name="bd"/>
<%
	bd.setReg_date(new Timestamp(System.currentTimeMillis())); 
	BoardDBBean db = BoardDBBean.getInstance();
	String nick = request.getParameter("user_nick");
	String p_content = request.getParameter("p_content");
	int re = db.editChatProfile(nick, p_content, bd);
	
	if(re == 1) {
%>
		<script>
			alert("프로필을 수정 했습니다.");
			document.location.href="chatting_main.jsp";
		</script>		
<%
	} else {
%>
		<script>
			alert("프로필 수정에 실패했습니다.");
			history.go(-1);
		</script>		
<%
	}
%>