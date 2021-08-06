<%@page import="board.BoardDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<jsp:useBean id="bd" class="board.BoardBean"/>
<jsp:setProperty property="*" name="bd"/>
<%
	bd.setQna_c_time(new Timestamp(System.currentTimeMillis()));
	BoardDBBean manager = BoardDBBean.getInstance();
	int qna_no = Integer.parseInt(request.getParameter("qna_no"));
	String q_type = request.getParameter("question_type");
	String nick = (String)session.getAttribute("nick");
	int re = manager.qnaInsertComment(bd, qna_no, nick);
	if(re == 1) {
%>
		<script>location.href="qna_show.jsp?qna_no=<%= qna_no%>&question_type=<%= q_type %>"</script>
<%
	}
%>




