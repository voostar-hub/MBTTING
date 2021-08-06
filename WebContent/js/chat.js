function chat_go() {
	if(confirm("선택하신 회원에게 메세지를 보내시겠습니까?") == true) {
		location.href="chat_room.jsp"
	} else {
		return;
	}
}

