<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	int qna_no = Integer.parseInt(request.getParameter("qna_no"));
	String qna_pwd = request.getParameter("qna_pwd");
	String q_type = request.getParameter("question_type");
	
	BoardDBBean manager = BoardDBBean.getInstance();
	int re = manager.deleteQna(qna_no, qna_pwd);
	
	if(re == 1) {
%>
		<script language="JavaScript">
			alert("글이 삭제되었습니다.");
		</script>
<%
		if(q_type.equals("board")) {
			response.sendRedirect("board_qna.jsp");
		} else if(q_type.equals("chatting")) {
			response.sendRedirect("chatting_qna.jsp");
		} else if(q_type.equals("etc")) {
			response.sendRedirect("etc_qna.jsp");
		} 
	} else if(re == 0) {
%>
		<script language="JavaScript">
			alert("비밀번호가 틀렸습니다.");
			history.go(-1);
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