package vo;

public class Board {
	private int board_no;
	private String user_id;
	private String name;
	private String title;
	private String cont;
	private int readcount;
	private String create_date;
	private String modify_date;

	public Board() {
		super();
	}

	public Board(int board_no, String user_id, String name, String title, String cont, int readcount,
			String create_date, String modify_date) {
		super();
		this.board_no = board_no;
		this.user_id = user_id;
		this.name = name;
		this.title = title;
		this.cont = cont;
		this.readcount = readcount;
		this.create_date = create_date;
		this.modify_date = modify_date;
	}

	@Override
	public String toString() {
		return "Board [board_no=" + board_no + ", user_id=" + user_id + ", name=" + name + ", title=" + title
				+ ", cont=" + cont + ", readcount=" + readcount + ", create_date=" + create_date + ", modify_date="
				+ modify_date + "]";
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getCreate_date() {
		return create_date;
	}

	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}

	public String getModify_date() {
		return modify_date;
	}

	public void setModify_date(String modify_date) {
		this.modify_date = modify_date;
	}
}
