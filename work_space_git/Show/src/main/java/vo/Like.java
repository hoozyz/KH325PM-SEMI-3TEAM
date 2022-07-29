package vo;

public class Like {
	private int like_no;
	private String user_id;
	private String show_id;
	private String prfnm;
	private String poster;
	private String fcltynm;
	private String like_date;

	public Like() {
		super();
	}

	public Like(int like_no, String user_id, String show_id, String prfnm, String poster, String fcltynm,
			String like_date) {
		super();
		this.like_no = like_no;
		this.user_id = user_id;
		this.show_id = show_id;
		this.prfnm = prfnm;
		this.poster = poster;
		this.fcltynm = fcltynm;
		this.like_date = like_date;
	}

	@Override
	public String toString() {
		return "Like [like_no=" + like_no + ", user_id=" + user_id + ", show_id=" + show_id + ", prfnm=" + prfnm
				+ ", poster=" + poster + ", fcltynm=" + fcltynm + ", like_date=" + like_date + "]";
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

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public String getFcltynm() {
		return fcltynm;
	}

	public void setFcltynm(String fcltynm) {
		this.fcltynm = fcltynm;
	}

	public String getLike_date() {
		return like_date;
	}

	public void setLike_date(String like_date) {
		this.like_date = like_date;
	}

}
