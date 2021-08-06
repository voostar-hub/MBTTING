<%@page import="chat.ChatBean"%>
<%@page import="chat.ChatDBBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDBBean"%>
<%@page import="member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("id");
String nick = (String)session.getAttribute("nick");
MemberDBBean mdb = MemberDBBean.getInstance();
ChatDBBean cdb = ChatDBBean.getInstance();
ChatBean chatBean = new ChatBean();
int unr_cnt = cdb.getAllUnreadChat(nick);
BoardDBBean db = BoardDBBean.getInstance();
String mbti = "";
if(nick != null) {
	mbti = mdb.getMember(id).getMbti();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지 함</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="shortcut icon" href="#">
<script type="text/javascript"> //읽지않은 메세지 갯수출력을 위한 ajax
</script>
<script type="text/javascript" src="../js/board.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/chat.js" charset="utf-8"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mbtting.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/chatting.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/reset.css" type="text/css" />
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
				<a href="../mbtting_board/mainpage.jsp">MBTTING</a>
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
								<a href="../mbtting_login/login.jsp">공지사항</a>
							</div>
						</div>	
				<%
					} else {
						//분석형
						if(mbti.equals("INTJ") || mbti.equals("INTP") || mbti.equals("ENTJ") || mbti.equals("ENTP") ) {
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
									<a href="javascript:void(0);" onclick="board_admin_check();">관리자형 게시판</a> 
									<a href="../mbtting_board/exp_board.jsp">탐험가형 게시판</a> 
									<a href="../mbtting_board/free_board.jsp">자유게시판</a>
									<a href="../mbtting_notice/board_notice.jsp">공지사항</a>
								</div>
							</div>
				<%
						} else {
				%>
							<div class="dropdown">
								<button class="dropbtn">MBTI게시판</button>
								<div class="dropdown-content">
									<a href="javascript:void(0);" onclick="board_anal_check();">분석형 게시판</a> 
									<a href="javascript:void(0);" onclick="board_dipl_check();">외교형 게시판</a> 
									<a href="javascript:void(0);" onclick="board_admin_check();">관리자형 게시판</a> 
									<a href="javascript:void(0);" onclick="board_exp_check();">탐험가형 게시판</a> 
									<a href="../mbtting_board/free_board.jsp">자유게시판</a>
									<a href="../mbtting_notice/board_notice.jsp">공지사항</a>
								</div>
							</div>
				<%
						}
					}
				%>
				<div class="dropdown">
					<button class="dropbtn" onclick="location.href='../mbtting_chatting/chatting_main.jsp'">MBTTING(채팅)</button>
				</div>
				<div class="dropdown">
					<button class="dropbtn">서비스 소개</button>
					<div class="dropdown-content">
						<a href="../mbtting_intro/mbtting_intro.jsp">서비스 소개</a> 
						<a href="../mbtting_faq/faq_list.jsp">자주 물어보는 질문</a> 
						<a href="../mbtting_qna/board_qna.jsp">QNA</a>
					</div>
				</div>
			</div>
			<!-- 로그인, 회원가입 -->
<%
				if(nick == null) {
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
							<a href="../mbtting_login/myPage.jsp" class="log">마이페이지</a>
						</p>
					</div>
<%	
				}
%>
		</nav>
	</header>
	<hr />
	<header class="board-header">
      <h1><a href="../mbtting_chatting/message_box.jsp">메세지 함</a></h1>
    </header>
	<hr />
	<div class="mes_index">주고받은 메세지 목록</div>
	<%
			ArrayList<ChatBean> chat = cdb.getBox(nick); // 가장 최근 대화 시간 가져오기위해
			
			for(int i = 0; i < chat.size(); i++) {
				ChatBean cb = chat.get(i);
				String to_nick = cb.getTo_nick();
				String user_nick = cb.getUser_nick();
				String chat_content = cb.getChat_content();
				String time = cb.getChat_time_string();
				String writer = cdb.unreadChatSender(nick, to_nick);
				int priv_unr_cnt = cdb.unreadChat(user_nick, to_nick);
				//접속자랑 메세지 받은사람 닉네임이 다를 경우의 가장최근 데이터 값
				if(nick.equals(to_nick)) { 
					//개인에게 받은메세지 표시하기 위해(접속자가 보낸사람이 아니고, 안읽은 메세지 갯수가 0이 아닐때만 출력한다)
					if(!nick.equals(writer) && priv_unr_cnt != 0) { 
	%>
						<div class="chat_box" onclick="location.href='chat_room.jsp?to_nick=<%=user_nick %>'">
							<div class="box_to_nick"><%=user_nick  %></div>
							<div class="box_content">
								<span class="priv_unread"><%= priv_unr_cnt %></span>
								<div class="box_chat_content"><%= chat_content %></div>		
								<div class="box_chat_time"><%= time %></div>		
							</div>
						</div>
	<%
					} else {
	%>
						<div class="chat_box" onclick="location.href='chat_room.jsp?to_nick=<%=user_nick %>'">
							<div class="box_to_nick"><%=user_nick  %></div>
							<div class="box_content">
								<div class="box_chat_content"><%= chat_content %></div>		
								<div class="box_chat_time"><%= time %></div>		
							</div>
						</div>
	<%
					}
					//접속자랑 메세지 받은사람 닉네임이 같을 경우의 가장 최근대화의 데이터값	
				} else {
					if(!nick.equals(writer) && priv_unr_cnt != 0) {
	%>		
						<div class="chat_box" onclick="location.href='chat_room.jsp?to_nick=<%=to_nick %>'">
							<div class="box_to_nick"><%=to_nick  %></div>
							<div class="box_content">
								<span class="priv_unread"><%= priv_unr_cnt %></span>
								<div class="box_chat_content"><%= chat_content %></div>		
								<div class="box_chat_time"><%= time %></div>		
							</div>
						</div>
	<%
					} else {
	%>		
						<div class="chat_box" onclick="location.href='chat_room.jsp?to_nick=<%=to_nick %>'">
							<div class="box_to_nick"><%=to_nick  %></div>
							<div class="box_content">
								<div class="box_chat_content"><%= chat_content %></div>		
								<div class="box_chat_time"><%= time %></div>		
							</div>
						</div>
	<%
					}
				}
			}
	%>
	<hr class="min_width_mes_box"/>
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