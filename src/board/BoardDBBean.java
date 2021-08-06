package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import myUtil.HanConv;

public class BoardDBBean {
	private static BoardDBBean instance = new BoardDBBean();

	// 싱글톤
	public static BoardDBBean getInstance() {
		return instance;
	}

	public Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");

		return ds.getConnection();
	}
	
	// 메인화면에 mbti별 인원수 뿌리기
	public int mbtiCount(String mbti) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int mbtiCnt = 0;
		
		try {
			con = getConnection();
			sql = "select count(*) from usertable where mbti=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mbti);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				mbtiCnt = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return mbtiCnt;
	}
	
	// 메인화면 게시판별 랭크 뽑아내기
	// 분석형 게시판 랭크 탑 5 출력
	public ArrayList<BoardBean> rankanalBoard() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();
		
		try {
			con = getConnection();
			sql = "select b_no , title , user_nick, good from("
					+"select b_no, title, user_nick, good from board"
					+" where  board_type='anal' and TO_CHAR(\"DATE\", 'MM') = TO_CHAR(SYSDATE, 'MM')" 
				    +" order by good desc) where rownum <= 5";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardBean board = new BoardBean();
				board.setB_no(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setUser_nick(rs.getString(3));
				board.setCount(rs.getInt(4));
				
				boardList.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return boardList;
	}
	// 외교형 게시판 랭크 탑 5 출력
	public ArrayList<BoardBean> rankdiplBoard() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();
		
		try {
			con = getConnection();
			sql = "select b_no , title , user_nick, good from("
					+"select b_no, title, user_nick, good from board"
					+" where  board_type='dipl' and TO_CHAR(\"DATE\", 'MM') = TO_CHAR(SYSDATE, 'MM')" 
				    +" order by good desc) where rownum <= 5";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardBean board = new BoardBean();
				board.setB_no(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setUser_nick(rs.getString(3));
				board.setCount(rs.getInt(4));
				
				boardList.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return boardList;
	}
	// 관리자형 게시판 랭크 탑 5 출력
	public ArrayList<BoardBean> rankadminBoard() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();
		
		try {
			con = getConnection();
			sql = "select b_no , title , user_nick, good from("
					+"select b_no, title, user_nick, good from board"
					+" where  board_type='admin' and TO_CHAR(\"DATE\", 'MM') = TO_CHAR(SYSDATE, 'MM')" 
				    +" order by good desc) where rownum <= 5";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardBean board = new BoardBean();
				board.setB_no(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setUser_nick(rs.getString(3));
				board.setCount(rs.getInt(4));
				
				boardList.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return boardList;
	}
	// 탐험가형 게시판 랭크 탑 5 출력
	public ArrayList<BoardBean> rankexpBoard() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();
		
		try {
			con = getConnection();
			sql = "select b_no , title , user_nick, good from("
					+"select b_no, title, user_nick, good from board"
					+" where  board_type='exp' and TO_CHAR(\"DATE\", 'MM') = TO_CHAR(SYSDATE, 'MM')" 
				    +" order by good desc) where rownum <= 5";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardBean board = new BoardBean();
				board.setB_no(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setUser_nick(rs.getString(3));
				board.setCount(rs.getInt(4));
				
				boardList.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return boardList;
	}

	// 게시판 글 작성하기
	public int insertBoard(BoardBean board, String nick) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int number;

		try {
			con = getConnection();
			sql = "select max(b_no) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				number = rs.getInt(1) + 1;
			} else {
				number = 1;
			}

			sql = "insert into board values(?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, number);
			pstmt.setString(2, nick);
			pstmt.setTimestamp(3, board.getDate());
			pstmt.setInt(4, board.getCount());
			pstmt.setInt(5, board.getGood());
			pstmt.setString(6, HanConv.toKor(board.getTitle()));
			pstmt.setString(7, HanConv.toKor(board.getContent()));
			pstmt.setString(8, HanConv.toKor(board.getBoard_type()));
			pstmt.setString(9, board.getPwd());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return 1;
	}
	
	// 게시판리스트 내용 자유게시판에 뿌리기
	public ArrayList<BoardBean> freelistBoard(String pageNumber, String search_col, String search_content) {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		ResultSet pageSet = null;
		int dbCount = 0;
		int absolutePage = 1;
		
		ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();
		try {
			con = getConnection();
			//stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			stmt = con.createStatement();
			try {
				if(search_content != null) {
					if(search_col.equals("title")) {
						sql = "select count(b_no) from board where board_type = 'free' and title like '%" + search_content + "%'";
					} else if(search_col.equals("writer")) {
						sql = "select count(b_no) from board where board_type = 'free' and user_nick like '%" + search_content + "%'";
					} else if(search_col.equals("content")) {
						sql = "select count(b_no) from board where board_type = 'free' and content like '%" + search_content + "%'";
					} else {
						sql = "select count(b_no) from board where board_type = 'free'";
					}
				} else {
					sql = "select count(b_no) from board where board_type = 'free'";
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			pageSet = stmt.executeQuery(sql);
			
			if(pageSet.next()) {
				dbCount = pageSet.getInt(1);
				pageSet.close();
				stmt.close();
			}
			
			if(dbCount % BoardBean.pageSize == 0) {
				BoardBean.pageCount = dbCount / BoardBean.pageSize;
			} else {
				BoardBean.pageCount = dbCount / BoardBean.pageSize + 1;
			}
			
			if(pageNumber != null) {
				BoardBean.pageNum = Integer.parseInt(pageNumber);
				absolutePage = (BoardBean.pageNum - 1) * BoardBean.pageSize + 1;
			}
			
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			try {
				if(search_content != null) {
					if(search_col.equals("title")) {
						sql = "select * from board where board_type = 'free' and title like '%" + search_content + "%' order by b_no desc";
					} else if(search_col.equals("writer")) {
						sql = "select * from board where board_type = 'free' and user_nick like '%" + search_content + "%' order by b_no desc";
					} else if(search_col.equals("content")) {
						sql = "select * from board where board_type = 'free' and content like '%" + search_content + "%' order by b_no desc";
					} else {
						sql = "select * from board where board_type = 'free' order by b_no desc";
					}
				} else {
					sql = "select * from board where board_type = 'free' order by b_no desc";
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			rs = stmt.executeQuery(sql);
			// System.out.println(search_col);
			// System.out.println(search_content);
			if(rs.next()) {
				rs.absolute(absolutePage);
				int count = 0;
				while(count < BoardBean.pageSize) {
					BoardBean board = new BoardBean();
					board.setB_no(rs.getInt(1));
					board.setUser_nick(rs.getString(2));
					board.setDate(rs.getTimestamp(3));
					board.setCount(rs.getInt(4));
					board.setGood(rs.getInt(5));
					board.setTitle(rs.getString(6));
					board.setContent(rs.getString(7));
					board.setBoard_type(rs.getString(8));
					board.setPwd(rs.getString(9));

					boardList.add(board);
					if(rs.isLast()) {
						break;
					} else {
						rs.next();
					}
					count++;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return boardList;
	}

	// 게시판리스트 내용 분석형게시판에 뿌리기
	public ArrayList<BoardBean> anallistBoard(String pageNumber, String search_col, String search_content) {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		ResultSet pageSet = null;
		int dbCount = 0;
		int absolutePage = 1;
		
		ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();

		try {
			con = getConnection();
			//stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			stmt = con.createStatement();
			try {
				if(search_content != null) {
					if(search_col.equals("title")) {
						sql = "select count(b_no) from board where board_type = 'anal' and title like '%" + search_content + "%'";
					} else if(search_col.equals("writer")) {
						sql = "select count(b_no) from board where board_type = 'anal' and user_nick like '%" + search_content + "%'";
					} else if(search_col.equals("content")) {
						sql = "select count(b_no) from board where board_type = 'anal' and content like '%" + search_content + "%'";
					} else {
						sql = "select count(b_no) from board where board_type = 'anal'";
					}
				} else {
					sql = "select count(b_no) from board where board_type = 'anal'";
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			pageSet = stmt.executeQuery(sql);
			
			if(pageSet.next()) {
				dbCount = pageSet.getInt(1);
				pageSet.close();
				stmt.close();
			}
			
			if(dbCount % BoardBean.pageSize == 0) {
				BoardBean.pageCount = dbCount / BoardBean.pageSize;
			} else {
				BoardBean.pageCount = dbCount / BoardBean.pageSize + 1;
			}
			
			if(pageNumber != null) {
				BoardBean.pageNum = Integer.parseInt(pageNumber);
				absolutePage = (BoardBean.pageNum - 1) * BoardBean.pageSize + 1;
			}
			
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			try {
				if(search_col != null && search_content != null) {
					if(search_col.equals("title")) {
						sql = "select * from board where board_type = 'anal' and title like '%" + search_content + "%' order by b_no desc";
					} else if(search_col.equals("writer")) {
						sql = "select * from board where board_type = 'anal' and user_nick like '%" + search_content + "%' order by b_no desc";
					} else if(search_col.equals("content")) {
						sql = "select * from board where board_type = 'anal' and content like '%" + search_content + "%' order by b_no desc";
					} else {
						sql = "select * from board where board_type = 'anal' order by b_no desc";
					}
				} else {
					sql = "select * from board where board_type = 'anal' order by b_no desc";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				rs.absolute(absolutePage);
				int count = 0;
				while(count < BoardBean.pageSize) {
					BoardBean board = new BoardBean();
					board.setB_no(rs.getInt(1));
					board.setUser_nick(rs.getString(2));
					board.setDate(rs.getTimestamp(3));
					board.setCount(rs.getInt(4));
					board.setGood(rs.getInt(5));
					board.setTitle(rs.getString(6));
					board.setContent(rs.getString(7));
					board.setBoard_type(rs.getString(8));
					board.setPwd(rs.getString(9));

					boardList.add(board);
					if(rs.isLast()) {
						break;
					} else {
						rs.next();
					}
					count++;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return boardList;
	}
	// 게시판 리스트 외교형 게시판에 내용 뿌리기
	public ArrayList<BoardBean> dipllistBoard(String pageNumber, String search_col, String search_content) {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		ResultSet pageSet = null;
		int dbCount = 0;
		int absolutePage = 1;
		
		ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();

		try {
			con = getConnection();
			//stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			stmt = con.createStatement();
			try {
				if(search_col != null && search_content != null) {
					if(search_col.equals("title")) {
						sql = "select count(b_no) from board where board_type = 'dipl' and title like '%" + search_content + "%'";
					} else if(search_col.equals("writer")) {
						sql = "select count(b_no) from board where board_type = 'dipl' and user_nick like '%" + search_content + "%'";
					} else if(search_col.equals("content")) {
						sql = "select count(b_no) from board where board_type = 'dipl' and content like '%" + search_content + "%'";
					} else {
						sql = "select count(b_no) from board where board_type = 'dipl'";
					}
				} else {
					sql = "select count(b_no) from board where board_type = 'dipl'";
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			pageSet = stmt.executeQuery(sql);
			
			if(pageSet.next()) {
				dbCount = pageSet.getInt(1);
				pageSet.close();
				stmt.close();
			}
			
			if(dbCount % BoardBean.pageSize == 0) {
				BoardBean.pageCount = dbCount / BoardBean.pageSize;
			} else {
				BoardBean.pageCount = dbCount / BoardBean.pageSize + 1;
			}
			
			if(pageNumber != null) {
				BoardBean.pageNum = Integer.parseInt(pageNumber);
				absolutePage = (BoardBean.pageNum - 1) * BoardBean.pageSize + 1;
			}
			
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			try {
				if(search_col != null && search_content != null) {
					if(search_col.equals("title")) {
						sql = "select * from board where board_type = 'dipl' and title like '%" + search_content + "%' order by b_no desc";
					} else if(search_col.equals("writer")) {
						sql = "select * from board where board_type = 'dipl' and user_nick like '%" + search_content + "%' order by b_no desc";
					} else if(search_col.equals("content")) {
						sql = "select * from board where board_type = 'dipl' and content like '%" + search_content + "%' order by b_no desc";
					} else {
						sql = "select * from board where board_type = 'dipl' order by b_no desc";
					}
				} else {
					sql = "select * from board where board_type = 'dipl' order by b_no desc";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				rs.absolute(absolutePage);
				int count = 0;
				while(count < BoardBean.pageSize) {
					BoardBean board = new BoardBean();
					board.setB_no(rs.getInt(1));
					board.setUser_nick(rs.getString(2));
					board.setDate(rs.getTimestamp(3));
					board.setCount(rs.getInt(4));
					board.setGood(rs.getInt(5));
					board.setTitle(rs.getString(6));
					board.setContent(rs.getString(7));
					board.setBoard_type(rs.getString(8));
					board.setPwd(rs.getString(9));

					boardList.add(board);
					if(rs.isLast()) {
						break;
					} else {
						rs.next();
					}
					count++;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return boardList;
	}
	// 게시판리스트 내용 관리자형게시판에 뿌리기
	public ArrayList<BoardBean> adminlistBoard(String pageNumber, String search_col, String search_content) {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		ResultSet pageSet = null;
		int dbCount = 0;
		int absolutePage = 1;
		
		ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();

		try {
			con = getConnection();
			//stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			stmt = con.createStatement();
			try {
				if(search_col != null && search_content != null) {
					if(search_col.equals("title")) {
						sql = "select count(b_no) from board where board_type = 'admin' and title like '%" + search_content + "%'";
					} else if(search_col.equals("writer")) {
						sql = "select count(b_no) from board where board_type = 'admin' and user_nick like '%" + search_content + "%'";
					} else if(search_col.equals("content")) {
						sql = "select count(b_no) from board where board_type = 'admin' and content like '%" + search_content + "%'";
					} else {
						sql = "select count(b_no) from board where board_type = 'free'";
					}
				} else {
					sql = "select count(b_no) from board where board_type = 'free'";
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			pageSet = stmt.executeQuery(sql);
			
			if(pageSet.next()) {
				dbCount = pageSet.getInt(1);
				pageSet.close();
				stmt.close();
			}
			
			if(dbCount % BoardBean.pageSize == 0) {
				BoardBean.pageCount = dbCount / BoardBean.pageSize;
			} else {
				BoardBean.pageCount = dbCount / BoardBean.pageSize + 1;
			}
			
			if(pageNumber != null) {
				BoardBean.pageNum = Integer.parseInt(pageNumber);
				absolutePage = (BoardBean.pageNum - 1) * BoardBean.pageSize + 1;
			}
			
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			try {
				if(search_col != null && search_content != null) {
					if(search_col.equals("title")) {
						sql = "select * from board where board_type = 'admin' and title like '%" + search_content + "%' order by b_no desc";
					} else if(search_col.equals("writer")) {
						sql = "select * from board where board_type = 'admin' and user_nick like '%" + search_content + "%' order by b_no desc";
					} else if(search_col.equals("content")) {
						sql = "select * from board where board_type = 'admin' and content like '%" + search_content + "%' order by b_no desc";
					} else {
						sql = "select * from board where board_type = 'admin' order by b_no desc";
					}
				} else {
					sql = "select * from board where board_type = 'admin' order by b_no desc";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				rs.absolute(absolutePage);
				int count = 0;
				while(count < BoardBean.pageSize) {
					BoardBean board = new BoardBean();
					board.setB_no(rs.getInt(1));
					board.setUser_nick(rs.getString(2));
					board.setDate(rs.getTimestamp(3));
					board.setCount(rs.getInt(4));
					board.setGood(rs.getInt(5));
					board.setTitle(rs.getString(6));
					board.setContent(rs.getString(7));
					board.setBoard_type(rs.getString(8));
					board.setPwd(rs.getString(9));

					boardList.add(board);
					if(rs.isLast()) {
						break;
					} else {
						rs.next();
					}
					count++;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return boardList;
	}

	// 게시판리스트 내용 탐험가형게시판에 뿌리기
	public ArrayList<BoardBean> explistBoard(String pageNumber, String search_col, String search_content) {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		ResultSet pageSet = null;
		int dbCount = 0;
		int absolutePage = 1;
		
		ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();

		try {
			con = getConnection();
			//stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			stmt = con.createStatement();
			try {
				if(search_col != null && search_content != null) {
					if(search_col.equals("title")) {
						sql = "select count(b_no) from board where board_type = 'exp' and title like '%" + search_content + "%'";
					} else if(search_col.equals("writer")) {
						sql = "select count(b_no) from board where board_type = 'exp' and user_nick like '%" + search_content + "%'";
					} else if(search_col.equals("content")) {
						sql = "select count(b_no) from board where board_type = 'exp' and content like '%" + search_content + "%'";
					} else {
						sql = "select count(b_no) from board where board_type = 'exp'";
					}
				} else {
					sql = "select count(b_no) from board where board_type = 'exp'";
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			pageSet = stmt.executeQuery(sql);
			
			if(pageSet.next()) {
				dbCount = pageSet.getInt(1);
				pageSet.close();
				stmt.close();
			}
			
			if(dbCount % BoardBean.pageSize == 0) {
				BoardBean.pageCount = dbCount / BoardBean.pageSize;
			} else {
				BoardBean.pageCount = dbCount / BoardBean.pageSize;
			}
			
			if(pageNumber != null) {
				BoardBean.pageNum = Integer.parseInt(pageNumber);
				absolutePage = (BoardBean.pageNum - 1) * BoardBean.pageSize + 1;
			}
			
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			if(search_col != null && search_content != null) {
				if(search_col.equals("title")) {
					sql = "select * from board where board_type = 'exp' and title like '%" + search_content + "%' order by b_no desc";
				} else if(search_col.equals("writer")) {
					sql = "select * from board where board_type = 'exp' and user_nick like '%" + search_content + "%' order by b_no desc";
				} else if(search_col.equals("content")) {
					sql = "select * from board where board_type = 'exp' and content like '%" + search_content + "%' order by b_no desc";
				} else {
					sql = "select * from board where board_type = 'exp' order by b_no desc";
				}
			} else {
				sql = "select * from board where board_type = 'exp' order by b_no desc";
			}
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				rs.absolute(absolutePage);
				int count = 0;
				while(count < BoardBean.pageSize) {
					BoardBean board = new BoardBean();
					board.setB_no(rs.getInt(1));
					board.setUser_nick(rs.getString(2));
					board.setDate(rs.getTimestamp(3));
					board.setCount(rs.getInt(4));
					board.setGood(rs.getInt(5));
					board.setTitle(rs.getString(6));
					board.setContent(rs.getString(7));
					board.setBoard_type(rs.getString(8));
					board.setPwd(rs.getString(9));

					boardList.add(board);
					if(rs.isLast()) {
						break;
					} else {
						rs.next();
					}
					count++;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return boardList;
	}
	
	// 조회수 증가하는 메서드
	public void updateBoardCount(int b_no) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		try {
			con = getConnection();
			sql = "update board set count = count + 1 where b_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_no);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	// 게시글 상세 확인 메서드
	public BoardBean getBoard(int b_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		BoardBean board = null;

		try {
			con = getConnection();
			sql = "select * from board where b_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_no);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				board = new BoardBean();
				board.setB_no(rs.getInt(1));
				board.setUser_nick(rs.getString(2));
				board.setDate(rs.getTimestamp(3));
				board.setCount(rs.getInt(4));
				board.setGood(rs.getInt(5));
				board.setTitle(rs.getString(6));
				board.setContent(rs.getString(7));
				board.setBoard_type(rs.getString(8));
				board.setPwd(rs.getString(9));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return board;
	}
	
	//게시글 수정하는 메서드
	public int editBoard(BoardBean board) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;
		String pwd = "";
		
		try {
			con = getConnection();
			sql = "select pwd from board where b_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board.getB_no());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pwd = rs.getString(1);
				
				if(!pwd.equals(board.getPwd())) {
					// 비밀번호가 다를 경우
					re = 0;
				} else {
					sql = "update board set title = ?, content = ?, board_type = ? where b_no = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, HanConv.toKor(board.getTitle()));
					pstmt.setString(2, HanConv.toKor(board.getContent()));
					pstmt.setString(3, board.getBoard_type());
					pstmt.setInt(4, board.getB_no());
					pstmt.executeUpdate();
					re = 1;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}
	
	// 게시글 삭제하는 메서드
	public int deleteBoard(int b_no, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;
		String b_pwd = "";
		
		try {
			con = getConnection();
			sql = "select pwd from board where b_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_no);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				b_pwd = rs.getString(1);
				
				if (!b_pwd.equals(pwd)) {
					re = 0;
				} else {
					// 댓글 먼저 삭제한 후 글 내용 삭제(fk로 종속되어있음), 추천테이블에도 해당 글 삭제
					sql = "delete goodcheck where good_b_no = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, b_no);
					pstmt.executeUpdate();
					
					sql = "delete boardcomment where b_no = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, b_no);
					pstmt.executeUpdate();
					
					sql = "delete board where b_no = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, b_no);
					pstmt.executeUpdate();
					re = 1;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}
	// goodcheck 테이블에 번호랑 추천누른 사람 계정 저장하기
	public int insertGoodcheck(String nick, int b_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int re = 0;
		try {
			con = getConnection();
			sql = "insert into goodcheck values(?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, nick);
			pstmt.setInt(2, b_no);
			pstmt.executeUpdate();
			re = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}
	// goodcheck 테이블에서 번호에 저장된 닉네임값 가져오기 (추천 한 계정 당 한번만 받기위한 메서드)
	public String getGoodNick(int b_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		String nick = "";
		
		try {
			con = getConnection();
			sql = "select GOOD_USER_NICK from goodcheck where GOOD_B_NO=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_no);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				nick = rs.getString(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return nick;
	}
	
	// 추천 갯수 올리는 메서드
	public void updateGoodCount(int b_no) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		try {
			con = getConnection();
			sql = "update board set good = good + 1 where b_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_no);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	//////////////////////////////////////////////////////// 댓글
	//////////////////////////////////////////////////////// 메서드///////////////////////////////////////////////////////////////

	// 댓글 테이블에 넣어주는 메서드
	public int insertComment(BoardBean board, int b_no, String nick) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int number;
		try {
			con = getConnection();
			
			sql = "select max(c_no) from boardcomment";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				number = rs.getInt(1) + 1;
			} else {
				number = 1;
			}

			sql = "insert into boardcomment values(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, b_no);
			pstmt.setString(2, nick);
			pstmt.setString(3, HanConv.toKor(board.getC_content()));
			pstmt.setTimestamp(4, board.getC_time());
			pstmt.setInt(5, number);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return 1;
	}

	// 댓글리스트로 받아서 화면에 뿌려주는 메서드
	public ArrayList<BoardBean> listCommnet(int b_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();

		try {
			con = getConnection();
			sql = "select * from boardcomment where b_no=? order by c_time";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_no);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardBean board = new BoardBean();
				board.setB_no(rs.getInt(1));
				board.setC_user_nick(rs.getString(2));
				board.setC_content(rs.getString(3));
				board.setC_time(rs.getTimestamp(4));
				board.setC_no(rs.getInt(5));

				boardList.add(board);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return boardList;
	}
	// 댓글 총 갯수 세는 메서드
	public int countcomment(int b_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int cnt = 0;

		try {
			con = getConnection();
			sql = "select count(*) from boardcomment where b_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_no);
			rs = pstmt.executeQuery();
			
			if(rs != null &&rs.next()) {
				cnt = rs.getInt(1);
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}
	//댓글 삭제하는 메소드
	public int deleteComment(int c_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int re = -1;
		
		try {
			con = getConnection();
			sql = "delete boardcomment where c_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, c_no);
			pstmt.executeUpdate();
			re = 1;
			
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
		return re;
	}

	
//공지사항 글 작성하기
	public int insertNotice(BoardBean board, String nick) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int number;

		try {
			con = getConnection();
			sql = "select max(n_no) from notification";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				number = rs.getInt(1) + 1;
			} else {
				number = 1;
			}

			sql = "insert into notification values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, number);
			pstmt.setString(2, nick);
			pstmt.setTimestamp(3, board.getDate());
			pstmt.setInt(4, board.getN_count());
			//pstmt.setInt(5, board.getGood());
			//pstmt.setInt(6, board.getBad());
			pstmt.setString(5, HanConv.toKor(board.getN_title()));
			pstmt.setString(6, HanConv.toKor(board.getN_content()));
			pstmt.setString(7, HanConv.toKor(board.getNotice_type()));
			pstmt.setString(8, board.getN_pwd());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return 1;
	}

	// 공지리스트 내용 공지(게시판관련)에 뿌리기
	public ArrayList<BoardBean> boardNoticeList(String pageNumber, String search_col, String search_content) {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		ResultSet pageSet = null;
		int dbCount = 0;
		int absolutePage = 1;
		
		ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();
		try {
			con = getConnection();
			//stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			stmt = con.createStatement();
			try {
				if(search_content != null) {
					if(search_col.equals("n_title")) {
						sql = "select count(n_no) from notification where notice_type = 'board' and n_title like '%" + search_content + "%'";
					} else if(search_col.equals("writer")) {
						sql = "select count(n_no) from notification where notice_type = 'board' and user_nick like '%" + search_content + "%'";
					} else if(search_col.equals("n_content")) {
						sql = "select count(n_no) from notification where notice_type = 'board' and n_content like '%" + search_content + "%'";
					} else {
						sql = "select count(n_no) from notification where notice_type = 'board'";
					}
				} else {
					sql = "select count(n_no) from notification where notice_type = 'board'";
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			pageSet = stmt.executeQuery(sql);
			
			if(pageSet.next()) {
				dbCount = pageSet.getInt(1);
				pageSet.close();
				stmt.close();
			}
			
			if(dbCount % BoardBean.pageSize == 0) {
				BoardBean.pageCount = dbCount / BoardBean.pageSize;
			} else {
				BoardBean.pageCount = dbCount / BoardBean.pageSize + 1;
			}
			
			if(pageNumber != null) {
				BoardBean.pageNum = Integer.parseInt(pageNumber);
				absolutePage = (BoardBean.pageNum - 1) * BoardBean.pageSize + 1;
			}
			
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			try {
				if(search_content != null) {
					if(search_col.equals("n_title")) {
						sql = "select * from notification where notice_type = 'board' and n_title like '%" + search_content + "%' order by n_no desc";
					} else if(search_col.equals("writer")) {
						sql = "select * from notification where notice_type = 'board' and user_nick like '%" + search_content + "%' order by n_no desc";
					} else if(search_col.equals("n_content")) {
						sql = "select * from notification where notice_type = 'board' and n_content like '%" + search_content + "%' order by n_no desc";
					} else {
						sql = "select * from notification where notice_type = 'board' order by n_no desc";
					}
				} else {
					sql = "select * from notification where notice_type = 'board' order by n_no desc";
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			rs = stmt.executeQuery(sql);
			// System.out.println(search_col);
			// System.out.println(search_content);
			if(rs.next()) {
				rs.absolute(absolutePage);
				int count = 0;
				while(count < BoardBean.pageSize) {
					BoardBean board = new BoardBean();
					board.setN_no(rs.getInt(1));
					board.setUser_nick(rs.getString(2));
					board.setDate(rs.getTimestamp(3));
					board.setN_count(rs.getInt(4));
//					board.setGood(rs.getInt(5));
					board.setN_title(rs.getString(5));
					board.setN_content(rs.getString(6));
					board.setNotice_type(rs.getString(7));
					board.setN_pwd(rs.getString(8));

					boardList.add(board);
					if(rs.isLast()) {
						break;
					} else {
						rs.next();
					}
					count++;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return boardList;
	}
	
	// 공지리스트 내용 공지(채팅관련)에 뿌리기
		public ArrayList<BoardBean> chattingNoticeList(String pageNumber, String search_col, String search_content) {
			Connection con = null;
			Statement stmt = null;
			ResultSet rs = null;
			String sql = "";
			ResultSet pageSet = null;
			int dbCount = 0;
			int absolutePage = 1;
			ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();
			try {
				con = getConnection();
				//stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				stmt = con.createStatement();
				try {
					if(search_content != null) {
						if(search_col.equals("n_title")) {
							sql = "select count(n_no) from notification where notice_type = 'chatting' and n_title like '%" + search_content + "%'";
						} else if(search_col.equals("writer")) {
							sql = "select count(n_no) from notification where notice_type = 'chatting' and user_nick like '%" + search_content + "%'";
						} else if(search_col.equals("n_content")) {
							sql = "select count(n_no) from notification where notice_type = 'chatting' and n_content like '%" + search_content + "%'";
						} else {
							sql = "select count(n_no) from notification where notice_type = 'chatting'";
						}
					} else {
						sql = "select count(n_no) from notification where notice_type = 'chatting'";
					}
				} catch (Exception e2) {
					e2.printStackTrace();
				}
				pageSet = stmt.executeQuery(sql);
				
				if(pageSet.next()) {
					dbCount = pageSet.getInt(1);
					pageSet.close();
					stmt.close();
				}
				
				if(dbCount % BoardBean.pageSize == 0) {
					BoardBean.pageCount = dbCount / BoardBean.pageSize;
				} else {
					BoardBean.pageCount = dbCount / BoardBean.pageSize + 1;
				}
				
				if(pageNumber != null) {
					BoardBean.pageNum = Integer.parseInt(pageNumber);
					absolutePage = (BoardBean.pageNum - 1) * BoardBean.pageSize + 1;
				}
				
				stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				try {
					if(search_content != null) {
						if(search_col.equals("n_title")) {
							sql = "select * from notification where notice_type = 'chatting' and n_title like '%" + search_content + "%' order by n_no desc";
						} else if(search_col.equals("writer")) {
							sql = "select * from notification where notice_type = 'chatting' and user_nick like '%" + search_content + "%' order by n_no desc";
						} else if(search_col.equals("n_content")) {
							sql = "select * from notification where notice_type = 'chatting' and n_content like '%" + search_content + "%' order by n_no desc";
						} else {
							sql = "select * from notification where notice_type = 'chatting' order by n_no desc";
						}
					} else {
						sql = "select * from notification where notice_type = 'chatting' order by n_no desc";
					}
				} catch (Exception e2) {
					e2.printStackTrace();
				}
				rs = stmt.executeQuery(sql);
				// System.out.println(search_col);
				// System.out.println(search_content);
				if(rs.next()) {
					rs.absolute(absolutePage);
					int count = 0;
					while(count < BoardBean.pageSize) {
						BoardBean board = new BoardBean();
						board.setN_no(rs.getInt(1));
						board.setUser_nick(rs.getString(2));
						board.setDate(rs.getTimestamp(3));
						board.setN_count(rs.getInt(4));
//						board.setGood(rs.getInt(5));
						board.setN_title(rs.getString(5));
						board.setN_content(rs.getString(6));
						board.setNotice_type(rs.getString(7));
						board.setN_pwd(rs.getString(8));

						boardList.add(board);
						if(rs.isLast()) {
							break;
						} else {
							rs.next();
						}
						count++;
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (stmt != null)
						stmt.close();
					if (con != null)
						con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			return boardList;
		}

	// 공지사항 게시물 조회수 증가하는 메서드
	public void updateNoticeCount(int n_no) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		try {
			con = getConnection();
			sql = "update notification set n_count = n_count + 1 where n_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, n_no);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	// 리스트에서 게시물 클릭하면 해당 내용 화면에 뿌리기
	public BoardBean getNotice(int n_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		BoardBean board = null;

		try {
			con = getConnection();
			sql = "select * from notification where n_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, n_no);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				board = new BoardBean();
				board.setN_no(rs.getInt(1)); 
				board.setUser_nick(rs.getString(2));
				board.setDate(rs.getTimestamp(3));
				board.setN_count(rs.getInt(4)); 
				//board.setGood(rs.getInt(5));
				//board.setBad(rs.getInt(6));
				board.setN_title(rs.getString(5)); 
				board.setN_content(rs.getString(6)); 
				board.setNotice_type(rs.getString(7));
				board.setN_pwd(rs.getString(8)); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (con != null)
		con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return board;
	}
	
	//공지사항 수정하는 메서드
		public int editNotice(BoardBean board) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "";
			int re = -1;
			String n_pwd = "";
			
			try {
				con = getConnection();
				sql = "select n_pwd from notification where n_no = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, board.getN_no());
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					n_pwd = rs.getString(1);
					
					if(!n_pwd.equals(board.getN_pwd())) {
						// 비밀번호가 다를 경우
						re = 0;
					} else {
						sql = "update notification set n_title = ?, n_content = ?, notice_type = ? where n_no = ?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, HanConv.toKor(board.getN_title()));
						pstmt.setString(2, HanConv.toKor(board.getN_content()));
						pstmt.setString(3, board.getNotice_type());
						pstmt.setInt(4, board.getN_no());
						pstmt.executeUpdate();
						re = 1;
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null) rs.close();
					if (pstmt != null) pstmt.close();
					if (con != null) con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			return re;
		}
		
		// 공지사항 삭제하는 메서드
		public int deleteNotice(int n_no, String pwd) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "";
			int re = -1;
			String n_pwd = "";
			
			try {
				con = getConnection();
				sql = "select n_pwd from notification where n_no = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, n_no);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					n_pwd = rs.getString(1);
					
					if (!n_pwd.equals(pwd)) {
						re = 0;
					} else {
							
						
						sql = "delete notification where n_no = ?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, n_no);
						pstmt.executeUpdate();
						re = 1;
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null) rs.close();
					if (pstmt != null) pstmt.close();
					if (con != null) con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			return re;
		}
		
		// 메인화면에 공지사항 제목만 뿌리는 메서드
		public ArrayList<BoardBean> mainNoticeBoard() {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "";
			ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();
			
			try {
				con = getConnection();
				sql = "select n_title, notice_type, n_no from notification";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					BoardBean board = new BoardBean();
					board.setN_title(rs.getString(1));
					board.setNotice_type(rs.getString(2));
					board.setN_no(rs.getInt(3));
					
					boardList.add(board);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null) rs.close();
					if (pstmt != null) pstmt.close();
					if (con != null) con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			return boardList;
		}
	
	//채팅프로필 테이블에 저장하기
		public int insertChatProfile(BoardBean board, String nick, String mbti) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = "";

			try {
				con = getConnection();
				sql = "insert into chatprofile values(?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setTimestamp(1, board.getReg_date());
				pstmt.setString(2, nick);
				pstmt.setString(3, mbti);
				pstmt.setString(4, board.getP_content());
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (pstmt != null)
						pstmt.close();
					if (con != null)
						con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			
			return 1;
		} 
	// 화면에 채팅 디비뿌리기 
		public ArrayList<BoardBean> chatProfileBoard() {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "";
			ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();
			
			try {
				con = getConnection();
				sql = "select user_nick, mbti, p_content from chatprofile order by reg_date desc";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					BoardBean board = new BoardBean();
					board.setUser_nick(rs.getString(1));
					board.setMbti(rs.getString(2));
					board.setP_content(rs.getString(3));
					
					boardList.add(board);

				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null) rs.close();
					if (pstmt != null) pstmt.close();
					if (con != null) con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			return boardList;
		} 
		
		// 이미 프로필등록했으면 수정,삭제만 뜨게 하기위한 메서드
		public String chatWriter(String nick) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "";
			String writer = "";
			
			try {
				con = getConnection();
				sql = "select user_nick from chatprofile where user_nick = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, nick);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					writer = rs.getString(1);
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null) rs.close();
					if (pstmt != null) pstmt.close();
					if (con != null) con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			return writer;
		}
		// 채팅프로필 테이블 수정
		public int editChatProfile(String nick, String p_content, BoardBean board) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "";
			int re = -1;
			
			try {
				con = getConnection();
				sql = "update chatprofile set p_content = ?, reg_date = ? where user_nick = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, p_content);
				pstmt.setTimestamp(2, board.getReg_date());
				pstmt.setString(3, nick);
				pstmt.executeUpdate();
				re = 1;
	
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null) rs.close();
					if (pstmt != null) pstmt.close();
					if (con != null) con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			return re;
		}
		
			// 채팅프로필 삭제하기
		public void deleteChatProfile(String nick) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "";
			
			try {
				con = getConnection();
				sql = "delete message where user_nick = ? or to_nick = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, nick);
				pstmt.setString(2, nick);
				pstmt.executeUpdate();
				sql = "delete chatprofile where user_nick = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, nick);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null) rs.close();
					if (pstmt != null) pstmt.close();
					if (con != null) con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
		// 내가 쓴 글 보기 메소드
				public ArrayList<BoardBean> member_listBoard(String pageNumber, String user_nick) {
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = "";
					int dbCount = 0;
					int absolutepage = 0;
					
					ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();
					
					try {
						con = getConnection();
						
						sql = "select count(b_no) from board where user_nick = ?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, user_nick);
						rs = pstmt.executeQuery();
						
						if (rs.next()) {
							dbCount = rs.getInt(1);
							rs.close();
						}
						
						if (dbCount % BoardBean.pageSize == 0) {
							BoardBean.pageCount = dbCount / BoardBean.mem_pageSize;
						} else {
							BoardBean.pageCount = dbCount / BoardBean.mem_pageSize + 1;
						}
						
						if (pageNumber != null) {
							BoardBean.pageNum = Integer.parseInt(pageNumber);
							absolutepage = (BoardBean.pageNum-1) * BoardBean.mem_pageSize + 1;
						}
						pstmt.close();
						
						sql = "select * from board where user_nick = ? order by b_no desc";
						pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
						pstmt.setString(1, user_nick);
						rs = pstmt.executeQuery();
						
						if (rs.next()) {
							rs.absolute(absolutepage);
							int count = 0;
							while (count < BoardBean.mem_pageSize) {
								BoardBean board = new BoardBean();
								board.setB_no(rs.getInt(1));
								board.setUser_nick(rs.getString(2));
								board.setDate(rs.getTimestamp(3));
								board.setCount(rs.getInt(4));
								board.setGood(rs.getInt(5));
								board.setTitle(rs.getString(6));
								board.setContent(rs.getString(7));
								board.setBoard_type(rs.getString(8));
								board.setPwd(rs.getString(9));

								boardList.add(board);
								if(rs.isLast()) {
									break;
								} else {
									rs.next();
								}
								count++;
							}
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						try {
							if (rs != null) rs.close();
							if (pstmt != null) pstmt.close();
							if (con != null) con.close();
						} catch (Exception e2) {
							e2.printStackTrace();
						}
					}
					return boardList;
				}
				
				// 내가 쓴 댓글 보기 메소드
				public ArrayList<BoardBean> member_listcomment(String pageNumber, String user_nick) {
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = "";
					int dbCount = 0;
					int absolutepage = 0;
					
					ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();
					
					try {
						con = getConnection();
						
						sql = "select count(b_no) from boardcomment where user_nick = ?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, user_nick);
						rs = pstmt.executeQuery();
						
						if (rs.next()) {
							dbCount = rs.getInt(1);
							rs.close();
						}
						
						if (dbCount % BoardBean.mem_pageSize == 0) {
							BoardBean.pageCount = dbCount / BoardBean.mem_pageSize;
						} else {
							BoardBean.pageCount = dbCount / BoardBean.mem_pageSize + 1;
						}
						
						if (pageNumber != null) {
							BoardBean.pageNum = Integer.parseInt(pageNumber);
							absolutepage = (BoardBean.pageNum-1) * BoardBean.mem_pageSize + 1;
						}
						pstmt.close();
						
						sql = "select * from boardcomment where user_nick = ? order by b_no desc";
						pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
						pstmt.setString(1, user_nick);
						rs = pstmt.executeQuery();
						
						if (rs.next()) {
							rs.absolute(absolutepage);
							int count = 0;
							while (count < BoardBean.mem_pageSize) {
								BoardBean board = new BoardBean();
								board.setB_no(rs.getInt(1));
								board.setUser_nick(rs.getString(2));
								board.setC_content(rs.getString(3));
								board.setC_time(rs.getTimestamp(4));
								
								boardList.add(board);
								if(rs.isLast()) {
									break;
								} else {
									rs.next();
								}
								count++;
							}
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						try {
							if (rs != null) rs.close();
							if (pstmt != null) pstmt.close();
							if (con != null) con.close();
						} catch (Exception e2) {
							e2.printStackTrace();
						}
					}
					return boardList;
				}

	//qna 글 작성하기
	public int insertQna(BoardBean board, String nick) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int number;
		try {
			con = getConnection();
			sql = "select max(qna_no) from qna";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				number = rs.getInt(1) + 1;
			} else {
				number = 1;
			}

			sql = "insert into qna values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, nick);
			pstmt.setString(3, HanConv.toKor(board.getQna_title()));
			pstmt.setString(4, HanConv.toKor(board.getQna_content()));
			pstmt.setTimestamp(5, board.getDate());
			pstmt.setInt(6, board.getN_count());
			pstmt.setString(7, HanConv.toKor(board.getQuestion_type()));
			pstmt.setString(8, board.getQna_pwd());
			//pstmt.setInt(5, board.getGood());
			//pstmt.setInt(6, board.getBad());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return 1;
	}
				// QNA 내용 리스트(게시판관련)에 뿌리기
				public ArrayList<BoardBean> boardQnaList(String pageNumber, String search_col, String search_content) {
					Connection con = null;
					Statement stmt = null;
					ResultSet rs = null;
					String sql = "";
					ResultSet pageSet = null;
					int dbCount = 0;
					int absolutePage = 1;
					
					ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();
					try {
						con = getConnection();
						//stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
						stmt = con.createStatement();
						try {
							if(search_content != null) {
								if(search_col.equals("qna_title")) {
									sql = "select count(qna_no) from qna where question_type = 'board' and qna_title like '%" + search_content + "%'";
								} else if(search_col.equals("writer")) {
									sql = "select count(qna_no) from qna where question_type = 'board' and user_nick like '%" + search_content + "%'";
								} else if(search_col.equals("qna_content")) {
									sql = "select count(qna_no) from qna where question_type = 'board' and qna_content like '%" + search_content + "%'";
								} else {
									sql = "select count(qna_no) from qna where question_type = 'board'";
								}
							} else {
								sql = "select count(qna_no) from qna where question_type = 'board'";
							}
						} catch (Exception e2) {
							e2.printStackTrace();
						}
						pageSet = stmt.executeQuery(sql);
						
						if(pageSet.next()) {
							dbCount = pageSet.getInt(1);
							pageSet.close();
							stmt.close();
						}
						
						if(dbCount % BoardBean.pageSize == 0) {
							BoardBean.pageCount = dbCount / BoardBean.pageSize;
						} else {
							BoardBean.pageCount = dbCount / BoardBean.pageSize + 1;
						}
						
						if(pageNumber != null) {
							BoardBean.pageNum = Integer.parseInt(pageNumber);
							absolutePage = (BoardBean.pageNum - 1) * BoardBean.pageSize + 1;
						}
						
						stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
						try {
							if(search_content != null) {
								if(search_col.equals("qna_title")) {
									sql = "select * from qna where question_type = 'board' and qna_title like '%" + search_content + "%' order by qna_no desc";
								} else if(search_col.equals("writer")) {
									sql = "select * from qna where question_type = 'board' and user_nick like '%" + search_content + "%' order by qna_no desc";
								} else if(search_col.equals("qna_content")) {
									sql = "select * from qna where question_type = 'board' and qna_content like '%" + search_content + "%' order by qna_no desc";
								} else {
									sql = "select * from qna where question_type = 'board' order by qna_no desc";
								}
							} else {
								sql = "select * from qna where question_type = 'board' order by qna_no desc";
							}
						} catch (Exception e2) {
							e2.printStackTrace();
						}
						rs = stmt.executeQuery(sql);
						// System.out.println(search_col);
						// System.out.println(search_content);
						if(rs.next()) {
							rs.absolute(absolutePage);
							int count = 0;
							while(count < BoardBean.pageSize) {
								BoardBean board = new BoardBean();
								board.setQna_no(rs.getInt(1));
								board.setUser_nick(rs.getString(2));
								board.setQna_title(rs.getString(3));
								board.setQna_content(rs.getString(4));
								board.setDate(rs.getTimestamp(5));
								board.setQna_count(rs.getInt(6));
//								board.setGood(rs.getInt(5));
								board.setQuestion_type(rs.getString(7));
								board.setQna_pwd(rs.getString(8));

								boardList.add(board);
								if(rs.isLast()) {
									break;
								} else {
									rs.next();
								}
								count++;
							}
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						try {
							if (rs != null)
								rs.close();
							if (stmt != null)
								stmt.close();
							if (con != null)
								con.close();
						} catch (Exception e2) {
							e2.printStackTrace();
						}
					}
					return boardList;
				}
				
				// QNA 내용 리스트(채팅관련)에 뿌리기
						public ArrayList<BoardBean> chattingQnaList(String pageNumber, String search_col, String search_content) {
							Connection con = null;
							Statement stmt = null;
							ResultSet rs = null;
							String sql = "";
							ResultSet pageSet = null;
							int dbCount = 0;
							int absolutePage = 1;
							
							ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();
							try {
								con = getConnection();
								//stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
								stmt = con.createStatement();
								try {
									if(search_content != null) {
										if(search_col.equals("qna_title")) {
											sql = "select count(qna_no) from qna where question_type = 'chatting' and qna_title like '%" + search_content + "%'";
										} else if(search_col.equals("writer")) {
											sql = "select count(qna_no) from qna where question_type = 'chatting' and user_nick like '%" + search_content + "%'";
										} else if(search_col.equals("qna_content")) {
											sql = "select count(qna_no) from qna where question_type = 'chatting' and qna_content like '%" + search_content + "%'";
										} else {
											sql = "select count(qna_no) from qna where question_type = 'chatting'";
										}
									} else {
										sql = "select count(qna_no) from qna where question_type = 'chatting'";
									}
								} catch (Exception e2) {
									e2.printStackTrace();
								}
								pageSet = stmt.executeQuery(sql);
								
								if(pageSet.next()) {
									dbCount = pageSet.getInt(1);
									pageSet.close();
									stmt.close();
								}
								
								if(dbCount % BoardBean.pageSize == 0) {
									BoardBean.pageCount = dbCount / BoardBean.pageSize;
								} else {
									BoardBean.pageCount = dbCount / BoardBean.pageSize + 1;
								}
								
								if(pageNumber != null) {
									BoardBean.pageNum = Integer.parseInt(pageNumber);
									absolutePage = (BoardBean.pageNum - 1) * BoardBean.pageSize + 1;
								}
								
								stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
								try {
									if(search_content != null) {
										if(search_col.equals("qna_title")) {
											sql = "select * from qna where question_type = 'chatting' and qna_title like '%" + search_content + "%' order by qna_no desc";
										} else if(search_col.equals("writer")) {
											sql = "select * from qna where question_type = 'chatting' and user_nick like '%" + search_content + "%' order by qna_no desc";
										} else if(search_col.equals("qna_content")) {
											sql = "select * from qna where question_type = 'chatting' and qna_content like '%" + search_content + "%' order by qna_no desc";
										} else {
											sql = "select * from qna where question_type = 'chatting' order by qna_no desc";
										}
									} else {
										sql = "select * from qna where question_type = 'chatting' order by qna_no desc";
									}
								} catch (Exception e2) {
									e2.printStackTrace();
								}
								rs = stmt.executeQuery(sql);
								// System.out.println(search_col);
								// System.out.println(search_content);
								if(rs.next()) {
									rs.absolute(absolutePage);
									int count = 0;
									while(count < BoardBean.pageSize) {
										BoardBean board = new BoardBean();
										board.setQna_no(rs.getInt(1));
										board.setUser_nick(rs.getString(2));
										board.setQna_title(rs.getString(3));
										board.setQna_content(rs.getString(4));
										board.setDate(rs.getTimestamp(5));
										board.setQna_count(rs.getInt(6));
//										board.setGood(rs.getInt(5));
										board.setQuestion_type(rs.getString(7));
										board.setQna_pwd(rs.getString(8));

										boardList.add(board);
										if(rs.isLast()) {
											break;
										} else {
											rs.next();
										}
										count++;
									}
								}
							} catch (Exception e) {
								e.printStackTrace();
							} finally {
								try {
									if (rs != null)
										rs.close();
									if (stmt != null)
										stmt.close();
									if (con != null)
										con.close();
								} catch (Exception e2) {
									e2.printStackTrace();
								}
							}
							return boardList;
						}
						
						// QNA 내용 리스트(기타)에 뿌리기
						public ArrayList<BoardBean> etcQnaList(String pageNumber, String search_col, String search_content) {
							Connection con = null;
							Statement stmt = null;
							ResultSet rs = null;
							String sql = "";
							ResultSet pageSet = null;
							int dbCount = 0;
							int absolutePage = 1;
							
							ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();
							try {
								con = getConnection();
								//stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
								stmt = con.createStatement();
								try {
									if(search_content != null) {
										if(search_col.equals("qna_title")) {
											sql = "select count(qna_no) from qna where question_type = 'etc' and qna_title like '%" + search_content + "%'";
										} else if(search_col.equals("writer")) {
											sql = "select count(qna_no) from qna where question_type = 'etc' and user_nick like '%" + search_content + "%'";
										} else if(search_col.equals("qna_content")) {
											sql = "select count(qna_no) from qna where question_type = 'etc' and qna_content like '%" + search_content + "%'";
										} else {
											sql = "select count(qna_no) from qna where question_type = 'etc'";
										}
									} else {
										sql = "select count(qna_no) from qna where question_type = 'etc'";
									}
								} catch (Exception e2) {
									e2.printStackTrace();
								}
								pageSet = stmt.executeQuery(sql);
								
								if(pageSet.next()) {
									dbCount = pageSet.getInt(1);
									pageSet.close();
									stmt.close();
								}
								
								if(dbCount % BoardBean.pageSize == 0) {
									BoardBean.pageCount = dbCount / BoardBean.pageSize;
								} else {
									BoardBean.pageCount = dbCount / BoardBean.pageSize + 1;
								}
								
								if(pageNumber != null) {
									BoardBean.pageNum = Integer.parseInt(pageNumber);
									absolutePage = (BoardBean.pageNum - 1) * BoardBean.pageSize + 1;
								}
								
								stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
								try {
									if(search_content != null) {
										if(search_col.equals("qna_title")) {
											sql = "select * from qna where question_type = 'etc' and qna_title like '%" + search_content + "%' order by qna_no desc";
										} else if(search_col.equals("writer")) {
											sql = "select * from qna where question_type = 'etc' and user_nick like '%" + search_content + "%' order by qna_no desc";
										} else if(search_col.equals("qna_content")) {
											sql = "select * from qna where question_type = 'etc' and qna_content like '%" + search_content + "%' order by qna_no desc";
										} else {
											sql = "select * from qna where question_type = 'etc' order by qna_no desc";
										}
									} else {
										sql = "select * from qna where question_type = 'etc' order by qna_no desc";
									}
								} catch (Exception e2) {
									e2.printStackTrace();
								}
								rs = stmt.executeQuery(sql);
								// System.out.println(search_col);
								// System.out.println(search_content);
								if(rs.next()) {
									rs.absolute(absolutePage);
									int count = 0;
									while(count < BoardBean.pageSize) {
										BoardBean board = new BoardBean();
										board.setQna_no(rs.getInt(1));
										board.setUser_nick(rs.getString(2));
										board.setQna_title(rs.getString(3));
										board.setQna_content(rs.getString(4));
										board.setDate(rs.getTimestamp(5));
										board.setQna_count(rs.getInt(6));
//										board.setGood(rs.getInt(5));
										board.setQuestion_type(rs.getString(7));
										board.setQna_pwd(rs.getString(8));

										boardList.add(board);
										if(rs.isLast()) {
											break;
										} else {
											rs.next();
										}
										count++;
									}
								}
							} catch (Exception e) {
								e.printStackTrace();
							} finally {
								try {
									if (rs != null)
										rs.close();
									if (stmt != null)
										stmt.close();
									if (con != null)
										con.close();
								} catch (Exception e2) {
									e2.printStackTrace();
								}
							}
							return boardList;
							
						}
						
			
				// Q&A 게시물 조회수 증가하는 메서드
				public void updateQnaCount(int qna_no) throws SQLException {
					Connection con = null;
					PreparedStatement pstmt = null;
					String sql = "";
					try {
						con = getConnection();
						sql = "update qna set qna_count = qna_count + 1 where qna_no=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, qna_no);
						pstmt.executeUpdate();

					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						try {
							if (pstmt != null)
								pstmt.close();
							if (con != null)
								con.close();
						} catch (Exception e2) {
							e2.printStackTrace();
						}
					}
				}

				// 리스트에서 게시물 클릭하면 해당 내용 화면에 뿌리기
				public BoardBean getQna(int qna_no) {
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = "";
					BoardBean board = null;

					try {
						con = getConnection();
						sql = "select * from qna where qna_no=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, qna_no);
						rs = pstmt.executeQuery();

						if (rs.next()) {
							board = new BoardBean();
							board.setQna_no(rs.getInt(1)); 
							board.setUser_nick(rs.getString(2));
							board.setQna_title(rs.getString(3)); 
							board.setQna_content(rs.getString(4)); 
							board.setDate(rs.getTimestamp(5));
							board.setQna_count(rs.getInt(6)); 
							//board.setGood(rs.getInt(5));
							//board.setBad(rs.getInt(6));
							board.setQuestion_type(rs.getString(7));
							board.setQna_pwd(rs.getString(8)); 
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
						} catch (Exception e2) {
							e2.printStackTrace();
						}
					}
					return board;
				}
				
				//QNA 수정하는 메서드
						public int editQna(BoardBean board) {
							Connection con = null;
							PreparedStatement pstmt = null;
							ResultSet rs = null;
							String sql = "";
							int re = -1;
							String qna_pwd = "";
							
							try {
								con = getConnection();
								sql = "select qna_pwd from qna where qna_no = ?";
								pstmt = con.prepareStatement(sql);
								pstmt.setInt(1, board.getQna_no());
								rs = pstmt.executeQuery();
								System.out.println(rs);
								
								if(rs.next()) {
									qna_pwd = rs.getString(1);
									if(!qna_pwd.equals(board.getQna_pwd())) {
										// 비밀번호가 다를 경우
										re = 0;
									} else {
										sql = "update qna set qna_title = ?, qna_content = ?, question_type = ? where qna_no = ?";
										pstmt = con.prepareStatement(sql);
										pstmt.setString(1, HanConv.toKor(board.getQna_title()));
										pstmt.setString(2, HanConv.toKor(board.getQna_content()));
										pstmt.setString(3, board.getQuestion_type());
										pstmt.setInt(4, board.getQna_no());
										pstmt.executeUpdate();
										re = 1;
									}
								}
							} catch (Exception e) {
								e.printStackTrace();
							} finally {
								try {
									if (rs != null) rs.close();
									if (pstmt != null) pstmt.close();
									if (con != null) con.close();
								} catch (Exception e2) {
									e2.printStackTrace();
								}
							}
							return re;
						}
						
						// QNA 삭제하는 메서드
						public int deleteQna(int qna_no, String pwd) {
							Connection con = null;
							PreparedStatement pstmt = null;
							ResultSet rs = null;
							String sql = "";
							int re = -1;
							String qna_pwd = "";
							
							try {
								con = getConnection();
								sql = "select qna_pwd from qna where qna_no = ?";
								pstmt = con.prepareStatement(sql);
								pstmt.setInt(1, qna_no);
								rs = pstmt.executeQuery();
								
								if (rs.next()) {
									qna_pwd = rs.getString(1);
									
									if (!qna_pwd.equals(pwd)) {
										re = 0;
									} else {
										
										sql = "delete qnacomment where qna_no = ?";
										pstmt = con.prepareStatement(sql);
										pstmt.setInt(1, qna_no);
										pstmt.executeUpdate();
										
										sql = "delete qna where qna_no = ?";
										pstmt = con.prepareStatement(sql);
										pstmt.setInt(1, qna_no);
										pstmt.executeUpdate();
										re = 1;
									}
								}
							} catch (Exception e) {
								e.printStackTrace();
							} finally {
								try {
									if (rs != null) rs.close();
									if (pstmt != null) pstmt.close();
									if (con != null) con.close();
								} catch (Exception e2) {
									e2.printStackTrace();
								}
							}
							return re;
						}
						
						// 댓글 테이블에 넣어주는 메서드
						public int qnaInsertComment(BoardBean board, int qna_no, String nick) {
							Connection con = null;
							PreparedStatement pstmt = null;
							ResultSet rs = null;
							String sql = "";
							int number;
							try {
								con = getConnection();
								
								sql = "select max(qna_c_no) from qnacomment";
								pstmt = con.prepareStatement(sql);
								rs = pstmt.executeQuery();

								if (rs.next()) {
									number = rs.getInt(1) + 1;
								} else {
									number = 1;
								}

								sql = "insert into qnacomment values(?,?,?,?,?)";
								pstmt = con.prepareStatement(sql);

								pstmt.setInt(1, qna_no);
								pstmt.setString(2, nick);
								pstmt.setString(3, HanConv.toKor(board.getQna_c_content()));
								pstmt.setTimestamp(4, board.getQna_c_time());
								pstmt.setInt(5, number);

								pstmt.executeUpdate();

							} catch (Exception e) {
								e.printStackTrace();
							} finally {
								try {
									if (pstmt != null)
										pstmt.close();
									if (con != null)
										con.close();
								} catch (Exception e2) {
									e2.printStackTrace();
								}
							}
							return 1;
						}

						// 댓글리스트로 받아서 화면에 뿌려주는 메서드
						public ArrayList<BoardBean> qnaListCommnet(int qna_no) {
							Connection con = null;
							PreparedStatement pstmt = null;
							ResultSet rs = null;
							String sql = "";
							ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();

							try {
								con = getConnection();
								sql = "select * from qnacomment where qna_no=? order by qna_c_time";
								pstmt = con.prepareStatement(sql);
								pstmt.setInt(1, qna_no);
								rs = pstmt.executeQuery();

								while (rs.next()) {
									BoardBean board = new BoardBean();
									board.setQna_no(rs.getInt(1));
									board.setQna_c_user_nick(rs.getString(2));
									board.setQna_c_content(rs.getString(3));
									board.setQna_c_time(rs.getTimestamp(4));
									board.setQna_c_no(rs.getInt(5));

									boardList.add(board);
								}

							} catch (Exception e) {
								e.printStackTrace();
							} finally {
								try {
									if (rs != null)
										rs.close();
									if (pstmt != null)
										pstmt.close();
									if (con != null)
										con.close();
								} catch (Exception e2) {
									e2.printStackTrace();
								}
							}
							return boardList;
						}
						
						//댓글 삭제하는 메소드
						public int qnaDeleteComment(int qna_c_no) {
							Connection con = null;
							PreparedStatement pstmt = null;
							String sql = "";
							int re = -1;
							
							try {
								con = getConnection();
								sql = "delete qnacomment where qna_c_no = ?";
								pstmt = con.prepareStatement(sql);
								pstmt.setInt(1, qna_c_no);
								pstmt.executeUpdate();
								re = 1;
								
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

							return re;
						}
						
						// 댓글 총 갯수 세는 메서드(리스트에서 답변완료 여부 확인하는 용도)
						public int qnacountcomment(int qna_no) {
							Connection con = null;
							PreparedStatement pstmt = null;
							ResultSet rs = null;
							String sql = "";
							int cnt = 0;

							try {
								con = getConnection();
								sql = "select count(*) from qnacomment where qna_no=?";
								pstmt = con.prepareStatement(sql);
								pstmt.setInt(1, qna_no);
								rs = pstmt.executeQuery();
								
								if(rs != null &&rs.next()) {
									cnt = rs.getInt(1);
								}
								

							} catch (Exception e) {
								e.printStackTrace();
							} finally {
								try {
									if (rs != null)
										rs.close();
									if (pstmt != null)
										pstmt.close();
									if (con != null)
										con.close();
								} catch (Exception e2) {
									e2.printStackTrace();
								}
							}
							return cnt;
						}
}	
