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
				<h1 class="boardhelp_header">게시판 이용 방법</h1>
				<p>
					게시판 이용 방법에 대해 설명드리겠습니다.<br>
				</p>
				<br><br>
				<p>
					<img src="../images/board_help_1.png">
				</p>
				<p>
					MBTI게시판 메뉴에 마우스를 올리면<br>
					분석형, 외교형, 관리자형, 탐험가형<br>
					그리고 자유게시판, 공지사항이 나타납니다.
				</p>
				<p>
					자유게시판을 제외한 각 게시판은<br>
					해당 유형의 MBTI만 이용할 수 있으며,<br>
					자유게시판은 로그인을 하지 않아도 볼 수 있습니다.<br>
				</p>
				<p>
					<img src="../images/board_help_2.png">
				</p>
				<p>
					해당 부분을 누르면 게시판의 첫 화면으로 돌아갈 수 있습니다.
				</p>
				<p>
					<img src="../images/board_help_3.png">
				</p>
				<p>
					우측 하단에 위치한 새글 쓰기 버튼으로 게시글을 작성할 수 있으며,<br>
					비 로그인 시 글 작성이 불가능하오니 회원 가입 및 로그인 후 이용 바랍니다.
				</p>
				<p>
					<img src="../images/board_help_4.png">
				</p>
				<p>
					글 작성 시, 어느 게시판에 작성할 것 인지를 위해 <br>
					게시판을 먼저 선택해주세요.
				</p>
				<p>
					<img src="../images/board_help_5.png">
				</p>
				<p>
					그 후, 제목과 내용 그리고 비밀번호를 입력 후<br>
					우측 하단에 위치한 작성 완료 버튼을 통해<br>
					게시글을 작성하실 수 있습니다.
				</p>
				<p>
					그 외의 글 목록 버튼으로 게시글 목록으로 돌아갈 수 있으며,<br>
					다시 작성 버튼으로 제목 및 내용들을 한 번에 지울 수 있습니다.
				</p>
				<p><!-- 공백 --></p>
				<div class="boardhelp_nb">
					<p>
						<span>주의사항</span><br>
						1. 게시판의 목적에 맞지 않을 경우 등록된 게시물은 게시자에게 통보없이 삭제 될 수 있습니다.<br>
						2. 게시글을 통해 주민등록번호 등 개인정보를 유포하는 경우 고의성이 없거나 그 내용이 사실일지라도 <br> 
						      유포의 구체적인 내용에 따라 사생활 침해 및 명예훼손으로 간주돼 법적 처벌을 받거나 손해배상 책임이 생길 수 있습니다.
					</p>
					<p>
						<span>게시판 게시글 삭제 기준</span><br>
						1. 특정 개인 및 단체를 비방하거나 왜곡, 선동 또는 허위 및 확인되지 않은 사실을 유포하는 경우<br>
						2. 제목, 내용 또는 게시자명 등 욕설, 음란한 표현을 담고 있는 경우<br>
						3. 광고 및 상업적인 게시물에 해당하는 경우<br>
						4. 동일한 내용을 반복하여 올리는 경우<br>
						5. 상식 및 통신 예절에 어긋난다고 판단되는 경우<br>
						6. 기타 관계법령을 위배하거나 정상적인 홈페이지 운영을 저해한다고 판단되는 경우
					</p>
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