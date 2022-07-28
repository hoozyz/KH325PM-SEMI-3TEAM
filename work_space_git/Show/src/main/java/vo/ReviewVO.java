package vo;

import java.util.Date;

public class ReviewVO {
	private int rev_no;			// 후기번호
	private String show_id;		// 공연ID
	private String user_id;		// 아이디
	private String content;		// 후기내용
	private String rev_star;	// 별점
	private int like;			// 좋아요
	private Date review_date;	// 후기등록일
	
	public ReviewVO() {
		super();
	}

	public ReviewVO(int rev_no, String show_id, String user_id, String content, String rev_star, int like,
			Date review_date) {
		super();
		this.rev_no = rev_no;
		this.show_id = show_id;
		this.user_id = user_id;
		this.content = content;
		this.rev_star = rev_star;
		this.like = like;
		this.review_date = review_date;
	}

	@Override
	public String toString() {
		return "ReviewVO [rev_no=" + rev_no + ", show_id=" + show_id + ", user_id=" + user_id + ", content=" + content
				+ ", rev_star=" + rev_star + ", like=" + like + ", review_date=" + review_date + "]";
	}

	public int getRev_no() {
		return rev_no;
	}

	public void setRev_no(int rev_no) {
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRev_star() {
		return rev_star;
	}

	public void setRev_star(String rev_star) {
		this.rev_star = rev_star;
	}

	public int getLike() {
		return like;
	}

	public void setLike(int like) {
		this.like = like;
	}

	public Date getReview_date() {
		return review_date;
	}

	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	
}
