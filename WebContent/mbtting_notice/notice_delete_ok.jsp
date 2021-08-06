<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%
	int n_no = Integer.parseInt(request.getParameter("n_no"));
	String n_pwd = request.getParameter("n_pwd");
	String n_type = request.getParameter("notice_type");
	
	BoardDBBean manager = BoardDBBean.getInstance();
	int re = manager.deleteNotice(n_no, n_pwd);
	
	if(re == 1) {
%>
		<script language="JavaScript">
			alert("글이 삭제되었습니다.");
		</script>
<%
		if(n_type.equals("board")) {
			response.sendRedirect("board_notice.jsp");
		} else if(n_type.equals("chatting")) {
			response.sendRedirect("chatting_notice.jsp");
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