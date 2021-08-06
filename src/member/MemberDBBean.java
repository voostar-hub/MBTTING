package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import myUtil.HanConv;

public class MemberDBBean {
	
private static MemberDBBean instance = new MemberDBBean();
	
	public static MemberDBBean getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		
		return ds.getConnection();
	}
	
	public int insertMember(MemberBean member) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			con = getConnection();						
			sql = "insert into usertable(user_nick, user_pw, user_name, reg_date, up_date, phonenum, mbti"
					+ ", user_email, user_sex, user_id, user_email2, addr1, addr2, addr3, addr4) "
					+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, HanConv.toKor(member.getUser_nick()));
			pstmt.setString(2, member.getUser_pw());
			pstmt.setString(3, HanConv.toKor(member.getUser_name()));
			pstmt.setTimestamp(4, member.getReg_date());
			pstmt.setTimestamp(5, member.getUp_date());
			pstmt.setString(6, member.getPhonenum());
			pstmt.setString(7, member.getMbti());
			pstmt.setString(8, member.getUser_email());
			pstmt.setString(9, HanConv.toKor(member.getUser_sex()));
			pstmt.setString(10, member.getUser_id());
			if (member.getUser_email2() != null) {
				pstmt.setString(11, member.getUser_email2());
			} else {
				pstmt.setString(11, member.getEmail());
			}
			pstmt.setString(12, member.getAddr1());
			pstmt.setString(13, HanConv.toKor(member.getAddr2()));
			pstmt.setString(14, HanConv.toKor(member.getAddr3()));
			pstmt.setString(15, HanConv.toKor(member.getAddr4()));
			
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return 1;
	}
	
	// 아이디 찾기
		public String findId(String name, String email, String email2) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select user_id from usertable where user_name = ? and user_email = ? and user_email2 = ?";
			String id = null;
			
			try {
				con = getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, HanConv.toKor(name));
				pstmt.setString(2, email);
				pstmt.setString(3, email2);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					id = rs.getString(1);
				} 
				rs.close();
				pstmt.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return id;
		}
		
		// 비밀번호 찾기
		public String findPw(String id, String name, String email, String email2) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select user_pw from usertable where user_id = ? and user_name = ? and user_email = ? and user_email2 = ?";
			String pw = null;
			
			try {
				con = getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, HanConv.toKor(name));
				pstmt.setString(3, email);
				pstmt.setString(4, email2);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					pw = rs.getString(1);
				} 
				rs.close();
				pstmt.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return pw;
		}
	public int confirmID(String id) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select user_id from usertable where user_id = ?";
		int re = -1;
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				re = 1;
			} else {
				re = -1;
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}
	public String getPW(String nick) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select user_pw from usertable where user_nick = ?";
		String pw = "";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nick);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pw = rs.getString(1);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pw;
	}
	public int userCheck(String id, String pwd) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select user_pw from usertable where user_id = ?";
		String db_user_pw;
		int re = -1;
		
		try{
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				db_user_pw = rs.getString("user_pw");
				if(db_user_pw.equals(pwd)) {
					re = 1;
				} else {
					re = 0;
				}
			}else {
				re = -1;
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch(Exception e) {
		}
		return re;
	}
	public MemberBean getMember(String id) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from usertable where user_id = ?";
		MemberBean member = null;
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new MemberBean();
				member.setUser_nick(rs.getString("user_nick"));
				member.setUser_pw(rs.getNString("user_pw"));
				member.setUser_name(rs.getString("user_name"));
				member.setPhonenum(rs.getString("phonenum"));
				member.setMbti(rs.getString("mbti"));
				member.setUser_email(rs.getString("user_email"));
				member.setUser_sex(rs.getString("user_sex"));
				member.setUser_id(rs.getString("user_id"));
				member.setUser_email2(rs.getString("user_email2"));
				member.setAddr1(rs.getString("addr1"));
				member.setAddr2(rs.getString("addr2"));
				member.setAddr3(rs.getString("addr3"));
				member.setAddr4(rs.getString("addr4"));
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return member;
	}

	public int updateMember(MemberBean member) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "update usertable set user_nick=?, user_pw=?, mbti=?, user_sex=?, up_date=?"
				+ ", phonenum=?, addr1=?, addr2=?, addr3=?, addr4=? where user_id=?";
		int re = -1;
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, HanConv.toKor(member.getUser_nick()));
			pstmt.setString(2, member.getUser_pw());
			pstmt.setString(3, member.getMbti());
			pstmt.setString(4, HanConv.toKor(member.getUser_sex()));
			pstmt.setTimestamp(5, member.getUp_date());
			pstmt.setString(6, member.getPhonenum());
			pstmt.setString(7, member.getAddr1());
			pstmt.setString(8, HanConv.toKor(member.getAddr2()));
			pstmt.setString(9, HanConv.toKor(member.getAddr3()));
			pstmt.setString(10, HanConv.toKor(member.getAddr4()));
			pstmt.setString(11, member.getUser_id());
			re = pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return re;
	}
	public boolean deleteMember(String nick, String pw) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select user_pw from usertable where user_nick = ?";
		boolean result = false;
		String dbpw = "";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nick);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dbpw = rs.getString(1);
				if (!dbpw.equals(pw)) {
					result = false;
				} else {
					// fk로 종속되어있으니 fk부터 먼저 삭제하고 pk 삭제
					sql = "delete message where from_nick = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, nick);
					pstmt.executeUpdate();
					
					sql = "delete boardcomment where user_nick = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, nick);
					pstmt.executeUpdate();
					
					sql = "delete board where user_nick = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, nick);
					pstmt.executeUpdate();
					
					sql = "delete notification where user_nick = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, nick);
					pstmt.executeUpdate();
					
					sql = "delete qna where user_nick = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, nick);
					pstmt.executeUpdate();
					
					sql = "delete qnacomment where user_nick = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, nick);
					pstmt.executeUpdate();
					
					sql = "delete chatprofile where user_nick = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, nick);
					pstmt.executeUpdate();

					sql = "delete usertable where user_nick = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, nick);
					pstmt.executeUpdate();
					
					result = true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {rs.close();} catch (Exception e2) {}
			try {pstmt.close();} catch (Exception e2) {}
			try {con.close();} catch (Exception e2) {}
		}
		return result;
	}
}
