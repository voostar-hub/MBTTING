<%@page import="member.MemberDBBean"%>
<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("user_id");
	String pwd = request.getParameter("user_pw");
	String mbti = request.getParameter("mbti");
	MemberDBBean manager = MemberDBBean.getInstance();

	int check = manager.userCheck(id, pwd);
	MemberBean mb = manager.getMember(id);

	if(mb == null){
%>
		<script>
			alert("존재하지 않는 회원입니다.");
			history.go(-1);
		</script>
<%
	}else {
		String nick = mb.getUser_nick();
		String name = mb.getUser_name();
		
		if(check == 1){
			session.setAttribute("id", id);
			session.setAttribute("nick", nick);
			session.setAttribute("name", name);
			session.setAttribute("mbti", mbti);
			session.setAttribute("Member", "yes");
			session.setMaxInactiveInterval(60*60*24);
			response.sendRedirect("../mbtting_board/mainpage.jsp");
		}else if(check == 0){
%>
			<script>
				alert("비밀번호가 맞지 않습니다.");
				history.go(-1);
			</script>
<%
		}else {
			/*실제 테스트시에는 이 케이스는 제외됨*/
%>
			<script>
				alert("아이디가 맞지 않습니다.");
				history.go(-1);
			</script>
<%
		}
	}
%>




