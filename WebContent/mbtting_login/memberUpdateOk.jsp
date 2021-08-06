<%@page import="java.sql.Timestamp"%>
<%@page import="member.MemberBean"%>
<%@page import="member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mb" class="member.MemberBean"></jsp:useBean>
<jsp:setProperty property="*" name="mb"/>
<% 
	String id = (String)session.getAttribute("id");
	mb.setUser_id(id);
	mb.setUp_date(new Timestamp(System.currentTimeMillis()));
	
	MemberDBBean manager = MemberDBBean.getInstance();
	int re = manager.updateMember(mb);
	
	if(re == 1){
%>
		<script>
			alert("회원 정보가 수정되었습니다.");
			document.location.href="memberUpdate.jsp";
		</script>
<%
	}else{
%>
		<script>
			alert("수정에 실패했습니다.");
			history.go(-1);
		</script>
<%
	}
%>