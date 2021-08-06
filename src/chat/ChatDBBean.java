package chat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ChatDBBean {
	private static ChatDBBean instance = new ChatDBBean();

	// 싱글톤
	public static ChatDBBean getInstance() {
		return instance;
	}

	public Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");

		return ds.getConnection();
	}
	
	// 메세지테이블에 채팅 메세지 집어 넣기 
	public int insertMessage(String user_nick, String to_nick, String chat_content, ChatBean cb) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int number = 0;
		int re = -1;
		try {
			con = getConnection();
			sql = "select max(chatno) from message";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				number = rs.getInt(1) + 1;
			} else {
				number = 1;
			}
			
			sql = "insert into message values(?,?,?,?,?,0)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, user_nick);
			pstmt.setString(3, to_nick);
			pstmt.setString(4, chat_content);
			pstmt.setTimestamp(5, cb.getChat_time());
			re = pstmt.executeUpdate();
			 
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}
	
	public ArrayList<ChatBean> getChatListByID(String user_nick, String to_nick, String chatno) {
		ArrayList<ChatBean> chatList = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select chatno, user_nick, to_nick, chat_content, to_char(chat_time, 'AM HH:MI'), to_char(chatread, '9') from message where "
				+ "((user_nick = ? and to_nick = ?) or (user_nick = ? and to_nick = ?))"
				+ "and chatno > ? "
				+ "order by chat_time";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_nick);
			pstmt.setString(2, to_nick);
			pstmt.setString(3, to_nick);
			pstmt.setString(4, user_nick);
			pstmt.setInt(5, Integer.parseInt(chatno));
			rs = pstmt.executeQuery();
			
			chatList = new ArrayList<ChatBean>();
			while(rs.next()) {
				ChatBean cb = new ChatBean();
				cb.setChatNo(rs.getInt(1));
				cb.setUser_nick(rs.getString(2).replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				cb.setTo_nick(rs.getString(3).replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				cb.setChat_content(rs.getString(4).replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				cb.setChat_time_string(rs.getString(5));
				cb.setChatread(rs.getString(6));
				chatList.add(cb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return chatList;
	}
	
	public ArrayList<ChatBean> getChatListByRecent(String user_nick, String to_nick, int number) {
		ArrayList<ChatBean> chatList = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select chatno, user_nick, to_nick, chat_content, to_char(chat_time, 'AM HH:MI'), to_char(chatread, '9') from message where "
				+ "((user_nick = ? and to_nick = ?) or (user_nick = ? and to_nick = ?)) "
				+ "and chatno > (select max(chatno) - ? from message where (user_nick = ? and to_nick = ?) or (user_nick = ? and to_nick = ?))"
				+ "order by chat_time";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_nick);
			pstmt.setString(2, to_nick);
			pstmt.setString(3, to_nick);
			pstmt.setString(4, user_nick);
			pstmt.setInt(5, number);
			pstmt.setString(6, user_nick);
			pstmt.setString(7, to_nick);
			pstmt.setString(8, to_nick);
			pstmt.setString(9, user_nick);
			rs = pstmt.executeQuery();
			chatList = new ArrayList<ChatBean>();
			while(rs.next()) {
				ChatBean cb = new ChatBean();
				cb.setChatNo(rs.getInt(1));
				cb.setUser_nick(rs.getString(2).replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				cb.setTo_nick(rs.getString(3).replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				cb.setChat_content(rs.getString(4).replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				cb.setChat_time_string(rs.getString(5));
				cb.setChatread(rs.getString(6));
				chatList.add(cb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return chatList;
	}
	
	//채팅읽음처리
	public int readChat(String user_nick, String to_nick) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "update message set chatread = 1 where(user_nick = ? and to_nick = ?)";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, to_nick);
			pstmt.setString(2, user_nick);
			int re =  pstmt.executeUpdate();
			return re;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return -1; //실패했을경우
	}
	
	public int getAllUnreadChat(String user_nick) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(chatno) from message where to_nick = ? and chatread = 0";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_nick);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
			return 0; //메세지가 없을때
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return -1; //실패했을경우
	}
	// 대화상대 뽑아오기
	public ArrayList<ChatBean> getBox(String user_nick) {
		ArrayList<ChatBean> chatList = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select chatno, user_nick, to_nick, chat_content, to_char(chat_time, 'MM/DD AM HH:MI')"
					+ " from message where chatno in"
					+ " (select max(chatno) from message "
											+ "where to_nick = ? or user_nick = ?"
											+ "group by user_nick, to_nick)"
											+ "order by chatno desc";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_nick);
			pstmt.setString(2, user_nick);
			rs = pstmt.executeQuery();
			chatList = new ArrayList<ChatBean>();
			while(rs.next()) {
				ChatBean cb = new ChatBean();
				cb.setChatNo(rs.getInt(1));
				cb.setUser_nick(rs.getString(2).replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				cb.setTo_nick(rs.getString(3).replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				cb.setChat_content(rs.getString(4).replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				cb.setChat_time_string(rs.getString(5));
				chatList.add(cb);
			}
			// 최신메세지를 뽑아내야하는데 겹쳐서 나오기때문에 최신 메세지 하나만 출력해준다
			for (int i = 0; i < chatList.size(); i++) {
				ChatBean x = chatList.get(i);
				for (int j = 0; j < chatList.size(); j++) {
					ChatBean y = chatList.get(j);
					if(x.getUser_nick().equals(y.getTo_nick()) && x.getTo_nick().equals(y.getUser_nick())) {
						if(x.getChatNo() < y.getChatNo()) {
							chatList.remove(x);
							i--;
							break;
						} else {
							chatList.remove(y);
							j--;
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return chatList;
	}
	// 안읽은 채팅갯수
	public int unreadChat(String user_nick, String to_nick) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(chatno) from message where user_nick = ? and to_nick = ? and chatread = 0";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_nick);
			pstmt.setString(2, to_nick);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
			return 0; //메세지가 없을때
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return -1; //실패했을경우
	}
	
	// 안읽은 채팅
	public String unreadChatSender(String user_nick, String to_nick) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select user_nick from message where user_nick = ? and to_nick = ? and chatread = 0";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_nick);
			pstmt.setString(2, to_nick);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
			return ""; //메세지가 없을때
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return "error"; //실패했을경우
	}
	
	// 대화창 옆에 1로 읽음 표시
	public int getReadChat(String user_nick, String to_nick) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select chatread from message where (user_nick = ? and to_nick = ?)";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_nick);
			pstmt.setString(2, to_nick);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return -1; //실패시
	}
}



















