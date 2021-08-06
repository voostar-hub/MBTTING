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
int b_no = Integer.parseInt(request.getParameter("b_no"));
String type = request.getParameter("board_type");

BoardDBBean manager = BoardDBBean.getInstance();
BoardBean bb = manager.getBoard(b_no);

int comment_cnt = manager.countcomment(b_no); //총 댓글 갯수

ArrayList<BoardBean> list = manager.listCommnet(b_no); // 댓글 화면에 뿌려주기

SimpleDateFormat sdf = new SimpleDateFormat("MM/dd HH:mm");
String id = (String)session.getAttribute("id");
String nick = (String)session.getAttribute("nick");
MemberDBBean mdb = MemberDBBean.getInstance();
String mbti = "";
if(nick != null) {
	mbti = mdb.getMember(id).getMbti();
}
// textarea 엔터시 줄바꿈적용
String content = manager.getBoard(b_no).getContent();
content = content.replace("\n", "<br/>");

// 게시글 작성자는 본인 글 조회수 증가 막기위해 로그인한 사람과 작성자를 비교
String writer = manager.getBoard(b_no).getUser_nick();
String logon_nick = (String)session.getAttribute("nick");
// 조회수 중복 쿠키
Cookie[] cookies = request.getCookies();
// 비교하기 위해 새로운 쿠키
Cookie viewCookie = null;
String sessionNick = (String)session.getAttribute("nick");
String bno = request.getParameter("b_no");
// 쿠키가 있을 경우 
if (cookies != null && cookies.length > 0) {
    for (int i = 0; i < cookies.length; i++){
        if (cookies[i].getName().equals("|" + bno + "|") ){ 
            viewCookie = cookies[i];
        }
    }
}
    // 만일 viewCookie가 null일 경우 쿠키를 생성해서 조회수 증가 로직을 처리함.
if (viewCookie == null) {    
    // System.out.println("cookie 없음");
     // 쿠키 생성(이름, 값) = 해당 번호의 글마다 닉네임을 저장시켜 해당 번호에 닉네임이 없으면 쿠키 추가후 조회수 1증가 아니면 증가안시킴
    Cookie newCookie = new Cookie("|" + bno + "|", URLEncoder.encode(sessionNick, "UTF-8"));
    
    // 본인이 쓴글이 아닐경우 추가시킴 
    if(!writer.equals(logon_nick)) {
	    newCookie.setMaxAge(1*24*60*60);
	    response.addCookie(newCookie);
  	  	manager.updateBoardCount(b_no);
    }
} else {
    // 쿠키 값 받아옴.
    String value = viewCookie.getValue();
}
//테스트하다가 데이터지우거나 계정을 한번 지운경우 이걸 실행시키면 쿠키를 다지우고 새로 테스트가 가능하다.
/*for(int i = 0; i < cookies.length; i++) {
	System.out.println(cookies[i].getName());
	System.out.println(cookies[i].getValue());
	Cookie delCookie = cookies[i];
	delCookie.setMaxAge(0);
	response.addCookie(delCookie);
}*/

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>글 상세보기</title>
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
			if (type.equals("free")) {
		%>
		<h1><a href="free_board.jsp">자유 게시판</a></h1>
		<%
			} else if (type.equals("anal")) {
		%>
		<h1><a href="anal_board.jsp">분석형 게시판</a></h1>
		<%
			} else if (type.equals("admin")) {
		%>
		<h1><a href="admin_board.jsp">관리자형 게시판</a></h1>
		<%
			} else if (type.equals("dipl")) {
		%>
		<h1><a href="dipl_board.jsp">외교형 게시판</a></h1>
		<%
			} else if (type.equals("exp")) {
		%>
		<h1><a href="exp_board.jsp">탐험가형 게시판</a></h1>
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
						<h2><%=bb.getTitle()%></h2>
					</div>	
					<div class="edit_del_div">
						<input type="button" value="수정" onclick="location.href='edit.jsp?b_no=<%= b_no %>&board_type=<%= type%>'">
						&nbsp;
						<input type="button" value="삭제" onclick="location.href='delete.jsp?b_no=<%= b_no%>&board_type=<%= type %>'">
					</div>
				</div>
		<%
			} else {
		%>
				<div class="board_title_display">
					<div> 
						<h2><%=bb.getTitle()%></h2>
					</div>	
					<div class="good_btn">
						<a href="like_ok.jsp?b_no=<%= b_no %>&board_type=<%= type %>">추천 <img src="../images/like.png" width="20" height="20"></a>
					</div>
				</div>
		<%
			}
		%>
		<div class="title-under">
			<div class="title-under-left">
				<%=bb.getUser_nick()%>
				&nbsp;
				<div class="vertical-line"></div>
				&nbsp;
				<%=sdf.format(bb.getDate())%>
			</div>
			<div class="title-under-right">
				조회
				<%
				if(!writer.equals(logon_nick)) {
				%>
					<%=bb.getCount()%> 
				<%
				} else {
					
				%>
					<%=bb.getCount()%> 
				<%
				}
				%>
				&nbsp;
				<div class="vertical-line"></div>
				&nbsp; 추천
				<%=bb.getGood()%>
			</div>
		</div>
	</div>
	<hr class="content-hr" />
	<!-- 게시물 내용 -->
	<!-- 높이 고정, 내용출력 -->
	<div class="content-main">
		<%=content%>
	</div>
	<!-- 댓글창 -->
	<!-- 높이 고정, hr로 선 구분, 디시갤 참조 -->/
	<form name="comment_frm" action="comment_ok.jsp?b_no=<%=b_no%>&board_type=<%= type %>" method="post">
		<div>
			<div class="comment-title">전체 댓글 <%=comment_cnt %>개</div>
			<table class="comment-table">
			<%
				for(int i = 0; i < list.size(); i++) {
					BoardBean board = list.get(i);
					String c_user_nick = board.getC_user_nick();
					String c_content = board.getC_content();
					Timestamp c_time = board.getC_time();
					int c_no = board.getC_no();
					if(c_user_nick.equals(logon_nick)) {
			%>
						<tr>
							<td class="comment-table-writer_x"><%=c_user_nick %></td>
							<td class="comment-table-content_x"><%= c_content %></td>
							<td class="comment-table-time_x"><%= sdf.format(c_time) %>
								<a href="delete_comment_ok.jsp?b_no=<%= b_no%>&board_type=<%= type %>&c_no=<%= c_no %>">x</a>
							</td>
						</tr>
			<% 	
					} else {
			%>
						<tr>
							<td class="comment-table-writer"><%=c_user_nick %></td>
							<td class="comment-table-content"><%= c_content %></td>
							<td class="comment-table-time"><%= sdf.format(c_time) %></td>
						</tr>
			<%			
						
					}
				}
			%>
			</table>
			<div class="comment_div">
				<input type="text" name="c_content" class="comment_content"><br>
				<input type="button" value="댓글 달기" onclick="comment_check()" class="comment_btn">
			</div>
		</div>
	</form>
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