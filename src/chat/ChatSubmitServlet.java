package chat;

import java.io.IOException;
import java.net.URLDecoder;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ChatSubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String user_nick = request.getParameter("user_nick");
		String to_nick = request.getParameter("to_nick");
		String chat_content = request.getParameter("chat_content");
		
		if(user_nick == null || user_nick.equals("") || to_nick == null || to_nick.equals("") 
				|| chat_content == null || chat_content.equals("")) {
			response.getWriter().write("0");
		} else {
			user_nick = URLDecoder.decode(user_nick, "UTF-8");
			to_nick = URLDecoder.decode(to_nick, "UTF-8");
			chat_content = URLDecoder.decode(chat_content, "UTF-8");
			ChatBean cb = new ChatBean();
			cb.setChat_time(new Timestamp(System.currentTimeMillis()));
			response.getWriter().write(new ChatDBBean().insertMessage(user_nick, to_nick, chat_content, cb) + "");
		}
	}
}














