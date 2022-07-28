package vo;

import java.util.Date;

public class BoardVO {
	private int board_no;			// 게시글 번호
	private String user_id;			// 아이디
	private String title;			// 제목
	private String cont;			// 내용
	private int readcount;			// 조회수
	private Date create_date;		// 등록일
	private Date modify_date;		// 수정일
	
	public BoardVO() {
		super();
	}

	public BoardVO(int board_no, String user_id, String title, String cont, int readcount, Date create_date,
			Date modify_date) {
		super();
		this.board_no = board_no;
		this.user_id = user_id;
		this.title = title;
		this.cont = cont;
		this.readcount = readcount;
		this.create_date = create_date;
		this.modify_date = modify_date;
	}

	@Override
	public String toString() {
		return "BoardVO [board_no=" + board_no + ", user_id=" + user_id + ", title=" + title + ", cont=" + cont
				+ ", readcount=" + readcount + ", create_date=" + create_date + ", modify_date=" + modify_date + "]";
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCont() {
		return cont;
	}

	public void setCont(String cont) {
		this.cont = cont;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	public Date getModify_date() {
		return modify_date;
	}

	public void setModify_date(Date modify_date) {
		this.modify_date = modify_date;
	}
	
}
