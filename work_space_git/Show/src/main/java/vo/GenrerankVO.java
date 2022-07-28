package vo;

public class GenrerankVO {
	private String show_id;            // 공연ID   
	private String thea_id;            // 공연시설ID 
	private String area;               // 지역     
	private String prfdtcnt;           // 상연횟수   
	private String prfpd;              // 공연기간   
	private String cate;               // 장르     
	private String prfplcnm;           // 공연장    
	private String prfnm;              // 공연명    
	private int rnum;                  // 순위     
	private int seatcnt;               // 좌석수    
	private String poster;             // 포스터    
	private String date_range;         // 순위기간   
	private String date;

	public GenrerankVO() {
		super();
	}

	public GenrerankVO(String show_id, String thea_id, String area, String prfdtcnt, String prfpd, String cate,
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
		return "GenrerankVO [show_id=" + show_id + ", thea_id=" + thea_id + ", area=" + area + ", prfdtcnt=" + prfdtcnt
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
