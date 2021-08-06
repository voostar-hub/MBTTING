<%@page import="board.BoardDBBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardBean"%>
<%@page import="member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%
	String id = (String)session.getAttribute("id");
	String nick = (String)session.getAttribute("nick");
	BoardDBBean db = BoardDBBean.getInstance();
	MemberDBBean mdb = MemberDBBean.getInstance();
	String mbti = "";
	String b_type;
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
<script type="text/javascript" charset="utf-8" src="../js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="../js/jquery.vticker.min.js"></script>
<script>
	$(function() {
		$('#example').vTicker();
	});	
</script>
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
								<a href="free_board.jsp">자유게시판</a>
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
									<a href="anal_board.jsp">분석형 게시판</a> 
									<a href="javascript:void(0);" onclick="board_dipl_check(); return false;">외교형 게시판</a> 
									<a href="javascript:void(0);" onclick="board_admin_check(); return false;">관리자형 게시판</a> 
									<a href="javascript:void(0);" onclick="board_exp_check(); return false;">탐험가형 게시판</a> 
									<a href="free_board.jsp">자유게시판</a>
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
									<a href="dipl_board.jsp">외교형 게시판</a> 
									<a href="javascript:void(0);" onclick="board_admin_check(); return false;">관리자형 게시판</a> 
									<a href="javascript:void(0);" onclick="board_exp_check(); return false;">탐험가형 게시판</a> 
									<a href="free_board.jsp">자유게시판</a>
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
									<a href="admin_board.jsp">관리자형 게시판</a> 
									<a href="javascript:void(0);" onclick="board_exp_check(); return false;">탐험가형 게시판</a> 
									<a href="free_board.jsp">자유게시판</a>
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
									<a href="exp_board.jsp">탐험가형 게시판</a> 
									<a href="free_board.jsp">자유게시판</a>
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
									<a href="free_board.jsp">자유게시판</a>
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
						<a href="../mbtting_login/myPage.jsp" class="log">마이페이지</a>
					</p>
				</div>
			<%
				}
			%>
		</nav>
	</header>
	<%
		int INTJ = db.mbtiCount("INTJ");
		int INTP = db.mbtiCount("INTP");
		int ENTJ = db.mbtiCount("ENTJ");
		int ENTP = db.mbtiCount("ENTP");
		int INFJ = db.mbtiCount("INFJ");
		int INFP = db.mbtiCount("INFp");
		int ENFJ = db.mbtiCount("ENFJ");
		int ENFP = db.mbtiCount("ENFP");
		int ISTJ = db.mbtiCount("ISTJ");
		int ISFJ = db.mbtiCount("ISFJ");
		int ESTJ = db.mbtiCount("ESTJ");
		int ESFJ = db.mbtiCount("ESFJ");
		int ISTP = db.mbtiCount("ISTP");
		int ISFP = db.mbtiCount("ISFP");
		int ESTP = db.mbtiCount("ESTP");
		int ESFP = db.mbtiCount("ESFP");
	%>
	<hr />
	<div class="main_scroll_div">
		<marquee behavior="scroll" direction="up" scrollamount="2">
		  	<a href="#" class="mbti_scroll_header">MBTI별 회원현황</a>
		  	<a href="#" class="mbti_scroll_content">INTJ <%= INTJ %>명</a>
		  	<a href="#" class="mbti_scroll_content">INTP <%= INTP %>명</a>
			<a href="#" class="mbti_scroll_content">ENTJ <%= ENTJ %>명</a>
			<a href="#" class="mbti_scroll_content">ENTP <%= ENTP %>명</a>
			<a href="#" class="mbti_scroll_content">INFJ <%= INFJ %>명</a>
			<a href="#" class="mbti_scroll_content">INFP <%= INFP %>명</a>
			<a href="#" class="mbti_scroll_content">ENFJ <%= ENFJ %>명</a>
			<a href="#" class="mbti_scroll_content">ENFP <%= ENFP %>명</a>
			<a href="#" class="mbti_scroll_content">ISTJ <%= ISTJ %>명</a>
			<a href="#" class="mbti_scroll_content">ISFJ <%= ISFJ %>명</a>
			<a href="#" class="mbti_scroll_content">ESTJ <%= ESTJ %>명</a>
			<a href="#" class="mbti_scroll_content">ESFJ <%= ESFJ %>명</a>
			<a href="#" class="mbti_scroll_content">ISTP <%= ISTP %>명</a>
			<a href="#" class="mbti_scroll_content">ISFP <%= ISFP %>명</a>
			<a href="#" class="mbti_scroll_content">ESTP <%= ESTP %>명</a>
			<a href="#" class="mbti_scroll_content">ESFP <%= ESFP %>명</a>
	  	</marquee>
	  	<div class="main_notice">
	  		<a href="#" class="main_notice_word">NOTICE</a>
	  		<div id="example">
				<ul>
				<%
					ArrayList<BoardBean> n_list = db.mainNoticeBoard();
					for(int i = 0; i < n_list.size(); i++) {
						BoardBean board = n_list.get(i);
						
						String n_type = board.getNotice_type();
						String n_title = board.getN_title();
						int n_no = board.getN_no();
						
						if(id != null) {
							if(n_type.equals("board")) {
					%>
							<li><span>게시판 공지 - </span><a href="../mbtting_notice/notice_show.jsp?n_no=<%=n_no%>&notice_type=<%=n_type%>"><%= n_title %></a></li>
					<%				
							} else {
					%>
							<li><span>채팅 공지 - </span><a href="../mbtting_notice/notice_show.jsp?n_no=<%=n_no%>&notice_type=<%=n_type%>"><%= n_title %></a></li>
					<%				
							}
				
						} else if(id == null) {
					%>
							<li><span>게시판 공지 - </span><%= n_title %></li>
							<li><span>채팅 공지 - </span><%= n_title %></li>
					<%
						}
					}
					%>
				</ul>
			</div>
	  	</div>
	  	
	  	<div class="main_notice2"></div>
	  	
	</div>
	<div class="main_rank_message">
		<p><span>실시간 베스트</span>는 해당 월 기준 <span>추천수 상위 5개</span> 게시글이 노출됩니다.</p>
	</div>
	<div class="mainpage_body">
		<div class="mainpage_body_div">
			<div class="hot_board">
				<!-- anal -->
			<%
				if(mbti.equals("INTJ") || mbti.equals("INTP") || mbti.equals("ENTJ") || mbti.equals("ENTP")) {
			%>
					<p>분석형 게시판 실시간 베스트 <a href="anal_board.jsp" class="a1">+더보기</a></p>
			<%
				} else {
			%>
					<p>분석형 게시판 실시간 베스트 </p>
			<%
				}
			%>
				<table class="main_table_rank"> 
					<tr class="main_table_rank_header">
						<td class="rank_b_no">글 번호</td>
						<td class="rank_title">제목</td>
						<td class="rank_writer">작성자</td>
						<td class="rank_count">추천</td>
					</tr>
				<%
					ArrayList<BoardBean> list = db.rankanalBoard();
					for(int i = 0; i < list.size(); i++){
						BoardBean board = list.get(i);
						
						int b_no = board.getB_no();
						String title = board.getTitle();
						String writer = board.getUser_nick();
						int count = board.getCount();
						String type = board.getBoard_type();
				%>
					<tr class="main_table_rank_content">
						<td class="rank_b_no_content"><%=b_no %></td>
				<% 
						if(mbti.equals("INTJ") || mbti.equals("INTP") || mbti.equals("ENTJ") || mbti.equals("ENTP")) {
				%>
						<td class="rank_title_content"><a href="show.jsp?b_no=<%= b_no %>&board_type=<%= type%>"><%=title %></a></td>
				<%
						} else {
				%>
						<td class="rank_title_content"><%=title %></td>
				<%
						}
				%>
						<td class="rank_writer_content"><%=writer %></td>
						<td class="rank_count_content"><%=count %></td>
					</tr>
				<%
					}
				%>
				</table>
			</div>
			<div class="hot_board">
				<!-- dipl -->
			<%
				if(mbti.equals("INFJ") || mbti.equals("INFP") || mbti.equals("ENFJ") || mbti.equals("ENFP")) {
			%>
					<p>외교형 게시판 실시간 베스트 <a href="dipl_board.jsp" class="a1">+더보기</a></p>
			<%
				} else {
			%>
					<p>외교형 게시판 실시간 베스트 </p>
			<%
				}
			%>
				<table class="main_table_rank">
					<tr class="main_table_rank_header">
						<td class="rank_b_no">글 번호</td>
						<td class="rank_title">제목</td>
						<td class="rank_writer">작성자</td>
						<td class="rank_count">추천</td>
					</tr>
				<%
					ArrayList<BoardBean> list2 = db.rankdiplBoard();
					for(int i = 0; i < list2.size(); i++){
						BoardBean board = list2.get(i);
						
						int b_no = board.getB_no();
						String title = board.getTitle();
						String writer = board.getUser_nick();
						int count = board.getCount();
						String type = board.getBoard_type();
				%>
					<tr class="main_table_rank_content">
						<td class="rank_b_no_content"><%=b_no %></td>
				<% 
						if(mbti.equals("INFJ") || mbti.equals("INFP") || mbti.equals("ENFJ") || mbti.equals("ENFP")) {
				%>
						<td class="rank_title_content"><a href="show.jsp?b_no=<%= b_no %>&board_type=<%= type%>"><%=title %></a></td>
				<%
						} else {
				%>
						<td class="rank_title_content"><%=title %></td>
				<%
						}
				%>
						<td class="rank_writer_content"><%=writer %></td>
						<td class="rank_count_content"><%=count %></td>
					</tr>
				<%
					}
				%>
				</table>
			</div>
		</div>
		<div class="mainpage_body_div">
			<div class="hot_board">
				<!-- admin -->
			<%
				if(mbti.equals("ISTJ") || mbti.equals("ISFJ") || mbti.equals("ESTJ") || mbti.equals("ESFJ")) {
			%>
					<p>관리자형 게시판 실시간 베스트 <a href="admin_board.jsp" class="a2">+더보기</a></p>
			<%
				} else {
			%>
					<p>관리자형 게시판 실시간 베스트 </p>
			<%
				}
			%>
				<table class="main_table_rank">
					<tr class="main_table_rank_header">
						<td class="rank_b_no">글 번호</td>
						<td class="rank_title">제목</td>
						<td class="rank_writer">작성자</td>
						<td class="rank_count">추천</td>
					</tr>
				<%
					ArrayList<BoardBean> list3 = db.rankadminBoard();
					for(int i = 0; i < list3.size(); i++){
						BoardBean board = list3.get(i);
						
						int b_no = board.getB_no();
						String title = board.getTitle();
						String writer = board.getUser_nick();
						int count = board.getCount();
						String type = board.getBoard_type();
				%>
					<tr class="main_table_rank_content">
						<td class="rank_b_no_content"><%=b_no %></td>
				<% 
						if(mbti.equals("ISTJ") || mbti.equals("ISFJ") || mbti.equals("ESTJ") || mbti.equals("ESFJ")) {
				%>
						<td class="rank_title_content"><a href="show.jsp?b_no=<%= b_no %>&board_type=<%= type%>"><%=title %></a></td>
				<%
						} else {
				%>
						<td class="rank_title_content"><%=title %></td>
				<%
						}
				%>
						<td class="rank_writer_content"><%=writer %></td>
						<td class="rank_count_content"><%=count %></td>
					</tr>
				<%
					}
				%>
				</table>
			</div>
			<div class="hot_board">
				<!-- exp -->
			<%
				if(mbti.equals("ISTP") || mbti.equals("ISFP") || mbti.equals("ESTP") || mbti.equals("ESFP")) {
			%>
					<p>탐험가형 게시판 실시간 베스트 <a href="exp_board.jsp" class="a2">+더보기</a></p>
			<%
				} else {
			%>
					<p>탐험가형 게시판 실시간 베스트 </p>
			<%
				}
			%>
				<table class="main_table_rank">
					<tr class="main_table_rank_header">
						<td class="rank_b_no">글 번호</td>
						<td class="rank_title">제목</td>
						<td class="rank_writer">작성자</td>
						<td class="rank_count">추천</td>
					</tr>
				<%
					ArrayList<BoardBean> list4 = db.rankexpBoard();
					for(int i = 0; i < list4.size(); i++){
						BoardBean board = list4.get(i);
						
						int b_no = board.getB_no();
						String title = board.getTitle();
						String writer = board.getUser_nick();
						int count = board.getCount();
						String type = board.getBoard_type();
				%>
					<tr class="main_table_rank_content">
						<td class="rank_b_no_content"><%=b_no %></td>
				<% 
						if(mbti.equals("ISTP") || mbti.equals("ISFP") || mbti.equals("ESTP") || mbti.equals("ESFP")) {
				%>
						<td class="rank_title_content"><a href="show.jsp?b_no=<%= b_no %>&board_type=<%= type%>"><%=title %></a></td>
				<%
						} else {
				%>
						<td class="rank_title_content"><%=title %></td>
				<%
						}
				%>
						<td class="rank_writer_content"><%=writer %></td>
						<td class="rank_count_content"><%=count %></td>
					</tr>
				<%
					}
				%>
				</table>
			</div>
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
