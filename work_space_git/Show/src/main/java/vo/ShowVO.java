package vo;

public class ShowVO {
	private String show_id;			// 공연ID
	private String thea_id;			// 공연시설ID
	private String prfnm;			// 공연명
	private String prfpdfrom;		// 공연시작일
	private String prfpdto;			// 공연종료일
	private String genrenm;			// 공연 장르
	private String fcltynm;			// 공연시설명
	private String poster;			// 포스터
	private String prfcast;			// 출연진
	private String prfruntime;		// 런타임
	private String prfage;			// 연령
	private String entrpsnm;		// 제작사
	private String pcseguidance;	// 가격
	private String dtguidance;		// 공연시간
	private String awards;			// 수상작
	private String show_star;		// 별점

	public ShowVO() {
		super();
	}

	public ShowVO(String show_id, String thea_id, String prfnm, String prfpdfrom, String prfpdto, String genrenm,
			String fcltynm, String poster, String prfcast, String prfruntime, String prfage, String entrpsnm,
			String pcseguidance, String dtguidance, String awards, String show_star) {
		super();
		this.show_id = show_id;
		this.thea_id = thea_id;
		this.prfnm = prfnm;
		this.prfpdfrom = prfpdfrom;
		this.prfpdto = prfpdto;
		this.genrenm = genrenm;
		this.fcltynm = fcltynm;
		this.poster = poster;
		this.prfcast = prfcast;
		this.prfruntime = prfruntime;
		this.prfage = prfage;
		this.entrpsnm = entrpsnm;
		this.pcseguidance = pcseguidance;
		this.dtguidance = dtguidance;
		this.awards = awards;
		this.show_star = show_star;
	}

	@Override
	public String toString() {
		return "ShowVO [show_id=" + show_id + ", thea_id=" + thea_id + ", prfnm=" + prfnm + ", prfpdfrom=" + prfpdfrom
				+ ", prfpdto=" + prfpdto + ", genrenm=" + genrenm + ", fcltynm=" + fcltynm + ", poster=" + poster
				+ ", prfcast=" + prfcast + ", prfruntime=" + prfruntime + ", prfage=" + prfage + ", entrpsnm="
				+ entrpsnm + ", pcseguidance=" + pcseguidance + ", dtguidance=" + dtguidance + ", awards=" + awards
				+ ", show_star=" + show_star + "]";
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

	public String getGenrenm() {
		return genrenm;
	}

	public void setGenrenm(String genrenm) {
		this.genrenm = genrenm;
	}

	public String getFcltynm() {
		return fcltynm;
	}

	public void setFcltynm(String fcltynm) {
		this.fcltynm = fcltynm;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public String getPrfcast() {
		return prfcast;
	}

	public void setPrfcast(String prfcast) {
		this.prfcast = prfcast;
	}

	public String getPrfruntime() {
		return prfruntime;
	}

	public void setPrfruntime(String prfruntime) {
		this.prfruntime = prfruntime;
	}

	public String getPrfage() {
		return prfage;
	}

	public void setPrfage(String prfage) {
		this.prfage = prfage;
	}

	public String getEntrpsnm() {
		return entrpsnm;
	}

	public void setEntrpsnm(String entrpsnm) {
		this.entrpsnm = entrpsnm;
	}

	public String getPcseguidance() {
		return pcseguidance;
	}

	public void setPcseguidance(String pcseguidance) {
		this.pcseguidance = pcseguidance;
	}

	public String getDtguidance() {
		return dtguidance;
	}

	public void setDtguidance(String dtguidance) {
		this.dtguidance = dtguidance;
	}

	public String getAwards() {
		return awards;
	}

	public void setAwards(String awards) {
		this.awards = awards;
	}

	public String getShow_star() {
		return show_star;
	}

	public void setShow_star(String show_star) {
		this.show_star = show_star;
	}

}
