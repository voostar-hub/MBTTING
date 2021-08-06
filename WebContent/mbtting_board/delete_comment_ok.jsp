<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%
	BoardDBBean manager = BoardDBBean.getInstance();
	int b_no = Integer.parseInt(request.getParameter("b_no"));
	int c_no = Integer.parseInt(request.getParameter("c_no"));
	System.out.println(c_no);
	String type = request.getParameter("board_type");
	int re = manager.deleteComment(c_no);
	
	if(re == 1) {
%>
		<script language="JavaScript">
			alert("댓글이 삭제되었습니다.");
			location.href="show.jsp?b_no=<%= b_no%>&board_type=<%= type%>";
		</script>
<%
	} else {
%>
		<script language="JavaScript">
			alert("삭제에 실패했습니다.");
			history.go(-1);
		</script>
<%				
	}

%>		
