function board_anal_check() {
	alert("해당 게시판은 분석형(INTJ,INTP,ENTJ,ENTP) MBTI\n유저만 입장 가능합니다.");
	return;
}
function board_dipl_check() {
	alert("해당 게시판은 외교형(INFJ,INFP,ENFJ,ENFP) MBTI\n유저만 입장 가능합니다.");
	return;
}
function board_admin_check() {
	alert("해당 게시판은 관리자형(ISTJ,ISFJ,ESTJ,ESFJ) MBTI\n유저만 입장 가능합니다.");
	return;
}
function board_exp_check() {
	alert("해당 게시판은 탐험가형(ISTP,ISFP,ESTP,ESFP) MBTI\n유저만 입장 가능합니다.");
	return;
}

function write_check() {

	if(document.write_frm.title.value.length == 0) {
		alert("제목을 작성해주세요.");
		write_frm.title.focus();
		return;
	}
	
	if(document.write_frm.content.value.length == 0) {
		alert("내용을 작성해주세요.");
		write_frm.content.focus();
		return;
	}
	
	if(document.write_frm.board_type.value == "fail") {
		alert("작성할 게시판을 선택해주세요.");
		write_frm.board_type.focus();
		return;
	}
	
	var board = document.write_frm.board_type.value;
	var mbti = document.write_frm.mbti.value;
	
	if(board == "anal"){
		if(mbti != "INTJ" && mbti != "INTP" && mbti != "ENTJ" && mbti != "ENTP") {
			alert("분석형 게시판에 글을 등록할 수 없습니다.");	
			return;
		}
	} else if(board == "dipl") {
		if(mbti != "INFJ" && mbti != "INFP" && mbti != "ENFJ" && mbti != "ENFP") {
			alert("외교형 게시판에 글을 등록할 수 없습니다.");	
			return;
		}
	} else if(board == "admin") {
		if(mbti != "ISTJ" && mbti != "ISFJ" && mbti != "ESTJ" && mbti != "ESFJ") {
			alert("관리자형 게시판에 글을 등록할 수 없습니다.");	
			return;
		}
	} else if(board == "exp") {
		if(mbti != "ISTP" && mbti != "ISFP" && mbti != "ESTP" && mbti != "ESFP") {
			alert("탐험가형 게시판에 글을 등록할 수 없습니다.");	
			return;
		}
	}
	 
	document.write_frm.submit();
}
function edit_check() {

	if(document.edit_frm.title.value.length == 0) {
		alert("제목을 작성해주세요.");
		edit_frm.title.focus();
		return;
	}
	
	if(document.edit_frm.content.value.length == 0) {
		alert("내용을 작성해주세요.");
		edit_frm.content.focus();
		return;
	}
	
	if(document.edit_frm.board_type.value == "fail") {
		alert("작성할 게시판을 선택해주세요.");
		edit_frm.board_type.focus();
		return;
	}
	var board = document.edit_frm.board_type.value;
	var mbti = document.edit_frm.mbti.value;
	
	if(board == "anal"){
		if(mbti != "INTJ" && mbti != "INTP" && mbti != "ENTJ" && mbti != "ENTP") {
			alert("분석형 게시판에 글을 등록할 수 없습니다.");	
			return;
		}
	} else if(board == "dipl") {
		if(mbti != "INFJ" && mbti != "INFP" && mbti != "ENFJ" && mbti != "ENFP") {
			alert("외교형 게시판에 글을 등록할 수 없습니다.");	
			return;
		}
	} else if(board == "admin") {
		if(mbti != "ISTJ" && mbti != "ISFJ" && mbti != "ESTJ" && mbti != "ESFJ") {
			alert("관리자형 게시판에 글을 등록할 수 없습니다.");	
			return;
		}
	} else if(board == "exp") {
		if(mbti != "ISTP" && mbti != "ISFP" && mbti != "ESTP" && mbti != "ESFP") {
			alert("탐험가형 게시판에 글을 등록할 수 없습니다.");	
			return;
		}
	}
	document.edit_frm.submit();
}

function delete_check() {

	if(document.delete_frm.pwd.value.length == 0) {
		alert("비밀번호를 입력해주세요.");
		delete_frm.pwd.focus();
		return;
	}
	
	if(confirm("정말 삭제하시겠습니까?") == true) {
		document.delete_frm.submit();
	} else {
		history.go(-1);
		return;
	}
}


function comment_check() {
	if(document.comment_frm.c_content.value.length > 30) {
		alert("댓글은 30자 이하로 적어주세요.");
		comment_frm.c_content.focus();
		return;
	}
	
	document.comment_frm.submit();
}

function search_check() {
	if(document.search_frm.search_col.value == 'none') {
		alert("검색목록을 선택해 주세요.");
		search_frm.search_col.focus();
		return;
	}
	if(document.search_frm.search_content.value.length == 0) {
		alert("검색어를 입력해주세요.");
		search_frm.search_content.focus();
		return;
	}

	document.search_frm.submit();
}

function check_ok() {
	if(document.reg_frm.user_id.value.length == 0){
		alert("아이디를 입력하세요.");
		reg_frm.user_id.focus();
		return;
	}	
	if(document.reg_frm.user_id.value.length < 4){
		alert("아이디는 4글자이상이어야 합니다.");
		reg_frm.user_id.focus();
		return;
	}	
	if(Number(document.reg_frm.user_id.value)){
    	alert("아이디는 숫자만 사용할 수 없습니다.");
		reg_frm.user_id.focus();
		return;
	}	
	if(!/^[a-zA-Z]/.test(document.reg_frm.user_id.value)){
    	alert("아이디는 영문으로 시작해야 합니다.");
		reg_frm.user_id.focus();
		return;
	}
	if(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힝]/.test(document.reg_frm.user_id.value)){
	    alert("아이디 안에 한글은 포함될 수 없습니다.");
		reg_frm.user_id.focus();
		return;
	}
	if(document.reg_frm.user_pw.value.length == 0){
		alert("패스워드는 반드시 입력해야 합니다.");
		reg_frm.user_pw.focus();
		return;
	}	
	if(/(\w)\1\1/.test(document.reg_frm.user_pw.value)){
    	alert('비밀번호안에 같은문자는 3번 이상 사용할 수 없습니다.');
		reg_frm.user_pw.focus();
		return;
	}
	if(/(0123)|(1234)|(2345)|(3456)|(4567)|(5678)|(6789)|(7890)/.test(document.reg_frm.user_pw.value)){
    	alert('비밀번호는 4회이상의 연속된 숫자를 사용할 수 없습니다.');
		reg_frm.user_pw.focus();
		return;
	}
	if(/(0987)|(9876)|(8765)|(7654)|(6543)|(5432)|(4321)|(3210)/.test(document.reg_frm.user_pw.value)){
    	alert('비밀번호는 4회이상의 연속된 숫자를 사용할 수 없습니다.');
		reg_frm.user_pw.focus();
		return;
	}
	
	var checkCount = 0;
	if(/[0-9]/.test(document.reg_frm.user_pw.value)){ //숫자
	    checkCount++;
	}
	var pwChkCnt2 = 0;
	if(/[A-Z]/.test(document.reg_frm.user_pw.value)){ //대문자
	    checkCount++;
	}
	var pwChkCnt3 = 0;
	if(/[~!@\#$%<>^&*\()\-=+_\’]/.test(document.reg_frm.user_pw.value)){ //특수문자
	    checkCount++;
	}
	if(/[a-z]/.test(document.reg_frm.user_pw.value)){ //소문자
	    checkCount++;
	}
	
	console.log("조합 수 :", checkCount);
	if(checkCount <= 2){
	    alert('비밀번호는 영문 대/소문자, 숫자, 특수문자 중 3개이상의 조합이여야만 합니다.');
		reg_frm.user_pw.focus();
		return;
	}
	if(document.reg_frm.user_pw2.value != document.reg_frm.user_pw.value){
		alert("패스워드가 일치하지 않습니다.");
		reg_frm.user_pw2.focus();
		return;
	}	
	if(document.reg_frm.user_name.value.length == 0){
		alert("이름을 입력하세요.");
		reg_frm.user_name.focus();
		return;
	}	
	if(document.reg_frm.user_nick.value.length == 0){
		alert("닉네임을 입력하세요.");
		reg_frm.user_nick.focus();
		return;
	}	
	if(document.reg_frm.user_nick.value.length >= 7){
		alert("닉네임은  6글자까지 가능합니다.");
		reg_frm.user_nick.focus();
		return;
	}	
	if(document.reg_frm.phonenum.value.length == 0){
		alert("전화번호를 입력하세요.");
		reg_frm.phonenum.focus();
		return;
	}	
	if(!/01[01689][1-9]{1}[0-9]{2,3}[0-9]{4}$/.test(document.reg_frm.phonenum.value)){
    	alert("휴대폰 번호 양식이 아닙니다.");
		return;
	}
	document.reg_frm.submit();
}
//로그인 확인

function email_change(){
	if(document.reg_frm.email.options[document.reg_frm.email.selectedIndex].value == '0'){
		document.reg_frm.user_email2.disabled = true; 
 		document.reg_frm.user_email2.value = "";
		return;
	}

	if(document.reg_frm.email.options[document.reg_frm.email.selectedIndex].value == '9'){ 
		document.reg_frm.user_email2.disabled = false;
 		document.reg_frm.user_email2.value = "";
 		document.reg_frm.user_email2.focus();
		return;  
	} else { 
		document.reg_frm.user_email2.disabled = true;
 		document.reg_frm.user_email2.value = document.reg_frm.email.options[document.reg_frm.email.selectedIndex].value;
		return;
	} 
	document.reg_frm.submit();
}

function myp_check_ok() {
	if(document.mypage_frm.user_pw.value.length == 0){
		alert("패스워드는 반드시 입력해야 합니다.");
		mypage_frm.user_pw.focus();
		return;
	}
	document.mypage_frm.submit();
}
function dlt_check_ok() {
	if(document.delete_user_frm.user_pw.value.length == 0){
		alert("패스워드는 반드시 입력해야 합니다.");
		delete_user_frm.user_pw.focus();
		return;
	}
	
	if(confirm("정말 삭제하시겠습니까?") == true) {
		document.delete_user_frm.submit();
	} else {
		history.go(-1);
		return;
	}
}

function notice_write_check() {

	if(document.notice_write_frm.n_title.value.length == 0) {
		alert("제목을 작성해주세요.");
		notice_write_frm.title.focus();
		return;
	}
	
	if(document.notice_write_frm.n_content.value.length == 0) {
		alert("내용을 작성해주세요.");
		notice_write_frm.content.focus();
		return;
	}
	
	if(document.notice_write_frm.notice_type.value == "fail") {
		alert("작성할 게시판을 선택해주세요.");
		write_frm.board_type.focus();
		return;
	}	 
	document.notice_write_frm.submit();
}
function notice_edit_check() {

	if(document.notice_edit_frm.n_title.value.length == 0) {
		alert("제목을 작성해주세요.");
		notice_edit_frm.n_title.focus();
		return;
	}
	
	if(document.notice_edit_frm.n_content.value.length == 0) {
		alert("내용을 작성해주세요.");
		notice_edit_frm.n_content.focus();
		return;
	}
	
	if(document.notice_edit_frm.notice_type.value == "fail") {
		alert("작성할 게시판을 선택해주세요.");
		notice_edit_frm.notice_type.focus();
		return;
	}

	document.notice_edit_frm.submit();
}


function notice_delete_check() {

	if(document.notice_delete_frm.n_pwd.value.length == 0) {
		alert("비밀번호를 입력해주세요.");
		notice_delete_frm.n_pwd.focus();
		return;
	}
	
	if(confirm("정말 삭제하시겠습니까?") == true) {
		document.notice_delete_frm.submit();
	} else {
		history.go(-1);
		return;
	}
}

function notice_search_check() {
	if(document.notice_search_frm.search_col.value == 'none') {
		alert("검색목록을 선택해 주세요.");
		notice_search_frm.search_col.focus();
		return;
	}
	if(document.notice_search_frm.search_content.value.length == 0) {
		alert("검색어를 입력해주세요.");
		notice_search_frm.search_content.focus();
		return;
	}

	document.notice_search_frm.submit();
}
// 채팅관련 메서드
function profile_register() {
	if(document.register_prof_frm.p_content.value.length == 0){
		alert("소개글을 입력해주세요.");
		register_prof_frm.p_content.focus();
		return;
	}
	document.register_prof_frm.submit();
}

function profile_edit() {
	if(document.edit_prof_frm.p_content.value.length == 0){
		alert("소개글을 입력해주세요.");
		edit_prof_frm.p_content.focus();
		return;
	}
	document.edit_prof_frm.submit();
}
function profile_delete() {
	if(confirm("등록된 본인의 채팅 프로필을 삭제하시겠습니까?") == true) {
		location.href="delete_profile_ok.jsp"
	} else {
		return;
	}
}

//아이디 비번 찾기

function find_check_ok() {
	if(document.find_frm.user_name.value.length == 0){
		alert("이름은 반드시 입력해야 합니다.");
		find_frm.user_name.focus();
		return;
	}
	if(document.find_frm.user_email.value.length == 0){
		alert("이메일은 반드시 입력해야 합니다.");
		find_frm.user_email.focus();
		return;
	}
	if(document.find_frm.user_email2.value.length == 0){
		alert("도메인은 반드시 입력해야 합니다.");
		find_frm.user_email2.focus();
		return;
	}
	document.find_frm.submit();
}

function findpw_check_ok() {
	if(document.findpw_frm.user_id.value.length == 0){
		alert("아이디는 반드시 입력해야 합니다.");
		findpw_frm.user_id.focus();
		return;
	}
	if(document.findpw_frm.user_name.value.length == 0){
		alert("이름은 반드시 입력해야 합니다.");
		findpw_frm.user_name.focus();
		return;
	}
	if(document.findpw_frm.user_email.value.length == 0){
		alert("이메일은 반드시 입력해야 합니다.");
		findpw_frm.user_email.focus();
		return;
	}
	if(document.findpw_frm.user_email2.value.length == 0){
		alert("도메인은 반드시 입력해야 합니다.");
		findpw_frm.user_email2.focus();
		return;
	}
	document.findpw_frm.submit();
}
//qna
function qna_write_check() {

	if(document.qna_write_frm.qna_title.value.length == 0) {
		alert("제목을 작성해주세요.");
		qna_write_frm.qna_title.focus();
		return;
	}
	
	if(document.qna_write_frm.qna_content.value.length == 0) {
		alert("내용을 작성해주세요.");
		qna_write_frm.qna_content.focus();
		return;
	}
	if(document.qna_write_frm.qna_pwd.value.length == 0) {
		alert("비밀번호를 작성해주세요.");
		qna_write_frm.qna_qwd.focus();
		return;
	}
	
	if(document.qna_write_frm.question_type.value == "fail") {
		alert("작성할 게시판을 선택해주세요.");
		write_frm.question_type.focus();
		return;
	}	 
	document.qna_write_frm.submit();
}

function qna_edit_check() {

	if(document.qna_edit_frm.qna_title.value.length == 0) {
		alert("제목을 작성해주세요.");
		qna_edit_frm.qna_title.focus();
		return;
	}
	
	if(document.qna_edit_frm.qna_content.value.length == 0) {
		alert("내용을 작성해주세요.");
		qna_edit_frm.qna_content.focus();
		return;
	}
	if(document.qna_edit_frm.qna_pwd.value.length == 0) {
		alert("비밀번호를 작성해주세요.");
		qna_edit_frm.qna_qwd.focus();
		return;
	}
	
	if(document.qna_edit_frm.question_type.value == "fail") {
		alert("작성할 게시판을 선택해주세요.");
		qna_edit_frm.question_type.focus();
		return;
	}

	document.qna_edit_frm.submit();
}


function qna_delete_check() {

	if(document.qna_delete_frm.qna_pwd.value.length == 0) {
		alert("비밀번호를 입력해주세요.");
		qna_delete_frm.qna_pwd.focus();
		return;
	}
	
	if(confirm("정말 삭제하시겠습니까?") == true) {
		document.qna_delete_frm.submit();
	} else {
		history.go(-1);
		return;
	}
}

function qna_search_check() {
	if(document.qna_search_frm.search_col.value == 'none') {
		alert("검색목록을 선택해 주세요.");
		qna_search_frm.search_col.focus();
		return;
	}
	if(document.qna_search_frm.search_content.value.length == 0) {
		alert("검색어를 입력해주세요.");
		qna_search_frm.search_content.focus();
		return;
	}

	document.qna_search_frm.submit();
}


