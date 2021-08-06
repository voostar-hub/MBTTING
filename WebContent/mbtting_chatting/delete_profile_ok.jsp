<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardDBBean db = BoardDBBean.getInstance();
	String nick = (String)session.getAttribute("nick");
	
	db.deleteChatProfile(nick);
	response.sendRedirect("chatting_main.jsp");
%>