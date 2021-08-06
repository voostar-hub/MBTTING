<%@page import="board.BoardBean"%>
<%@page import="member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%
	String id = (String)session.getAttribute("id");
	String nick = (String)session.getAttribute("nick");
	MemberDBBean mdb = MemberDBBean.getInstance();
	String mbti = "";
	if(nick != null) {
		mbti = mdb.getMember(id).getMbti();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MBTTING</title>
<script type="text/javascript" src="../js/board.js" charset="utf-8"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mbtting.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" type="text/css" />
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&family=Poor+Story&family=Train+One&family=Ubuntu&family=Noto+Sans+KR:wght@500;700;900&family=Black+Han+Sans&display=swap"
	rel="stylesheet" />
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
					<button class="dropbtn" onclick="window.open('https://www.16personalities.com/ko/%EB%AC%B4%EB%A3%8C-%EC%84%B1%EA%B2%A9-%EC%9C%A0%ED%98%95-%EA%B2%80%EC%82%AC')">MBTI 성격 유형검사</button>
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
								<a href="../mbtting_notice/board_notice.jsp">공지사항</a>
							</div>
						</div>	
				<%
					} else {
						//분석형
						if(mbti.equals("INTJ") || mbti.equals("INTP") || mbti.equals("ENTJ") || mbti.equals("ENTP")) {
				%>		
							<div class="dropdown">
								<button class="dropbtn">MBTI게시판</button>
								<div class="dropdown-content">
									<a href="../mbtting_board/anal_board.jsp">분석형 게시판</a> 
									<a href="javascript:void(0);" onclick="board_dipl_check(); return false;">외교형 게시판</a> 
									<a href="javascript:void(0);" onclick="board_admin_check(); return false;">관리자형 게시판</a> 
									<a href="javascript:void(0);" onclick="board_exp_check(); return false;">탐험가형 게시판</a> 
									<a href="../mbtting_board/free_board.jsp">자유게시판</a>
									<a href="../mbtting_notice/board_notice.jsp">공지사항</a>
								</div>
							</div>
				<%
						// 외교형
						} else if(mbti.equals("INFJ") || mbti.equals("INFP") || mbti.equals("ENFJ") || mbti.equals("ENFP")) {
				%>
							<div class="dropdown">
								<button class="dropbtn">MBTI게시판</button>
								<div class="dropdown-content">
									<a href="javascript:void(0);" onclick="board_anal_check(); return false;">분석형 게시판</a> 
									<a href="../mbtting_board/dipl_board.jsp">외교형 게시판</a> 
									<a href="javascript:void(0);" onclick="board_admin_check(); return false;">관리자형 게시판</a> 
									<a href="javascript:void(0);" onclick="board_exp_check(); return false;">탐험가형 게시판</a> 
									<a href="../mbtting_board/free_board.jsp">자유게시판</a>
									<a href="../mbtting_notice/board_notice.jsp">공지사항</a>
								</div>
							</div>
				<%
						// 관리자형
						} else if(mbti.equals("ISTJ") || mbti.equals("ISFJ") || mbti.equals("ESTJ") || mbti.equals("ESFJ")) {
				%>
							<div class="dropdown">
								<button class="dropbtn">MBTI게시판</button>
								<div class="dropdown-content">
									<a href="javascript:void(0);" onclick="board_anal_check(); return false;">분석형 게시판</a> 
									<a href="javascript:void(0);" onclick="board_dipl_check(); return false;">외교형 게시판</a> 
									<a href="../mbtting_board/admin_board.jsp">관리자형 게시판</a> 
									<a href="javascript:void(0);" onclick="board_exp_check(); return false;">탐험가형 게시판</a> 
									<a href="../mbtting_board/free_board.jsp">자유게시판</a>
									<a href="../mbtting_notice/board_notice.jsp">공지사항</a>
								</div>
							</div>
				<%
						// 탐험가형
						} else if(mbti.equals("ISTP") || mbti.equals("ISFP") || mbti.equals("ESTP") || mbti.equals("ESFP")) {
				%>
							<div class="dropdown">
								<button class="dropbtn">MBTI게시판</button>
								<div class="dropdown-content">
									<a href="javascript:void(0);" onclick="board_anal_check();">분석형 게시판</a> 
									<a href="javascript:void(0);" onclick="board_dipl_check();">외교형 게시판</a> 
									<a href="javascript:void(0);" onclick="board_dipl_check();">관리자형 게시판</a> 
									<a href="../mbtting_board/exp_board.jsp">탐험가형 게시판</a> 
									<a href="../mbtting_board/free_board.jsp">자유게시판</a>
									<a href="../mbtting_notice/board_notice.jsp">공지사항</a>
								</div>
							</div>
				<%
						}
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
			<%
				if(id == null) {
			%>
				<div>
					<p>
						<a href="../mbtting_login/login.jsp" class="log">로그인</a> 
						<a href="../mbtting_login/register.jsp" class="log">회원가입</a>
					</p>
				</div>
			<%
				} else {
			%>
				<div>
					<p>
						<span class="logon"><%=nick %></span>님 |
						<a href="../mbtting_login/logOut.jsp" class="log">로그아웃</a> 
						<a href="../mbtting_login/myPage.jsp?user_id=<%= id %>" class="log">마이페이지</a>
					</p>
				</div>
			<%
				}
			%>
		</nav>
	</header>
	<hr />
		<div class="intro_div">
			<div class="intro_menu">
				<a href="mbtting_intro.jsp">서비스 소개</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="board_help.jsp">게시판 이용방법</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="chat_help.jsp">채팅 이용방법</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<hr>
			<h1 class="intro_header">MBTTING</h1>
			<p>
				반대가 끌리는 이유 My Best ChaTTing<br>
				MBTTING입니다.
			</p>
			<p>
				<img src="../images/mbti.png">
			</p>
			<p>
				MBTTING에서는<br>
				MBTI를 통해 자신과 비슷한, 혹은 반대되는<br>
				사람들과 소통할 수 있습니다.
			</p>
			<p>
				<img src="../images/chat1.png">
			</p>
			<p>
				MBTTING에서 대화를 통해<br>
				자신과 같은 MBTI 유형의 사람과<br>
				자신의 MBTI가 아닌, 다른 MBTI 유형의 사람과도<br>
				만나보고, 이야기해보세요.
			</p>
			<p>
				<img src="../images/chat2.png">
			</p>
			<p>
				여러 유형의 사람들과 소통해보시면<br>
				세상을 바라보는 시선이 조금은 바뀔 수 있습니다.<br>
			</p>
			<p>
				'저 사람은 왜 저래', 혹은<br>
				'이 사람은 무슨 생각일까' 와 같은 의문들이<br>
				어쩌면 하나 둘 이해가 되기 시작할 수 있습니다.
			</p>
			<p>
				그 사람의 겉으로 보여지는 말과 행동으로만<br>
				판단하는 것이 아니라 MBTI를 떠올림으로써,<br>
				속에 숨은 뜻을 찾을지도 모르니까요.   
			</p>
			<p>
				<img src="../images/chat3.png">
			</p>
			<p>
				반대가 끌리는 이유,
				바로 여기<br>
				<span>MBTTING에서 찾아보세요.</span>
			</p>
			<br><br>
		</div>
		<hr />
		<footer>
			  <div class="footer-content-top">
					<a href="/intro/about">About MBTTING</a> | <a href="#"
						data-toggle="modal" data-target="#userPrivacy">개인정보보호</a>
					| <a href="#">광고문의</a> | <a href="#">Contact</a> | <a
						href="https://www.facebook.com" target="_blank">Facebook</a> | <a
						href="https://github.com/" target="_blank">Github</a> v1.3.7
			  </div>
			  <hr />
		      <div class="footer-content-bottom">
		        <strong class="footer_str">상호명</strong> : (주)MBBTING | 
		        <strong class="footer_str">대표명</strong> : 김경윤| 
		        <strong class="footer_str">사업자등록번호</strong> : 010-6659-9709 |
		        <strong class="footer_str">문의</strong> : ruddbs273@naver.com <br />
		        <strong class="footer_str">주소</strong> : 부산광역시 부산남구 수영로 299, 루미너스 빌딩 10층 
		        <br />
		        @ 2021
		        <a href="#" target="_blank">Mbtting Management</a>
		      </div>
	    </footer>
</body>
</html>