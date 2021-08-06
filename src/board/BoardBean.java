package board;
import java.sql.Timestamp;
public class BoardBean {
	private int b_no;  //게시글 번호
	private String user_nick; //유저명
	private Timestamp date; //작성날짜
	private int count; //조회수
	private int good; //추천수
	private int bad;  //비추천수
	private String title; // 제목
	private String content; // 내용
	private String board_type; // 게시판타입
	private String c_content;
	private Timestamp c_time;
	private String pwd;
	private String c_user_nick; // 댓글 작성자 닉네임
	private int c_no;//댓글작성순서 번호
	
	//페이징 처리를 위한 변수
	public static int pageSize = 20;
	public static int pageCount = 100;
	public static int pageNum = 1;
	//마이페이지 페이징
	public static int mem_pageSize = 8;
	//공지사항 부분 변수
	private int n_no;
	private String n_title;
	private String n_content;
	private String notice_type;
	private int n_count;
	private String n_pwd;
	//채팅 변수
	private String p_content;
	private Timestamp reg_date;
	private String mbti;
	
	//Q&A 부분 변수
	private int qna_no;
	private String qna_title;
	private String qna_content;
	private String question_type;
	private int qna_count;
	private String qna_pwd;
	private String qna_c_content;
	private Timestamp qna_c_time;
	private String qna_c_user_nick; // 댓글 작성자 닉네임
	private int qna_c_no;//댓글작성순서 번호

	public int getQna_no() {
			return qna_no;
		}
		public void setQna_no(int qna_no) {
			this.qna_no = qna_no;
		}
		public String getQna_title() {
			return qna_title;
		}
		public void setQna_title(String qna_title) {
			this.qna_title = qna_title;
		}
		public String getQna_content() {
			return qna_content;
		}
		public void setQna_content(String qna_content) {
			this.qna_content = qna_content;
		}
		public String getQuestion_type() {
			return question_type;
		}
		public void setQuestion_type(String question_type) {
			this.question_type = question_type;
		}
		public int getQna_count() {
			return qna_count;
		}
		public void setQna_count(int qna_count) {
			this.qna_count = qna_count;
		}
		public String getQna_pwd() {
			return qna_pwd;
		}
		public void setQna_pwd(String qna_pwd) {
			this.qna_pwd = qna_pwd;
		}
		public String getQna_c_content() {
			return qna_c_content;
		}
		public void setQna_c_content(String qna_c_content) {
			this.qna_c_content = qna_c_content;
		}
		public Timestamp getQna_c_time() {
			return qna_c_time;
		}
		public void setQna_c_time(Timestamp qna_c_time) {
			this.qna_c_time = qna_c_time;
		}
		public String getQna_c_user_nick() {
			return qna_c_user_nick;
		}
		public void setQna_c_user_nick(String qna_c_user_nick) {
			this.qna_c_user_nick = qna_c_user_nick;
		}
		public int getQna_c_no() {
			return qna_c_no;
		}
		public void setQna_c_no(int qna_c_no) {
			this.qna_c_no = qna_c_no;
		}
		//qna(기타 qna 페이지) 페이징
		public static String etc_qna_pageNumber(int limit, String col, String content) {
			String str = "";
			int temp = (pageNum - 1) % limit;
			int startPage = pageNum - temp;
			if(startPage - limit > 0) {
				str = "<a href='etc_qna.jsp?pageNum=" + (startPage - 1) + "&search_col="+ col +"&search_content="+ content +"' class='prev'>이전</a>&nbsp;&nbsp;";
			}
			for(int i = startPage; i < (startPage + limit); i++) {
				if(i == pageNum) {
					str += "<a href='etc_qna.jsp?pageNum=" + i + "&search_col="+ col +"&search_content="+ content +"' class='onPage'>" + i + "</a>&nbsp;&nbsp;";
				} else {
					str += "<a href='etc_qna.jsp?pageNum=" + i + "&search_col="+ col +"&search_content="+ content +"' class='not_onPage'>" + i + "</a>&nbsp;&nbsp;";
				}
				 
				if(i >= pageCount) {
					break;
				}
			}
			
			if((startPage + limit) <= pageCount) {
				str += "<a href='etc_qna.jsp?pageNum=" + (startPage + limit) + "&search_col="+ col +"&search_content="+ content +"' class='next'>다음</a>";
			}
			
			return str;
		}
		//qna(채팅관련 qna 페이지) 페이징
				public static String chatting_qna_pageNumber(int limit, String col, String content) {
					String str = "";
					int temp = (pageNum - 1) % limit;
					int startPage = pageNum - temp;
					if(startPage - limit > 0) {
						str = "<a href='chatting_qna.jsp?pageNum=" + (startPage - 1) + "&search_col="+ col +"&search_content="+ content +"' class='prev'>이전</a>&nbsp;&nbsp;";
					}
					for(int i = startPage; i < (startPage + limit); i++) {
						if(i == pageNum) {
							str += "<a href='chatting_qna.jsp?pageNum=" + i + "&search_col="+ col +"&search_content="+ content +"' class='onPage'>" + i + "</a>&nbsp;&nbsp;";
						} else {
							str += "<a href='chatting_qna.jsp?pageNum=" + i + "&search_col="+ col +"&search_content="+ content +"' class='not_onPage'>" + i + "</a>&nbsp;&nbsp;";
						}
						 
						if(i >= pageCount) {
							break;
						}
					}
					
					if((startPage + limit) <= pageCount) {
						str += "<a href='chatting_qna.jsp?pageNum=" + (startPage + limit) + "&search_col="+ col +"&search_content="+ content +"' class='next'>다음</a>";
					}
					
					return str;
				}
		//qna(게시판관련 qna 페이지) 페이징
			public static String board_qna_pageNumber(int limit, String col, String content) {
				String str = "";
				int temp = (pageNum - 1) % limit;
				int startPage = pageNum - temp;
				if(startPage - limit > 0) {
					str = "<a href='board_qna.jsp?pageNum=" + (startPage - 1) + "&search_col="+ col +"&search_content="+ content +"' class='prev'>이전</a>&nbsp;&nbsp;";
				}
				for(int i = startPage; i < (startPage + limit); i++) {
					if(i == pageNum) {
						str += "<a href='board_qna.jsp?pageNum=" + i + "&search_col="+ col +"&search_content="+ content +"' class='onPage'>" + i + "</a>&nbsp;&nbsp;";
					} else {
						str += "<a href='board_qna.jsp?pageNum=" + i + "&search_col="+ col +"&search_content="+ content +"' class='not_onPage'>" + i + "</a>&nbsp;&nbsp;";
					}
					 
					if(i >= pageCount) {
						break;
					}
				}
				
				if((startPage + limit) <= pageCount) {
					str += "<a href='board_qna.jsp?pageNum=" + (startPage + limit) + "&search_col="+ col +"&search_content="+ content +"' class='next'>다음</a>";
				}
				
				return str;
			}
	//내가 작성한 댓글 페이징
	public static String member_com_pageNumber(int limit) {
		String str = "";
		int temp = (pageNum - 1) % limit;
		int startPage = pageNum - temp; // pageNum - (pageNum - 1) % limit
		
		if((startPage - limit) > 0) {
			str = "<a href='member_viewcomment.jsp?pageNum="+(startPage-1)+"'>[이전]</a>&nbsp;&nbsp;";
		}
		
		for (int i = startPage; i < (startPage+limit); i++) {
			if (i == pageNum) {
				str += "["+i+"]&nbsp;&nbsp;";
			} else {
				str += "<a href='member_viewcomment.jsp?pageNum="+i+"'>["+ i + "]</a>&nbsp;&nbsp;";
			}
			
			if (i >= pageCount) {
				break;
			}
		}
		
		if ((startPage + limit) <= pageCount) {
			str += "<a href='member_viewcomment.jsp?pageNum="+(startPage+limit)+"'>[다음]</a>";
		}
		
		return str;
	}
	//내가 작성한 글 페이징
	public static String member_pageNumber(int limit) {
    	String str = "";
    	int temp = (pageNum - 1) % limit;
    	int startPage = pageNum - temp; // pageNum - (pageNum - 1) % limit
    	
    	if((startPage - limit) > 0) {
    		str = "<a href='member_viewboard.jsp?pageNum="+(startPage-1)+"'>[이전]</a>&nbsp;&nbsp;";
    	}
    	
    	for (int i = startPage; i < (startPage+limit); i++) {
			if (i == pageNum) {
				str += "["+i+"]&nbsp;&nbsp;";
			} else {
				str += "<a href='member_viewboard.jsp?pageNum="+i+"'>["+ i + "]</a>&nbsp;&nbsp;";
			}
			
			if (i >= pageCount) {
				break;
			}
		}
    	
    	if ((startPage + limit) <= pageCount) {
			str += "<a href='member_viewboard.jsp?pageNum="+(startPage+limit)+"'>[다음]</a>";
		}
    	
    	return str;
    }
	

	//공지사항(채팅공지 페이지) 페이징
	public static String chatting_notice_pageNumber(int limit, String col, String content) {
		String str = "";
		int temp = (pageNum - 1) % limit;
		int startPage = pageNum - temp;
		if(startPage - limit > 0) {
			str = "<a href='chatting_notice.jsp?pageNum=" + (startPage - 1) + "&search_col="+ col +"&search_content="+ content +"' class='prev'>이전</a>&nbsp;&nbsp;";
		}
		for(int i = startPage; i < (startPage + limit); i++) {
			if(i == pageNum) {
				str += "<a href='chatting_notice.jsp?pageNum=" + i + "&search_col="+ col +"&search_content="+ content +"' class='onPage'>" + i + "</a>&nbsp;&nbsp;";
			} else {
				str += "<a href='chatting_notice.jsp?pageNum=" + i + "&search_col="+ col +"&search_content="+ content +"' class='not_onPage'>" + i + "</a>&nbsp;&nbsp;";
			}
			 
			if(i >= pageCount) {
				break;
			}
		}
		
		if((startPage + limit) <= pageCount) {
			str += "<a href='free_board.jsp?pageNum=" + (startPage + limit) + "&search_col="+ col +"&search_content="+ content +"' class='next'>다음</a>";
		}
			
		return str;
	}
	
	//공지사항(게시판공지 페이지) 페이징
	public static String board_notice_pageNumber(int limit, String col, String content) {
		String str = "";
		int temp = (pageNum - 1) % limit;
		int startPage = pageNum - temp;
		if(startPage - limit > 0) {
			str = "<a href='board_notice.jsp?pageNum=" + (startPage - 1) + "&search_col="+ col +"&search_content="+ content +"' class='prev'>이전</a>&nbsp;&nbsp;";
		}
		for(int i = startPage; i < (startPage + limit); i++) {
			if(i == pageNum) {
				str += "<a href='board_notice.jsp?pageNum=" + i + "&search_col="+ col +"&search_content="+ content +"' class='onPage'>" + i + "</a>&nbsp;&nbsp;";
			} else {
				str += "<a href='board_notice.jsp?pageNum=" + i + "&search_col="+ col +"&search_content="+ content +"' class='not_onPage'>" + i + "</a>&nbsp;&nbsp;";
			}
			 
			if(i >= pageCount) {
				break;
			}
		}
		
		if((startPage + limit) <= pageCount) {
			str += "<a href='free_board.jsp?pageNum=" + (startPage + limit) + "&search_col="+ col +"&search_content="+ content +"' class='next'>다음</a>";
		}
		
		return str;
	}
	// 자유게시판 페이징
	public static String free_pageNumber(int limit, String col, String content) {
		String str = "";
		int temp = (pageNum - 1) % limit;
		int startPage = pageNum - temp;
		if(startPage - limit > 0) {
			str = "<a href='free_board.jsp?pageNum=" + (startPage - 1) + "&search_col="+ col +"&search_content="+ content +"' class='prev'>이전</a>&nbsp;&nbsp;";
		}
		for(int i = startPage; i < (startPage + limit); i++) {
			if(i == pageNum) {
				str += "<a href='free_board.jsp?pageNum=" + i + "&search_col="+ col +"&search_content="+ content +"' class='onPage'>" + i + "</a>&nbsp;&nbsp;";
			} else {
				str += "<a href='free_board.jsp?pageNum=" + i + "&search_col="+ col +"&search_content="+ content +"' class='not_onPage'>" + i + "</a>&nbsp;&nbsp;";
			}
			 
			if(i >= pageCount) {
				break;
			}
		}
		
		if((startPage + limit) <= pageCount) {
			str += "<a href='free_board.jsp?pageNum=" + (startPage + limit) + "&search_col="+ col +"&search_content="+ content +"' class='next'>다음</a>";
		}
		
		return str;
	}
	// 분석형 게시판 페이징
	public static String anal_pageNumber(int limit, String col, String content) {
		String str = "";
		int temp = (pageNum - 1) % limit;
		int startPage = pageNum - temp;
		
		if(startPage - limit > 0) {
			str = "<a href='anal_board.jsp?pageNum=" + (startPage - 1) + "&search_col="+ col +"&search_content="+ content +"' class='prev'>이전</a>&nbsp;&nbsp;";
		}
		
		for(int i = startPage; i < (startPage + limit); i++) {
			if(i == pageNum) {
				str += "<a href='anal_board.jsp?pageNum=" + i + "&search_col="+ col +"&search_content="+ content +"' class='onPage'>" + i + "</a>&nbsp;&nbsp;";
			} else {
				str += "<a href='anal_board.jsp?pageNum=" + i + "&search_col="+ col +"&search_content="+ content +"' class='not_onPage'>" + i + "</a>&nbsp;&nbsp;";
			}
			 
			if(i >= pageCount) {
				break;
			}
		}
		
		if((startPage + limit) <= pageCount) {
			str += "<a href='anal_board.jsp?pageNum=" + (startPage + limit) + "&search_col="+ col +"&search_content="+ content +"' class='next'>다음</a>";
		}
		
		return str;
	}
	// 외교형 게시판 페이징
	public static String dipl_pageNumber(int limit, String col, String content) {
		String str = "";
		int temp = (pageNum - 1) % limit;
		int startPage = pageNum - temp;
		
		if(startPage - limit > 0) {
			str = "<a href='dipl_board.jsp?pageNum=" + (startPage - 1) + "&search_col="+ col +"&search_content="+ content +"' class='prev'>이전</a>&nbsp;&nbsp;";
		}
		
		for(int i = startPage; i < (startPage + limit); i++) {
			if(i == pageNum) {
				str += "<a href='dipl_board.jsp?pageNum=" + i + "&search_col="+ col +"&search_content="+ content +"' class='onPage'>" + i + "</a>&nbsp;&nbsp;";
			} else {
				str += "<a href='dipl_board.jsp?pageNum=" + i + "&search_col="+ col +"&search_content="+ content +"' class='not_onPage'>" + i + "</a>&nbsp;&nbsp;";
			}
			 
			if(i >= pageCount) {
				break;
			}
		}
		
		if((startPage + limit) <= pageCount) {
			str += "<a href='dipl_board.jsp?pageNum=" + (startPage + limit) + "&search_col="+ col +"&search_content="+ content +"' class='next'>다음</a>";
		}
		
		return str;
	}
	// 관리자형 게시판 페이징
	public static String admin_pageNumber(int limit, String col, String content) {
		String str = "";
		int temp = (pageNum - 1) % limit;
		int startPage = pageNum - temp;
		
		if(startPage - limit > 0) {
			str = "<a href='admin_board.jsp?pageNum=" + (startPage - 1) + "&search_col="+ col +"&search_content="+ content +"' class='prev'>이전</a>&nbsp;&nbsp;";
		}
		
		for(int i = startPage; i < (startPage + limit); i++) {
			if(i == pageNum) {
				str += "<a href='admin_board.jsp?pageNum=" + i + "&search_col="+ col +"&search_content="+ content +"' class='onPage'>" + i + "</a>&nbsp;&nbsp;";
			} else {
				str += "<a href='admin_board.jsp?pageNum=" + i + "&search_col="+ col +"&search_content="+ content +"' class='not_onPage'>" + i + "</a>&nbsp;&nbsp;";
			}
			 
			if(i >= pageCount) {
				break;
			}
		}
		
		if((startPage + limit) <= pageCount) {
			str += "<a href='admin_board.jsp?pageNum=" + (startPage + limit) + "&search_col="+ col +"&search_content="+ content +"' class='next'>다음</a>";
		}
		
		return str;
	}
	// 탐험가형 게시판 페이징
	public static String exp_pageNumber(int limit, String col, String content) {
		String str = "";
		int temp = (pageNum - 1) % limit;
		int startPage = pageNum - temp;
		if(startPage - limit > 0) {
			str = "<a href='exp_board.jsp?pageNum=" + (startPage - 1) + "&search_col="+ col +"&search_content="+ content +"' class='prev'>이전</a>&nbsp;&nbsp;";
		}
		for(int i = startPage; i < (startPage + limit); i++) {
			if(i == pageNum) {
				str += "<a href='exp_board.jsp?pageNum=" + i + "&search_col="+ col +"&search_content="+ content +"' class='onPage'>" + i + "</a>&nbsp;&nbsp;";
			} else {
				str += "<a href='exp_board.jsp?pageNum=" + i + "&search_col="+ col +"&search_content="+ content +"' class='not_onPage'>" + i + "</a>&nbsp;&nbsp;";
			}
			 
			if(i >= pageCount) {
				break;
			}
		}
		
		if((startPage + limit) <= pageCount) {
			str += "<a href='exp_board.jsp?pageNum=" + (startPage + limit) + "&search_col="+ col +"&search_content="+ content +"' class='next'>다음</a>";
		}
		
		return str;
	}
	
	public String getMbti() {
		return mbti;
	}
	
	public void setMbti(String mbti) {
		this.mbti = mbti;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getN_no() {
		return n_no;
	}
	public void setN_no(int n_no) {
		this.n_no = n_no;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public String getNotice_type() {
		return notice_type;
	}
	public void setNotice_type(String notice_type) {
		this.notice_type = notice_type;
	}
	public int getN_count() {
		return n_count;
	}
	public void setN_count(int n_count) {
		this.n_count = n_count;
	}
	public String getN_pwd() {
		return n_pwd;
	}
	public void setN_pwd(String n_pwd) {
		this.n_pwd = n_pwd;
	}
	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public String getC_user_nick() {
		return c_user_nick;
	}

	public void setC_user_nick(String c_user_nick) {
		this.c_user_nick = c_user_nick;
	}

	public String getPwd() {
		return pwd;
	}
	
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public String getC_content() {
		return c_content;
	}
	
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	
	public Timestamp getC_time() {
		return c_time;
	}
	
	public void setC_time(Timestamp c_time) {
		this.c_time = c_time;
	}
	
	public String getUser_nick() {
		return user_nick;
	}
	
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getBad() {
		return bad;
	}
	public void setBad(int bad) {
		this.bad = bad;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getBoard_type() {
		return board_type;
	}
	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}
}
