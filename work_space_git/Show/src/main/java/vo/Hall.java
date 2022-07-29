package vo;

public class Hall {
	private String hall_id;
	private String fcltynm;
	private int seatscale;
	private String telno;
	private String relateurl;
	private String adres;
	private String la;
	private String lo;

	public Hall() {
		super();
	}

	public Hall(String hall_id, String fcltynm, int seatscale, String telno, String relateurl, String adres,
			String la, String lo) {
		super();
		this.hall_id = hall_id;
		this.fcltynm = fcltynm;
		this.seatscale = seatscale;
		this.telno = telno;
		this.relateurl = relateurl;
		this.adres = adres;
		this.la = la;
		this.lo = lo;
	}

	@Override
	public String toString() {
		return "HallVO [hall_id=" + hall_id + ", fcltynm=" + fcltynm + ", seatscale=" + seatscale + ", telno=" + telno
				+ ", relateurl=" + relateurl + ", adres=" + adres + ", la=" + la + ", lo=" + lo + "]";
	}

	public String getHall_id() {
		return hall_id;
	}

	public void setHall_id(String hall_id) {
		this.hall_id = hall_id;
	}

	public String getFcltynm() {
		return fcltynm;
	}

	public void setFcltynm(String fcltynm) {
		this.fcltynm = fcltynm;
	}

	public int getSeatscale() {
		return seatscale;
	}

	public void setSeatscale(int seatscale) {
		this.seatscale = seatscale;
	}

	public String getTelno() {
		return telno;
	}

	public void setTelno(String telno) {
		this.telno = telno;
	}

	public String getRelateurl() {
		return relateurl;
	}

	public void setRelateurl(String relateurl) {
		this.relateurl = relateurl;
	}

	public String getAdres() {
		return adres;
	}

	public void setAdres(String adres) {
		this.adres = adres;
	}

	public String getLa() {
		return la;
	}

	public void setLa(String la) {
		this.la = la;
	}

	public String getLo() {
		return lo;
	}

	public void setLo(String lo) {
		this.lo = lo;
	}

}
