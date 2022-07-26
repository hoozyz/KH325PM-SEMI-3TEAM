package vo;

public class RankVO {
	private String show_id;
	private String thea_id;
	private String area;
	private String prfdtcnt;
	private String prfpd;
	private String cate;
	private String prfplcnm;
	private String prfnm;
	private int rnum;
	private int seatcnt;
	private String poster;
	private String date_range;
	private String date;

	public RankVO() {
		super();
	}

	public RankVO(String show_id, String thea_id, String area, String prfdtcnt, String prfpd, String cate,
			String prfplcnm, String prfnm, int rnum, int seatcnt, String poster, String date_range, String date) {
		super();
		this.show_id = show_id;
		this.thea_id = thea_id;
		this.area = area;
		this.prfdtcnt = prfdtcnt;
		this.prfpd = prfpd;
		this.cate = cate;
		this.prfplcnm = prfplcnm;
		this.prfnm = prfnm;
		this.rnum = rnum;
		this.seatcnt = seatcnt;
		this.poster = poster;
		this.date_range = date_range;
		this.date = date;
	}

	@Override
	public String toString() {
		return "RankVO [show_id=" + show_id + ", thea_id=" + thea_id + ", area=" + area + ", prfdtcnt=" + prfdtcnt
				+ ", prfpd=" + prfpd + ", cate=" + cate + ", prfplcnm=" + prfplcnm + ", prfnm=" + prfnm + ", rnum="
				+ rnum + ", seatcnt=" + seatcnt + ", poster=" + poster + ", date_range=" + date_range + ", date=" + date
				+ "]";
	}

	public String getShow_id() {
		return show_id;
	}

	public void setShow_id(String show_id) {
		this.show_id = show_id;
	}

	public String getThea_id() {
		return thea_id;
	}

	public void setThea_id(String thea_id) {
		this.thea_id = thea_id;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getPrfdtcnt() {
		return prfdtcnt;
	}

	public void setPrfdtcnt(String prfdtcnt) {
		this.prfdtcnt = prfdtcnt;
	}

	public String getPrfpd() {
		return prfpd;
	}

	public void setPrfpd(String prfpd) {
		this.prfpd = prfpd;
	}

	public String getCate() {
		return cate;
	}

	public void setCate(String cate) {
		this.cate = cate;
	}

	public String getPrfplcnm() {
		return prfplcnm;
	}

	public void setPrfplcnm(String prfplcnm) {
		this.prfplcnm = prfplcnm;
	}

	public String getPrfnm() {
		return prfnm;
	}

	public void setPrfnm(String prfnm) {
		this.prfnm = prfnm;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getSeatcnt() {
		return seatcnt;
	}

	public void setSeatcnt(int seatcnt) {
		this.seatcnt = seatcnt;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public String getDate_range() {
		return date_range;
	}

	public void setDate_range(String date_range) {
		this.date_range = date_range;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

}
