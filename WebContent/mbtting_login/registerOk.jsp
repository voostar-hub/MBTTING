<%@page import="java.sql.Timestamp"%>
<%@page import="member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mb" class="member.MemberBean"></jsp:useBean>
<jsp:setProperty property="*" name="mb"/>

<%
	request.getParameter(mb.getUser_email2());
	MemberDBBean manager=MemberDBBean.getInstance();
	mb.setReg_date(new Timestamp(System.currentTimeMillis()));

	if(manager.confirmID(mb.getUser_id()) == 1){
%>
		<script>
			alert("중복되는 아이디가 존재합니다.");
			history.back();
		</script>
<%
	}else{
		int re = manager.insertMember(mb);
		
		if(re == 1){
%>
		<script>
			alert("회원가입을 축하드립니다.\n회원으로 로그인 해주세요.");
			document.location.href="login.jsp";
		</script>
<%
		} else {
%>
		<script>
			alert("회원가입에 실패했습니다.");
			document.location.href="../mbtting_board/mainpage.jsp";
		</script>
<%
		}
	}
%>

