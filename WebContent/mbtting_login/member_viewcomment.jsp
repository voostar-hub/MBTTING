<%@page import="java.net.URLEncoder"%>
<%@page import="myUtil.HanConv"%>
<%@page import="member.MemberDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDBBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");
	String nick = (String)session.getAttribute("nick");
	MemberDBBean mdb = MemberDBBean.getInstance();
	BoardDBBean db = BoardDBBean.getInstance();
	String mbti = "";
	if(nick != null) {
		mbti = mdb.getMember(id).getMbti();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>내가 쓴 글</title>
<script type="text/javascript" src="../js/board.js" charset="utf-8"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mbtting.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" type="text/css" />
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
				if(nick == null) {
%>
					<div>
						<p>
							<a href="login.jsp" class="log">로그인</a> 
							<a href="register.jsp" class="log">회원가입</a>
						</p>
					</div>
					
<%
				} else {
%>
					<div>
						<p>
							<span class="logon"><%=nick %></span>님 |
							<a href="logOut.jsp" class="log">로그아웃</a> 
							<a href="mypage.jsp" class="log">마이페이지</a>
						</p>
					</div>
<%	
				}
%>
		</nav>
	</header>
	<hr />
	<div class="mb_board_body">
		<header class="mb_board_header">
	      	<h1>내가 작성한 댓글</h1>
	    </header>
		<div class="mb_side">	
			<ul>
				<li><a href="memberUpdate.jsp">내 정보 수정</a></li>
				<li><a href="member_viewboard.jsp">내가 작성한 글</a></li>
				<li><a href="member_viewcomment.jsp">내가 작성한 댓글</a></li>
				<li><a href="deleteMember.jsp">회원 탈퇴</a></li>
			</ul>
		</div>
	    <div class="mb_board1">
	    	<div>
		    	<table class="mb_t">
		    		<tr>
						<td class="mb_board-top" width="130" align="center">번호</td>
						<td class="mb_board-top" align="center">내용</td>
						<td class="mb_board-top" width="150" align="center">작성자</td>
						<td class="mb_board-top" width="100" align="center">작성일</td>
		    		</tr>
		    		<%
		    			SimpleDateFormat sdf = new SimpleDateFormat("MM/dd HH:mm");
		    			String pageNum = request.getParameter("pageNum");
		    			if(pageNum == null) {
		    				pageNum = "1";
		    			}
		    			ArrayList<BoardBean> list = db.member_listcomment(pageNum, nick);
		    			
						for(int i=0; i< list.size(); i++){
							BoardBean board = list.get(i);
							int b_no = board.getB_no();
							String writer = board.getUser_nick();
							String content = board.getC_content();
							Timestamp write_date = board.getC_time();
							String board_type = board.getBoard_type();
					%>
						<tr class="list_on">
							<td align="center"><a href="../mbtting_board/show.jsp?b_no=<%= b_no %>&board_type=<%= board_type %>"><%= b_no %></a></td>
							<td align="center"><a href="../mbtting_board/show.jsp?b_no=<%= b_no %>&board_type=<%= board_type %>"><%= content %></a></td>
							<td align="center"><a href="../mbtting_board/show.jsp?b_no=<%= b_no %>&board_type=<%= board_type %>"><%= writer %></a></td>
							<td align="center"><a href="../mbtting_board/show.jsp?b_no=<%= b_no %>&board_type=<%= board_type %>"><%= sdf.format(write_date) %></a></td>
						</tr>
		    		<%
						}
		    		%>
		    	</table>
			    <div class="mb_paging"><%= BoardBean.member_com_pageNumber(4) %></div>
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