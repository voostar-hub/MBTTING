<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%
	int b_no = Integer.parseInt(request.getParameter("b_no"));
	String type = request.getParameter("board_type");
	BoardDBBean manager = BoardDBBean.getInstance();
	
	String logon_nick = (String)session.getAttribute("nick");
	String writer = manager.getBoard(b_no).getUser_nick(); 
	String nick = manager.getGoodNick(b_no);
	// 접속해있는 계정이 좋아요체크 테이블에 해당 글번호에 이름이 없을때만 저장함
	if(!nick.equals(logon_nick)) {
		int re = manager.insertGoodcheck(logon_nick, b_no);
		manager.updateGoodCount(b_no);
%>
		<script language="JavaScript">
			location.href="show.jsp?b_no=<%= b_no%>&board_type=<%= type %>";
		</script>
<% 
	}
%>
	<script language="JavaScript">
		alert("추천은 한번만 누를 수 있습니다.");
		history.go(-1);
	</script>