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
	String type = bd.getBoard_type();
	String nick = (String)session.getAttribute("nick");
	int re = manager.insertBoard(bd, nick);
	if(re == 1) {
%>
	<script>
		alert("글을 등록 하셨습니다.");
		<%
			if(type.equals("free")) {
				response.sendRedirect("free_board.jsp");
			} else if(type.equals("anal")) {
				response.sendRedirect("anal_board.jsp");
			} else if(type.equals("dipl")) {
				response.sendRedirect("dipl_board.jsp");
			} else if(type.equals("admin")) {
				response.sendRedirect("admin_board.jsp");
			} else if(type.equals("exp")) {
				response.sendRedirect("exp_board.jsp");
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
		response.sendRedirect("write.jsp");		
	}
%>