<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%
	BoardDBBean manager = BoardDBBean.getInstance();
	int qna_no = Integer.parseInt(request.getParameter("qna_no"));
	int qna_c_no = Integer.parseInt(request.getParameter("qna_c_no"));   
	String q_type = request.getParameter("question_type");
	int re = manager.qnaDeleteComment(qna_c_no);
	
	
	if(re == 1) {
%>
		<script language="JavaScript">
			alert("댓글이 삭제되었습니다.");
			location.href="qna_show.jsp?qna_no=<%= qna_no%>&question_type=<%= q_type%>";
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
