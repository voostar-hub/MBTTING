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
String user_nick = (String)session.getAttribute("nick");
MemberDBBean mdb = MemberDBBean.getInstance();
BoardDBBean db = BoardDBBean.getInstance();
ChatDBBean cdb = ChatDBBean.getInstance();
int unr_cnt = cdb.getAllUnreadChat(user_nick);
SimpleDateFormat sdf = new SimpleDateFormat("MM/dd HH:mm");
String mbti = "";
if(user_nick != null) {
	mbti = mdb.getMember(id).getMbti();
}
String to_nick = request.getParameter("to_nick");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅 방</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="shortcut icon" href="#">
<script type="text/javascript">
	function autoClosingAlert(selector, delay) {
		var alert = $(selector).alert();
		alert.show();
		window.setTimeout(function() { alert.hide() }, delay);
	}
	function insertFunction(){
		var user_nick = '<%= user_nick %>';
		var to_nick = '<%= to_nick %>';
		var chat_content = $('#chat_content').val();
		$.ajax({
				type: 'POST',
				url: '../chatSubmitServlet',
				data: {
					user_nick: encodeURIComponent(user_nick),
					to_nick: encodeURIComponent(to_nick),
					chat_content: encodeURIComponent(chat_content),
				},
				success: function(result) {
					if(result == 1) {
						autoClosingAlert('#successMessage', 2000);
					} else if(result == 0) {
						autoClosingAlert('#dangerMessage', 2000);
					} else {
						autoClosingAlert('#warningMessage', 2000);
					}
				},
			    error:function(request,status,error){
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			    }
		});
		$('#chat_content').val('');
	}
	var lastID = 0;
	function chatListFunction(type) {
		var user_nick = '<%= user_nick %>';
		var to_nick = '<%= to_nick %>';
		
		$.ajax({
			type: 'POST',
			url: '../chatListServlet',
			data: {
				user_nick: encodeURIComponent(user_nick),
				to_nick: encodeURIComponent(to_nick),
				listType: type
			},
			success: function(data) {
				if(data == "") return;
				var parsed = JSON.parse(data);
				var result = parsed.result;
				
				for(var i = 0; i < result.length; i++) {
				if(result[i][1].value !=  user_nick) {
 						if(result[i][4].value == 1) {
							result[i][4].value = '';
						} else if(result[i][4].value == 0){
							result[i][4].value = '1'; 
						}  
						addChat2(result[i][0].value, result[i][2].value, result[i][3].value, result[i][4].value);				
					}else {
						addChat(result[i][0].value, result[i][2].value, result[i][3].value);
					}
				}
				
				lastID = Number(parsed.last);
			}
		});
	}
	/* 받은 메세지 */
	function addChat(chatName, chatContent, chatTime) {
		$('#chat_List').append('<span class="sender">' 
							+ chatName
							+ '</span>'
							+ '<div class="sender_content">'
							+ '<div class="sender_message">'
							+ '<p>'
							+ chatContent
							+ '</p>'
							+'</div>'
							+ '<div class="sender_time">'
							+ chatTime
							+ '</div>'
							+'</div>');
		$('#chat_List').scrollTop($('#chat_List')[0].scrollHeight);
	} 
	/* 내가 보낸 메세지 */
	function addChat2(chatName, chatContent, chatTime, chatRead) {
		$('#chat_List').append('<div class="sender_content2">'
							+ '<div class="sender_time2">'
 							+ '<span class="sender_readcheck2">'
							+ chatRead
							+ '</span>'
							+ chatTime
							+ '</div>'
							+ '<div class="sender_message2">'
							+ '<p>'
							+ chatContent
							+ '</p></div></div>');
		$('#chat_List').scrollTop($('#chat_List')[0].scrollHeight);
	} 
	function getInfiniteChat() {
		setInterval(function() {
			chatListFunction(lastID);	
		}, 100);
	}
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
					if(user_nick == null) { // 로그인여부에 따라 나눠짐
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
				if(user_nick == null) {
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
							<span class="logon"><%=user_nick %></span>님 |
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
	<div class="chat_main_btn">
	<div class="message_box_btn"><a href="message_box.jsp">메세지 함 </a></div>
	</div>
	<div class="chat_main">
		<div class="chat_window">
			<div class="chat_other_name">
				<span><%=to_nick %></span>
			</div>
			<!-- ajax로 내용을 넣어줌 -->
			<div id="chat_List" class="chat_List"> 
			</div>
			<div class="send_box">
				<div class="send_box_textarea">
					<textarea name="chat_content" id="chat_content" class="chat_content_area" placeholder="메세지를 입력하세요." maxlength="100" required wrap="soft" ></textarea>
				</div>
				<div>
					<input class="chat_btn" type="button" value="전송" onclick="insertFunction()" id="transport">		
				</div>
			</div>
		</div>
		<div style="display: none;" id="successMessage" class="alert_message">
			<strong>메세지 전송에 성공했습니다.</strong>
		</div>
		<div style="display: none;" id="dangerMessage" class="alert_message">
			<strong>대화를 입력하세요.</strong>
		</div>
		<div style="display: none;" id="warningMessage" class="alert_message">
			<strong>데이터베이스 오류가 발생했습니다.</strong>
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
    <script type="text/javascript">
    	$(document).ready(function() {
    		chatListFunction('ten');
    		getInfiniteChat();
    	})
    </script>
</body>
</html>