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
		<div class="boardhelp_div">
			<div class="boardhelp_menu">
				<a href="mbtting_intro.jsp">서비스 소개</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="board_help.jsp">게시판 이용방법</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="chat_help.jsp">채팅 이용방법</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<hr>
			<div>
				<h1 class="boardhelp_header">채팅 이용 방법</h1>
				<p>
					채팅 이용 방법에 대해 설명드리겠습니다.<br>
				</p>
				<br><br>
				<p>
					<img src="../images/chat_help_1.png">
				</p>
				<p>
					MBTTING(채팅) 메뉴를 클릭합니다.<br>
				</p>
				<p>
					<img src="../images/chat_help_2.png">
				</p>
				<p>
					MBTTING PROFILE 화면에서<br>
					우측 상단의 프로필 등록 버튼을 클릭합니다.<br>
				</p>
				<p>
					<img src="../images/chat_help_3.png">
				</p>
				<p>
					본인 소개글을 입력 후 등록하기를 눌러 프로필을 등록합니다.<br>
				</p>
				<p>
					<img src="../images/chat_help_4.png">
				</p>
				<p>
					MBTTING PROFILE 화면에서 본인의 프로필을 확인할 수 있으며,<br>
					비 로그인 시 프로필 작성 및 채팅이 불가능하오니 회원 가입 및 로그인 후 이용 바랍니다.<br>
				</p>
				<p>
					<img src="../images/chat_help_5.png">
				</p>
				<p>
					프로필에 마우스를 올리면 프로필이 뒤집히며, <br>
					해당 프로필의 소개글이 나타납니다.<br>
				</p>
				<p>
					<img src="../images/chat_help_6.png">
				</p>
				<p>
					각 프로필의 소개글을 클릭하면 채팅 화면으로 넘어가며,<br>
					메세지를 입력 후 우측의 전송 버튼을 클릭하여 전송할 수 있습니다.<br>
				</p>
				<p>
					<img src="../images/chat_help_7.png">
				</p>
				<p>
					자신에게 온 메세지는 MBTTING PROFILE 화면의 우측 상단,<br>
					메세지 함에서 확인이 가능합니다. 
				</p>
				<p>
					<img src="../images/chat_help_8.png">
				</p>
				<p>
					메세지 함을 클릭하면 주고받은 메세지 목록이 나타나며,<br>
					메세지를 보낸 사람 및 가장 최근에 전송한 메세지 내용,<br>
					총 메세지 갯수와 보낸 시간을 확인하실 수 있습니다.<br>
				</p>
			</div>
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