<%@page import="board.BoardDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<jsp:useBean id="bd" class="board.BoardBean"/>
<jsp:setProperty property="*" name="bd"/>
<%
	bd.setC_time(new Timestamp(System.currentTimeMillis()));
	BoardDBBean manager = BoardDBBean.getInstance();
	int b_no = Integer.parseInt(request.getParameter("b_no"));
	String type = request.getParameter("board_type");
	String nick = (String)session.getAttribute("nick");
	int re = manager.insertComment(bd, b_no, nick);
	if(re == 1) {
%>
		<script>location.href="show.jsp?b_no=<%= b_no%>&board_type=<%= type %>"</script>
<%
	}
%>




