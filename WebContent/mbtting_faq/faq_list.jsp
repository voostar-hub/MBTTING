<%@page import="board.BoardDBBean"%>
<%@page import="member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("utf-8");
String id = (String) session.getAttribute("id");
String nick = (String) session.getAttribute("nick");
String col = request.getParameter("search_col");
String content = request.getParameter("search_content");
MemberDBBean mdb = MemberDBBean.getInstance();
BoardDBBean db = BoardDBBean.getInstance();
String mbti = "";
if (nick != null) {
	mbti = mdb.getMember(id).getMbti();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="../js/board.js" charset="utf-8"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mbtting.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/reset.css" type="text/css" />
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&family=Poor+Story&family=Train+One&family=Ubuntu&family=Noto+Sans+KR:wght@500;700;900&family=Black+Han+Sans&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css" />

<script type="text/javascript" src="../js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
</head>
<body>
	<header>
		<!-- ������ �̸� -->
		<div class="head">
			<p class="mbc">�ݴ밡 ������ ����? My Best chaTTing</p>
			<h1 id="mbting">
				<p>
					<a href="../mbtting_board/mainpage.jsp">MBTTING</a>
				</p>
			</h1>
		</div>
		<!-- �޴��� -->
		<nav id="navbar">
			<div class="menubar">
				<div class="dropdown">
					<button class="dropbtn" onclick="window.open('https://www.16personalities.com/ko/%EB%AC%B4%EB%A3%8C-%EC%84%B1%EA%B2%A9-%EC%9C%A0%ED%98%95-%EA%B2%80%EC%82%AC')">MBTI ���� �����˻�</button>
				</div>
				<%
					if(nick == null) { // �α��ο��ο� ���� ������
				%>
						<div class="dropdown">
							<button class="dropbtn">MBTI�Խ���</button>
							<div class="dropdown-content">
								<a href="../mbtting_login/login.jsp">�м��� �Խ���</a> 
								<a href="../mbtting_login/login.jsp">�ܱ��� �Խ���</a> 
								<a href="../mbtting_login/login.jsp">�������� �Խ���</a> 
								<a href="../mbtting_login/login.jsp">Ž�谡�� �Խ���</a> 
								<a href="../mbtting_board/free_board.jsp">�����Խ���</a>
								<a href="../mbtting_login/login.jsp">��������</a>
							</div>
						</div>	
				<%
					} else {
						//�м���
						if(mbti.equals("INTJ") || mbti.equals("INTP") || mbti.equals("ENTJ") || mbti.equals("ENTP") ) {
				%>		
							<div class="dropdown">
								<button class="dropbtn">MBTI�Խ���</button>
								<div class="dropdown-content">
									<a href="../mbtting_board/anal_board.jsp">�м��� �Խ���</a> 
									<a href="javascript:void(0);" onclick="board_dipl_check(); return false;">�ܱ��� �Խ���</a> 
									<a href="javascript:void(0);" onclick="board_admin_check(); return false;">�������� �Խ���</a> 
									<a href="javascript:void(0);" onclick="board_exp_check(); return false;">Ž�谡�� �Խ���</a> 
									<a href="../mbtting_board/free_board.jsp">�����Խ���</a>
									<a href="../mbtting_notice/board_notice.jsp">��������</a>
								</div>
							</div>
				<%
						// �ܱ���
						} else if(mbti.equals("INFJ") || mbti.equals("INFP") || mbti.equals("ENFJ") || mbti.equals("ENFP")) {
				%>
							<div class="dropdown">
								<button class="dropbtn">MBTI�Խ���</button>
								<div class="dropdown-content">
									<a href="javascript:void(0);" onclick="board_anal_check(); return false;">�м��� �Խ���</a> 
									<a href="../mbtting_board/dipl_board.jsp">�ܱ��� �Խ���</a> 
									<a href="javascript:void(0);" onclick="board_admin_check(); return false;">�������� �Խ���</a> 
									<a href="javascript:void(0);" onclick="board_exp_check(); return false;">Ž�谡�� �Խ���</a> 
									<a href="../mbtting_board/free_board.jsp">�����Խ���</a>
									<a href="../mbtting_notice/board_notice.jsp">��������</a>
								</div>
							</div>
				<%
						// ��������
						} else if(mbti.equals("ISTJ") || mbti.equals("ISFJ") || mbti.equals("ESTJ") || mbti.equals("ESFJ")) {
				%>
							<div class="dropdown">
								<button class="dropbtn">MBTI�Խ���</button>
								<div class="dropdown-content">
									<a href="javascript:void(0);" onclick="board_anal_check(); return false;">�м��� �Խ���</a> 
									<a href="javascript:void(0);" onclick="board_dipl_check(); return false;">�ܱ��� �Խ���</a> 
									<a href="../mbtting_board/admin_board.jsp">�������� �Խ���</a> 
									<a href="javascript:void(0);" onclick="board_exp_check(); return false;">Ž�谡�� �Խ���</a> 
									<a href="../mbtting_board/free_board.jsp">�����Խ���</a>
									<a href="../mbtting_notice/board_notice.jsp">��������</a>
								</div>
							</div>
				<%
						// Ž�谡��
						} else if(mbti.equals("ISTP") || mbti.equals("ISFP") || mbti.equals("ESTP") || mbti.equals("ESFP")) {
				%>
							<div class="dropdown">
								<button class="dropbtn">MBTI�Խ���</button>
								<div class="dropdown-content">
									<a href="javascript:void(0);" onclick="board_anal_check();">�м��� �Խ���</a> 
									<a href="javascript:void(0);" onclick="board_dipl_check();">�ܱ��� �Խ���</a> 
									<a href="javascript:void(0);" onclick="board_admin_check();">�������� �Խ���</a> 
									<a href="../mbtting_board/exp_board.jsp">Ž�谡�� �Խ���</a> 
									<a href="../mbtting_board/free_board.jsp">�����Խ���</a>
									<a href="../mbtting_notice/board_notice.jsp">��������</a>
								</div>
							</div>
				<%
						} else {
				%>
							<div class="dropdown">
								<button class="dropbtn">MBTI�Խ���</button>
								<div class="dropdown-content">
									<a href="javascript:void(0);" onclick="board_anal_check();">�м��� �Խ���</a> 
									<a href="javascript:void(0);" onclick="board_dipl_check();">�ܱ��� �Խ���</a> 
									<a href="javascript:void(0);" onclick="board_admin_check();">�������� �Խ���</a> 
									<a href="javascript:void(0);" onclick="board_exp_check();">Ž�谡�� �Խ���</a> 
									<a href="../mbtting_board/free_board.jsp">�����Խ���</a>
									<a href="../mbtting_notice/board_notice.jsp">��������</a>
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
							<button class="dropbtn" onclick="location.href='../mbtting_chatting/chatting_main.jsp'">MBTTING(ä��)</button>
						</div>
				<%
					} else {
				%>
						<div class="dropdown">
							<button class="dropbtn" onclick="location.href='../mbtting_login/login.jsp'">MBTTING(ä��)</button>
						</div>
				<%
					}
				%>
				<div class="dropdown">
					<button class="dropbtn">���� �Ұ�</button>
					<div class="dropdown-content">
						<a href="../mbtting_intro/mbtting_intro.jsp">���� �Ұ�</a> 
						<a href="../mbtting_faq/faq_list.jsp">���� ����� ����</a> 
<%
					if(nick == null) { // �α��ο��ο� ���� ������
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
			<!-- �α���, ȸ������ -->
			<div>
				<p>
					<span class="logon"><%=nick%></span>�� | <a
						href="../mbtting_login/logOut.jsp" class="log">�α׾ƿ�</a> <a
						href="../mbtting_login/myPage.jsp" class="log">����������</a>
				</p>
			</div>
		</nav>
	</header>
	<hr />

	<header class="board-header">
		<h1>
			<a href="faq_list.jsp">FAQ</a>
		</h1>
	</header>
	<hr />
			<!-- Bootstrap FAQ - START -->
<div class="container">
    <br />
    <br />
    <br />
    <br />
    <div class="panel-group" id="accordion">
        <div class="faqHeader">�Խ��� ����</div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">�Խ����� ������ �̿밡���Ѱ���?</a>
                </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse">
                <div class="panel-body">
                    <strong>mbtting</strong>�� �Խ�����  ������ <strong>ȸ��</strong>�� ���Ͽ� �̿밡���մϴ�. 
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTen">��� �Խ����� �̿��� �� �ֳ���?</a>
                </h4>
            </div>
            <div id="collapseTen" class="panel-collapse collapse">
                <div class="panel-body">
                    <strong>�ƴϿ�.</strong> ȸ���� �� ȸ���� ���� <strong>mbti�Խ���</strong>�� <strong>�����Խ���</strong>�� �̿밡���մϴ�.
                </div>
            </div>
        </div>
       

        <div class="faqHeader">ä�� ����</div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">ä���� ��� �̿��� �� �ֳ���?</a>
                </h4>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse">
                <div class="panel-body">
                    	ȸ������ �� �̿밡���մϴ�.
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">ä�� �߿� ���� �弳�� �ϴ� ����� �ֽ��ϴ�. ��� �ϸ� �ǳ���?</a>
                </h4>
            </div>
            <div id="collapseThree" class="panel-collapse collapse">
                <div class="panel-body">
                   	QNA�Խ������� �����ֽø� �ִ��� ���� �亯�帮�ڽ��ϴ�.
                </div>
            </div>
        </div>
       
        

        <div class="faqHeader">��Ÿ</div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">ȸ�������� ������ �� �ֳ���?</a>
                </h4>
            </div>
            <div id="collapseFour" class="panel-collapse collapse">
                <div class="panel-body">
                    	�����մϴ�.
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven">������ ���ǵ帮�� ���� ���� �ֽ��ϴ�. ���� �����ϸ� �ǳ���?</a>
                </h4>
            </div>
            <div id="collapseSeven" class="panel-collapse collapse">
                <div class="panel-body">
                    000-0000-00X0���� �����ֽø� ģö�ϰ� �亯�ص帮�ڽ��ϴ�.
                </div>
            </div>
        </div>
    </div>
</div>	
	<hr />
	<footer>
		<div class="footer-content-top">
			<a href="/intro/about">About MBTTING</a> | <a href="#"
				data-toggle="modal" data-target="#userPrivacy">����������ȣ</a> | <a
				href="#">������</a> | <a href="#">Contact</a> | <a
				href="https://www.facebook.com" target="_blank">Facebook</a> | <a
				href="https://github.com/" target="_blank">Github</a> v1.3.7
		</div>
		<hr />
		<div class="footer-content-bottom">
			<strong class="footer_str">��ȣ��</strong> : (��)MBBTING | <strong
				class="footer_str">��ǥ��</strong> : �����| <strong class="footer_str">����ڵ�Ϲ�ȣ</strong>
			: 010-6659-9709 | <strong class="footer_str">����</strong> :
			ruddbs273@naver.com <br /> <strong class="footer_str">�ּ�</strong> :
			�λ걤���� �λ곲�� ������ 299, ��̳ʽ� ���� 10�� <br /> @ 2021 <a href="#"
				target="_blank">Mbtting Management</a>
		</div>
	</footer>	
</body>
</html>