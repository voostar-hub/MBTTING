<%@page import="board.BoardDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<jsp:useBean id="bd" class="board.BoardBean"/>
<jsp:setProperty property="*" name="bd"/>
<%
	bd.setDate(new Timestamp(System.currentTimeMillis()));
	BoardDBBean manager = BoardDBBean.getInstance();
	//글 작성후 어디 게시판으로 보낼지 선택하기 위한 변수
	String n_type = bd.getNotice_type();
	String nick = (String)session.getAttribute("nick");
	int re = manager.insertNotice(bd, nick);
	if(re == 1) {
%>
	<script>
		alert("글을 등록 하셨습니다.");
		<%
			out.println(n_type);
			if(n_type.equals("board")) {
				response.sendRedirect("board_notice.jsp");
			} else if(n_type.equals("chatting")) {
				response.sendRedirect("chatting_notice.jsp");
			} 
		%>
	</script>
<%
	}else {
%>
	<script>
		alert("글 등록에 실패했습니다.");
	</script>
<%
		response.sendRedirect("notice_write.jsp");		
	}
%>