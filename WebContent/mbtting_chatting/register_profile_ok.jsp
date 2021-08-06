<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bd" class="board.BoardBean"></jsp:useBean>
<jsp:setProperty property="*" name="bd"/>
 <%
 	request.setCharacterEncoding("utf-8");
	bd.setReg_date(new Timestamp(System.currentTimeMillis()));
	String content = request.getParameter("p_content");
	String nick = request.getParameter("user_nick");
	String mbti = request.getParameter("mbti");
	BoardDBBean db = BoardDBBean.getInstance();
	int re = db.insertChatProfile(bd, nick, mbti);
	if(re == 1) {
%>
		<script>
			alert("프로필을 등록 했습니다.");
			document.location.href="chatting_main.jsp";
		</script>		
<%
	} else {
%>
		<script>
			alert("프로필을 등록에 실패했습니다.");
			history.go(-1);
		</script>		
<%
	}

%>