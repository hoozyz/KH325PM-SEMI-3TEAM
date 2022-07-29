package vo;

public class Review {
	private String rev_no;
	private String show_id;
	private String user_id;
	private String rev_content;
	private String prfnm;
	private String prfpdfrom;
	private String prfpdto;
	private String rev_star;
	private int rev_like;
	private String rev_date;

	public Review() {
		super();
	}

	public Review(String rev_no, String show_id, String user_id, String rev_content, String prfnm, String prfpdfrom,
			String prfpdto, String rev_star, int rev_like, String rev_date) {
		super();
		this.rev_no = rev_no;
		this.show_id = show_id;
		this.user_id = user_id;
		this.rev_content = rev_content;
		this.prfnm = prfnm;
		this.prfpdfrom = prfpdfrom;
		this.prfpdto = prfpdto;
		this.rev_star = rev_star;
		this.rev_like = rev_like;
		this.rev_date = rev_date;
	}

	@Override
	public String toString() {
		return "Review [rev_no=" + rev_no + ", show_id=" + show_id + ", user_id=" + user_id + ", rev_content="
				+ rev_content + ", prfnm=" + prfnm + ", prfpdfrom=" + prfpdfrom + ", prfpdto=" + prfpdto + ", rev_star="
				+ rev_star + ", rev_like=" + rev_like + ", rev_date=" + rev_date + "]";
	}

	public String getRev_no() {
		return rev_no;
	}

	public void setRev_no(String rev_no) {
		this.rev_no = rev_no;
	}

	public String getShow_id() {
		return show_id;
	}

	public void setShow_id(String show_id) {
		this.show_id = show_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getRev_content() {
		return rev_content;
	}

	public void setRev_content(String rev_content) {
		this.rev_content = rev_content;
	}

	public String getPrfnm() {
		return prfnm;
	}

	public void setPrfnm(String prfnm) {
		this.prfnm = prfnm;
	}

	public String getPrfpdfrom() {
		return prfpdfrom;
	}

	public void setPrfpdfrom(String prfpdfrom) {
		this.prfpdfrom = prfpdfrom;
	}

	public String getPrfpdto() {
		return prfpdto;
	}

	public void setPrfpdto(String prfpdto) {
		this.prfpdto = prfpdto;
	}

	public String getRev_star() {
		return rev_star;
	}

	public void setRev_star(String rev_star) {
		this.rev_star = rev_star;
	}

	public int getRev_like() {
		return rev_like;
	}

	public void setRev_like(int rev_like) {
		this.rev_like = rev_like;
	}

	public String getRev_date() {
		return rev_date;
	}

	public void setRev_date(String rev_date) {
		this.rev_date = rev_date;
	}

}
