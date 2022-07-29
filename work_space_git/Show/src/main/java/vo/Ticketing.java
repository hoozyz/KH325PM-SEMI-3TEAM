package vo;

public class Ticketing {
	private int tic_no;
	private String show_id;
	private String user_id;
	private String prfnm;
	private String ticket_viewdate;
	private String ticket_date;
	private String fcltynm;
	private int count;
	private int price;
	private String view_time;

	public Ticketing() {
		super();
	}

	public Ticketing(int tic_no, String show_id, String user_id, String prfnm, String ticket_viewdate,
			String ticket_date, String fcltynm, int count, int price, String viewTime) {
		super();
		this.tic_no = tic_no;
		this.show_id = show_id;
		this.user_id = user_id;
		this.prfnm = prfnm;
		this.ticket_viewdate = ticket_viewdate;
		this.ticket_date = ticket_date;
		this.fcltynm = fcltynm;
		this.count = count;
		this.price = price;
		this.view_time = view_time;
	}

	@Override
	public String toString() {
		return "Ticketing [tic_no=" + tic_no + ", show_id=" + show_id + ", user_id=" + user_id + ", prfnm=" + prfnm
				+ ", ticket_viewdate=" + ticket_viewdate + ", ticket_date=" + ticket_date + ", fcltynm=" + fcltynm
				+ ", count=" + count + ", price=" + price + ", viewTime=" + view_time + "]";
	}

	public int getTic_no() {
		return tic_no;
	}

	public void setTic_no(int tic_no) {
		this.tic_no = tic_no;
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

	public String getPrfnm() {
		return prfnm;
	}

	public void setPrfnm(String prfnm) {
		this.prfnm = prfnm;
	}

	public String getTicket_viewdate() {
		return ticket_viewdate;
	}

	public void setTicket_viewdate(String ticket_viewdate) {
		this.ticket_viewdate = ticket_viewdate;
	}

	public String getTicket_date() {
		return ticket_date;
	}

	public void setTicket_date(String ticket_date) {
		this.ticket_date = ticket_date;
	}

	public String getFcltynm() {
		return fcltynm;
	}

	public void setFcltynm(String fcltynm) {
		this.fcltynm = fcltynm;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getView_time() {
		return view_time;
	}

	public void setView_time(String view_time) {
		this.view_time = view_time;
	}

}
