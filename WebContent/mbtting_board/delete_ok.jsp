<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%
	int b_no = Integer.parseInt(request.getParameter("b_no"));
	String pwd = request.getParameter("pwd");
	String type = request.getParameter("board_type");
	
	BoardDBBean manager = BoardDBBean.getInstance();
	int re = manager.deleteBoard(b_no, pwd);
	
	if(re == 1) {
%>
		<script language="JavaScript">
			alert("글이 삭제되었습니다.");
		</script>
<%
		if(type.equals("free")) {
			response.sendRedirect("free_board.jsp");
		} else if(type.equals("anal")) {
			response.sendRedirect("anal_board.jsp");
		} else if(type.equals("dipl")) {
			response.sendRedirect("dipl_board.jsp");
		} else if(type.equals("exp")) {
			response.sendRedirect("exp_board.jsp");
		} else if(type.equals("admin")) {
			response.sendRedirect("admin_board.jsp");
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