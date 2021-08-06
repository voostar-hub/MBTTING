package chat;

import java.sql.Timestamp;

public class ChatBean {
	private int chatNo;
	private String user_nick;
	private String to_nick;
	private String chat_content;
	private Timestamp chat_time;
	private String chat_time_string;
	private String chatread;
	

	public String getChatread() {
		return chatread;
	}
	public void setChatread(String chatread) {
		this.chatread = chatread;
	}
	public String getChat_time_string() {
		return chat_time_string;
	}
	public void setChat_time_string(String chat_time_string) {
		this.chat_time_string = chat_time_string;
	}
	public int getChatNo() {
		return chatNo;
	}
	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	public String getTo_nick() {
		return to_nick;
	}
	public void setTo_nick(String to_nick) {
		this.to_nick = to_nick;
	}
	public String getChat_content() {
		return chat_content;
	}
	public void setChat_content(String chat_content) {
		this.chat_content = chat_content;
	}
	public Timestamp getChat_time() {
		return chat_time;
	}
	public void setChat_time(Timestamp chat_time) {
		this.chat_time = chat_time;
	}
	
	
}
