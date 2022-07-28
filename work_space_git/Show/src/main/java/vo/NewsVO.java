package vo;

public class NewsVO {
	private int news_num;		// 번호
	private String title;		// 제목
	private String cont;		// 작성내용
	private String date;		// 등록일
	private String poster;		// 포스터
	
	public NewsVO() {
		super();
	}

	public NewsVO(int news_num, String title, String cont, String date, String poster) {
		super();
		this.news_num = news_num;
		this.title = title;
		this.cont = cont;
		this.date = date;
		this.poster = poster;
	}

	@Override
	public String toString() {
		return "NewsVO [news_num=" + news_num + ", title=" + title + ", cont=" + cont + ", date=" + date + ", poster="
				+ poster + "]";
	}

	public int getNews_num() {
		return news_num;
	}

	public void setNews_num(int news_num) {
		this.news_num = news_num;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}
	
}
