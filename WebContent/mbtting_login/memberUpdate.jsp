<%@page import="member.MemberBean"%>
<%@page import="member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	MemberDBBean mdb = MemberDBBean.getInstance();
	MemberBean mb = mdb.getMember(id);
	String nick = mb.getUser_nick(); 
	
	String user_sex = "";
	if(nick != null) {
		user_sex = mdb.getMember(id).getUser_sex(); 
	}
	
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mbtting.css?version=1" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css?ver=1" type="text/css" />
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
				if(id == null) {
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
						<a href="myPage.jsp" class="log">마이페이지</a>
					</p>
				</div>
			<%
				}
			%>
		</nav>
	</header>
	<hr />
	<!-- 마이 페이지 바디-->
	<div class="memUp_body">
		<div class="memUp_body_side">	
			<ul>
				<li><a href="memberUpdate.jsp">내 정보 수정</a></li>
				<li><a href="member_viewboard.jsp">내가 작성한 글</a></li>
				<li><a href="member_viewcomment.jsp">내가 작성한 댓글</a></li>
				<li><a href="deleteMember.jsp">회원 탈퇴</a></li>
			</ul>
		</div>
		<h1 id="memUp_header">내 정보 수정</h1>
			<div id="memUp_wrapper">
				<form class="memUp_content" name="reg_frm" method="post" action="memberUpdateOk.jsp">
					<!-- ID -->
					<div>
						<h3>
							<label for="user_id">아이디</label>
						</h3>
						<span class="reg"> 
							<input type="text" name="user_id"
								class="user_dis" maxlength="20" value="<%= mb.getUser_id() %>" disabled>
						</span>
					</div>
					<!-- PW -->
					<div>
						<h3>
							<label for="user_pw">비밀번호 (영문 대/소문자, 숫자, 특수문자 중 3개 이상의 조합)</label>
						</h3>
						<span class="reg"> 
							<input type="password"
								name="user_pw" class="user" maxlength="20">
						</span>
					</div>
					<!-- PW2 -->
					<div>
						<h3>
							<label for="user_pw2">비밀번호 확인</label>
						</h3>
						<span class="reg"> <input type="password"
							name="user_pw2" class="user" maxlength="20">
						</span>
					</div>
					<!-- NAME -->
					<div>
						<h3>
							<label for="user_name">이름</label>
						</h3>
						<span class="reg"> 
							<input type="text" name="user_name" class="user_dis" maxlength="20"
									value="<%= mb.getUser_name() %>" disabled>
						</span>
					</div>
					<!-- NICKNAME -->
					<div>
						<h3>
							<label for="user_nick">닉네임</label>
						</h3>
						<span class="reg"> 
							<input type="text" name="user_nick" class="user_dis" maxlength="20"
								value="<%= mb.getUser_nick() %>">
						</span>
					</div>
					<!-- MBTI -->
					<div>
						<div class="mbti_test">
							<div>
								<h3>MBTI(선택)</h3>
							</div>
							<div>
								<h3>
									<a
										href="https://www.16personalities.com/ko/%EB%AC%B4%EB%A3%8C-%EC%84%B1%EA%B2%A9-%EC%9C%A0%ED%98%95-%EA%B2%80%EC%82%AC"
										target="_black">검사하러가기</a>
								</h3>
							</div>
						</div>
						<span class="reg"> 
							<select name="mbti" class="select" onChange="mbti_list(this.value);">
									<option>MBTI</option>
									<option value="ESTJ" <%= "ESTJ".equals(mbti)?"selected":"" %>>-- ESTJ 엄격한 관리자 --</option>
									<option value="ESTP" <%= "ESTP".equals(mbti)?"selected":"" %>>-- ESTP 모험을 즐기는 사업가 --</option>
									<option value="ISTP" <%= "ISTP".equals(mbti)?"selected":"" %>>-- ISTP 만능 재주꾼 --</option>
									<option value="ISTJ" <%= "ISTJ".equals(mbti)?"selected":"" %>>-- ISTJ 청렴결백한 논리주의자 --</option>
									<option value="ISFP" <%= "ISFP".equals(mbti)?"selected":"" %>>-- ISFP 호기심 많은 예술가 --</option>
									<option value="ISFJ" <%= "ISFJ".equals(mbti)?"selected":"" %>>-- ISFJ 용감한 수호자 --</option>
									<option value="ESFJ" <%= "ESFJ".equals(mbti)?"selected":"" %>>-- ESFJ 사교적인 외교관 --</option>
									<option value="ESFP" <%= "ESFP".equals(mbti)?"selected":"" %>>-- ESFP 자유로운 영혼의 연예인 --</option>
									<option value="INFJ" <%= "INFJ".equals(mbti)?"selected":"" %>>-- INFJ 선의의 옹호자 --</option>
									<option value="INFP" <%= "INFP".equals(mbti)?"selected":"" %>>-- INFP 열정적인 중재자 --</option>
									<option value="ENFP" <%= "ENFP".equals(mbti)?"selected":"" %>>-- ENFP 재기발랄한 활동가 --</option>
									<option value="ENFJ" <%= "ENFJ".equals(mbti)?"selected":"" %>>-- ENFJ 정의로운 사회운동가 --</option>
									<option value="INTP" <%= "INTP".equals(mbti)?"selected":"" %>>-- INTP 논리적인 사색가 --</option>
									<option value="INTJ" <%= "INTJ".equals(mbti)?"selected":"" %>>-- INTJ 용의주도한 전략가 --</option>
									<option value="ENTJ" <%= "ENTJ".equals(mbti)?"selected":"" %>>-- ENTJ 대담한 통솔자 --</option>
									<option value="ENTP" <%= "ENTP".equals(mbti)?"selected":"" %>>-- ENTP 뜨거운 논쟁의 변론가 --</option>
							</select>
						</span>
					</div>
					<!-- GENDER --> 
					<div>
						<h3>
							<label for="user_sex">성별</label>
						</h3>
						<span class="reg"> 
							<select name="user_sex" class="select" onChange="sex_list(this.value);">
									<option value="남" <%= "남".equals(user_sex)?"selected":"" %>>남자</option>
									<option value="여" <%= "여".equals(user_sex)?"selected":"" %>>여자</option>
							</select>
						</span>
					</div>
					<!-- EMAIL -->
					<div>
						<h3>
							<label for="user_email">이메일</label>
						</h3>
						<div class="reg_email">
							<input type="text" class="email1" name="user_email" onfocus="this.value='';" 
									value="<%= mb.getUser_email() %>" disabled> 
							<span class="bet">@</span> 
							<input type="text"class="email2" name="user_email2" 
									value="<%= mb.getUser_email2() %>" disabled> 
							<select class="selectemail" name="email" onchange="email_change()" disabled>
								<option value="0">선택하세요</option>
								<option value="9" selected="selected">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="gmail.com">gmail.com</option>
								<option value="nate.com">nate.com</option>
								<option value="hanmail.net">hanmail.net</option>
							</select>
						</div>
					</div>
					<!-- ADDRESS -->
					<div>
						<h3>
							<label for="user_addr">주소</label>
						</h3>
						<span > 
							<div class="reg_addr">
								<input type="text" class="addr1" name="addr1" id="postcode" placeholder="우편번호" value="<%= mb.getAddr1() %>">
								<input type="button" class="addr_btn" onclick="execPostcode()" value="우편번호 찾기"><br>
								<input type="text" class="addr2" name="addr2" id="address" placeholder="주소" value="<%= mb.getAddr2() %>"><br>
								<input type="text" class="addr3" name="addr3" id="extraAddress" placeholder="참고항목" value="<%= mb.getAddr3() %>"><br>
								<input type="text" class="addr4" name="addr4" id="detailAddress" placeholder="상세주소" value="<%= mb.getAddr4() %>">
							</div>
						
							<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
							<script>
							    function execPostcode() {
							        new daum.Postcode({
							            oncomplete: function(data) {
							                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
							
							                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
							                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							                var addr = ''; // 주소 변수
							                var extraAddr = ''; // 참고항목 변수
							
							                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							                    addr = data.roadAddress;
							                } else { // 사용자가 지번 주소를 선택했을 경우(J)
							                    addr = data.jibunAddress;
							                }
							
							                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							                if(data.userSelectedType === 'R'){
							                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
							                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
							                        extraAddr += data.bname;
							                    }
							                    // 건물명이 있고, 공동주택일 경우 추가한다.
							                    if(data.buildingName !== '' && data.apartment === 'Y'){
							                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
							                    }
							                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							                    if(extraAddr !== ''){
							                        extraAddr = ' (' + extraAddr + ')';
							                    }
							                    // 조합된 참고항목을 해당 필드에 넣는다.
							                    document.getElementById("extraAddress").value = extraAddr;
							                
							                } else {
							                    document.getElementById("extraAddress").value = '';
							                }
							
							                // 우편번호와 주소 정보를 해당 필드에 넣는다.
							                document.getElementById('postcode').value = data.zonecode;
							                document.getElementById("address").value = addr;
							                // 커서를 상세주소 필드로 이동한다.
							                document.getElementById("detailAddress").focus();
							            }
							        }).open();
							    }
							</script>
						</span>
					</div>
					<!-- PHONE -->
					<div>
						<h3>
							<label for="phonenum">휴대전화</label>
						</h3>
						<span class="reg"> <input type="text"
							name="phonenum" class="user" maxlength="11"
							placeholder="(-)를 제외한 전화번호 입력" value="<%= mb.getPhonenum() %>">
						</span>
					</div>
					<!-- JOIN BTN-->
					<div class="btn_area">
						<input type="button" id="btnJoin" value="수정하기" onclick="check_ok()">
					</div>
				</form>
			</div>
		</div>
	<!-- 푸터 -->
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