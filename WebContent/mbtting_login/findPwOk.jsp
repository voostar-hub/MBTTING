<%@page import="member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%
	MemberDBBean db = MemberDBBean.getInstance();
	String nick = (String)session.getAttribute("nick");
	String id = request.getParameter("user_id");
	String name = request.getParameter("user_name");
	String email = request.getParameter("user_email");
	String email2 = request.getParameter("user_email2");
	String pw = db.findPw(id, name, email, email2);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="../js/board.js" charset="utf-8"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mbtting.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/reset.css" type="text/css" />
<link
  href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&family=Poor+Story&family=Train+One&family=Ubuntu&family=Noto+Sans+KR:wght@500;700;900&family=Black+Han+Sans&display=swap"
  rel="stylesheet"
/>
</head>
<body>
	<header>
		<!-- 페이지 이름 -->
		<div class="head">
			<p class="mbc">반대가 끌리는 이유? My Best chaTTing</p>
			<h1 id="mbting">
				<p>
					<a href="../mbtting_board/mainpage.jsp">MBTTING</a>
				</p>
			</h1>
		</div>
		<!-- 메뉴바 -->
		<nav id="navbar">
			<div class="menubar">
				<div class="dropdown">
					<button class="dropbtn">MBTI 성격 유형검사</button>
				</div>
				<%
					if(nick == null) { // 로그인여부에 따라 나눠짐
				%>
						<div class="dropdown">
							<button class="dropbtn">MBTI게시판</button>
							<div class="dropdown-content">
								<a href="../mbtting_login/login.jsp">분석형 게시판</a> 
								<a href="../mbtting_login/login.jsp">외교형 게시판</a> 
								<a href="../mbtting_login/login.jsp">관리자형 게시판</a> 
								<a href="../mbtting_login/login.jsp">탐험가형 게시판</a> 
								<a href="../mbtting_board/free_board.jsp">자유게시판</a>
								<a href="../mbtting_notice/notice.jsp">공지사항</a>
							</div>
						</div>	
				<%
					} 
				%>		
				<%
					if(nick != null) {
				%>
						<div class="dropdown">
							<button class="dropbtn" onclick="location.href='../mbtting_chatting/chatting_main.jsp'">MBTTING(채팅)</button>
						</div>
				<%
					} else {
				%>
						<div class="dropdown">
							<button class="dropbtn" onclick="location.href='../mbtting_login/login.jsp'">MBTTING(채팅)</button>
						</div>
				<%
					}
				%>
				<div class="dropdown">
					<button class="dropbtn">서비스 소개</button>
					<div class="dropdown-content">
						<a href="../mbtting_intro/mbtting_intro.jsp">서비스 소개</a> 
						<a href="../mbtting_faq/faq_list.jsp">자주 물어보는 질문</a>  
<%
					if(nick == null) { // 로그인여부에 따라 나눠짐
%>
						<a href="../mbtting_login/login.jsp">QNA</a>
<%
					}else {
%>
						<a href="../mbtting_qna/board_qna.jsp">QNA</a>
<%
					}				
%>
					</div>
				</div>
			</div>
			<!-- 로그인, 회원가입 -->
			<div>
				<p>
				    <a href="../mbtting_login/login.jsp" class="log">로그인</a>
				    <a href="../mbtting_login/register.jsp" class="log">회원가입</a>
				</p>
			</div>
		</nav>
	</header>
	<hr />
	<div class="find_frm_div">
		<h1 class="find_header">비밀번호 찾기</h1>
	</div>
	<div class="find_inf">
		<div>
		<%
			if(pw == null){
		%>
				<p>가입하신 정보가 없습니다.</p>
		<%
			} else {
		%>		
				<p>가입하신 아이디의 비밀번호는 <strong class="find_strong"><%= pw %></strong>입니다.</p>
		<%
			}
		%>			
		</div>
		<div>
			<input class="find_sub" type="submit" value="로그인 화면으로 돌아가기" 
					onclick="javascript:window.location='login.jsp'">
		</div>
	</div>
	<footer>
		<hr>
		<div class="footer-content-top">
			<a href="/intro/about">About MBTTING</a> | <a href="#"
				data-toggle="modal" data-target="#userPrivacy">개인정보보호</a> | <a
				href="#">광고문의</a> | <a href="#">Contact</a> | <a
				href="https://www.facebook.com" target="_blank">Facebook</a> | <a
				href="https://github.com/" target="_blank">Github</a> v1.3.7
		</div>
		<hr />
		<div class="footer-content-bottom">
			<strong class="footer_str">상호명</strong> : (주)MBBTING | <strong
				class="footer_str">대표명</strong> : 김경윤| <strong class="footer_str">사업자등록번호</strong>
			: 010-6659-9709 | <strong class="footer_str">문의</strong> :
			ruddbs273@naver.com <br /> <strong class="footer_str">주소</strong> :
			부산광역시 부산남구 수영로 299, 루미너스 빌딩 10층 <br /> @ 2021 <a href="#"
				target="_blank">Mbtting Management</a>
		</div>
	</footer>
</body>
</html>