package chat;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ChatListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String user_nick = request.getParameter("user_nick");
		String to_nick = request.getParameter("to_nick");
		String listType = request.getParameter("listType");
		
		if(user_nick == null || user_nick.equals("") || to_nick == null || to_nick.equals("") 
				|| listType == null || listType.equals("")) {
			response.getWriter().write("");
		} else if(listType.equals("ten")) {
			response.getWriter().write(getTen(URLDecoder.decode(user_nick,"utf-8"), URLDecoder.decode(to_nick,"utf-8")));
		} else {
			try {
				response.getWriter().write(getID(URLDecoder.decode(user_nick,"utf-8"), URLDecoder.decode(to_nick,"utf-8"), listType));
			} catch (Exception e) {
				response.getWriter().write("");
			}
		}
	}
	
	public String getTen(String user_nick, String to_nick) {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ChatDBBean cdb = new ChatDBBean();
		ArrayList<ChatBean> chatList = cdb.getChatListByRecent(user_nick, to_nick, 100);
		if(chatList.size() == 0) return "";
		for(int i = 0; i < chatList.size(); i++) {
			result.append("[{\"value\": \"" + chatList.get(i).getUser_nick() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getTo_nick() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChat_content() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChat_time_string() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatread() + "\"}]");
			if(i != chatList.size() -1) result.append(",");
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size() -1).getChatNo() + "\"}");
		cdb.readChat(user_nick, to_nick); //대화중엔 항상 읽으니깐 읽음 표시를 해준다.
		return result.toString();
	}
	
	public String getID(String user_nick, String to_nick, String chatno) {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ChatDBBean cdb = new ChatDBBean();
		ArrayList<ChatBean> chatList = cdb.getChatListByID(user_nick, to_nick, chatno);
		if(chatList.size() == 0) return "";
		for(int i = 0; i < chatList.size(); i++) {
			result.append("[{\"value\": \"" + chatList.get(i).getUser_nick() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getTo_nick() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChat_content() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChat_time_string() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatread() + "\"}]");
			if(i != chatList.size() -1) result.append(",");
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size() -1).getChatNo() + "\"}");
		cdb.readChat(user_nick, to_nick); // 대화중엔 항상 읽으니깐 읽음 표시를 해준다.
		return result.toString();
	}
}










