<%@page import="member.MemberDBBean"%>
<%@page import="myUtil.HanConv"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDBBean"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="utf-8"%>
<%
int n_no = Integer.parseInt(request.getParameter("n_no"));
String n_type = request.getParameter("notice_type");
BoardDBBean manager = BoardDBBean.getInstance();
BoardBean nn = manager.getNotice(n_no);
SimpleDateFormat sdf = new SimpleDateFormat("MM/dd HH:mm");

String id = (String)session.getAttribute("id");
String nick = (String)session.getAttribute("nick");
MemberDBBean mdb = MemberDBBean.getInstance();
String mbti = "";
if(nick != null) {
	mbti = mdb.getMember(id).getMbti();
}
// textarea 엔터시 줄바꿈적용
String content = manager.getNotice(n_no).getN_content();
content = content.replace("\n", "<br/>");

// 게시글 작성자는 본인 글 조회수 증가 막기
String writer = manager.getNotice(n_no).getUser_nick();
//out.println("writer :"+writer);
String logon_nick = (String)session.getAttribute("nick");
//out.println("logon_nick :"+logon_nick);
//조회수 중복 쿠키
Cookie[] cookies = request.getCookies();
//비교하기 위해 새로운 쿠키
Cookie viewCookie = null;
String sessionNick = (String)session.getAttribute("nick");
String nno = request.getParameter("n_no");
//쿠키가 있을 경우 
if (cookies != null && cookies.length > 0) {
 for (int i = 0; i < cookies.length; i++){
     if (cookies[i].getName().equals("|" + nno + "|") ){ 
         viewCookie = cookies[i];
     }
 }
}
 // 만일 viewCookie가 null일 경우 쿠키를 생성해서 조회수 증가 로직을 처리함.
if (viewCookie == null) {    
 // System.out.println("cookie 없음");
  // 쿠키 생성(이름, 값) = 해당 번호의 글마다 닉네임을 저장시켜 해당 번호에 닉네임이 없으면 쿠키 추가후 조회수 1증가 아니면 증가안시킴
 Cookie newCookie = new Cookie("|" + nno + "|", URLEncoder.encode(sessionNick, "UTF-8"));
 
 // 본인이 쓴글이 아닐경우 추가시킴 
 if(!writer.equals(logon_nick)) {
	    newCookie.setMaxAge(1*24*60*60);
	    response.addCookie(newCookie);
	  	manager.updateNoticeCount(n_no);
 }
} else {
 // 쿠키 값 받아옴.
 String value = viewCookie.getValue();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>공지 상세보기</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mbtting.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/reset.css" type="text/css" />
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&family=Poor+Story&family=Train+One&family=Ubuntu&family=Noto+Sans+KR:wght@500;700;900&family=Black+Han+Sans&display=swap"
	rel="stylesheet" />
<script type="text/javascript" src="../js/board.js" charset="utf-8"></script>
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
					<span class="logon"><%=nick %></span>님 |
					<a href="../mbtting_login/logOut.jsp" class="log">로그아웃</a> 
					<a href="../mbtting_login/myPage.jsp"class="log">마이페이지</a>
				</p>
			</div>
		</nav>
	</header>
	<hr />
	<header class="board-header">
		<%
			if (n_type.equals("board")) {
		%>
		<h1><a href="board_notice.jsp">게시판 공지사항</a></h1>
		<%
			} else if (n_type.equals("chatting")) {
		%>
		<h1><a href="chatting_notice.jsp">채팅 공지사항</a></h1>
		<%
			} 
		%>
		
	</header>
	<hr />
	<div class="board-title">
		<%
			if(writer.equals(logon_nick)) {
				
		%>
				<div class="board_title_display">
					<div> 
						<h2><%=nn.getN_title()%></h2>
					</div>	
					<div class="edit_del_div">
						<input type="button" value="수정" onclick="location.href='notice_edit.jsp?n_no=<%= n_no %>&notice_type=<%= n_type%>'">
						&nbsp;
						<input type="button" value="삭제" onclick="location.href='notice_delete.jsp?n_no=<%= n_no%>&notice_type=<%= n_type %>'">
					</div>
				</div>
		<%
			}	else {
		%>
				<div class="board_title_display">
					<div> 
						<h2><%=nn.getN_title()%></h2>
					</div>	
				</div>
		<%
			}
		%>
		
		
		<div class="title-under">
			<div class="title-under-left">
				<%=nn.getUser_nick()%>
				&nbsp;
				<div class="vertical-line"></div>
				&nbsp;
				<%=sdf.format(nn.getDate())%>
			</div>
			<div class="title-under-right">
				조회
				<%
				if(!writer.equals(logon_nick)) {
				%>
					<%=nn.getN_count()%> 
				<%
				} else {
					
				%>
					<%=nn.getN_count()%> 
				<%
				}
				%>
			</div>
		</div>
	</div>
	<hr class="content-hr" />
	<!-- 게시물 내용 -->
	<!-- 높이 고정, 내용출력 -->
	<div class="content-main">
		<%=content%>
	</div>
		<footer>
			<hr />
			<div class="footer-content-top">
				<a href="/intro/about">About MBTTING</a> | <a href="#"
					data-toggle="modal" data-target="#userPrivacy">개인정보보호</a> | <a
					href="#">광고문의</a> | <a href="#">Contact</a> | <a
					href="https://www.facebook.com" target="_blank">Facebook</a> | <a
					href="https://github.com/" target="_blank">Github</a> v1.3.7
			</div>
			<hr />
			<div class="footer-content-bottom">
				<strong>상호명</strong> : (주)MBBTING | <strong>대표명</strong> : 김경윤 | <strong>사업자등록번호</strong>
				: 010-6659-9709 | <strong>문의</strong> : ruddbs273@naver.com <br />
				<strong>주소</strong> : 부산광역시 부산남구 수영로 299, 루미너스 빌딩 10층 <br /> @ 2021
				<a href="#" target="_blank">Mbtting Management</a>
			</div>
		</footer>
</body>
</html>






















