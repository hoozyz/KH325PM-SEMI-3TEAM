package vo;

import java.util.Date;

public class LikeVO {
	private int like_no;		// 찜번호
	private String user_id;		// 아이디
	private String show_id;		// 공연ID
	private String prfnm;		// 공연명
	private Date like_date;		// 찜날짜
	
	public LikeVO() {
		super();
	}

	public LikeVO(int like_no, String user_id, String show_id, String prfnm, Date like_date) {
		super();
		this.like_no = like_no;
		this.user_id = user_id;
		this.show_id = show_id;
		this.prfnm = prfnm;
		this.like_date = like_date;
	}

	@Override
	public String toString() {
		return "LikeVO [like_no=" + like_no + ", user_id=" + user_id + ", show_id=" + show_id + ", prfnm=" + prfnm
				+ ", like_date=" + like_date + "]";
	}

	public int getLike_no() {
		return like_no;
	}

	public void setLike_no(int like_no) {
		this.like_no = like_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getShow_id() {
		return show_id;
	}

	public void setShow_id(String show_id) {
		this.show_id = show_id;
	}

	public String getPrfnm() {
		return prfnm;
	}

	public void setPrfnm(String prfnm) {
		this.prfnm = prfnm;
	}

	public Date getLike_date() {
		return like_date;
	}

	public void setLike_date(Date like_date) {
		this.like_date = like_date;
	}
	
}
