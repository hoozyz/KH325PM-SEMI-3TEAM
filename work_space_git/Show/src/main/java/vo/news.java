package vo;

public class news {
	private int news_num;
	private String title;
	private String cont;
	private String date;
	private String poster;

	public news() {
		super();
	}

	public news(int news_num, String title, String cont, String date, String poster) {
		super();
		this.news_num = news_num;
		this.title = title;
		this.cont = cont;
		this.date = date;
		this.poster = poster;
	}

	@Override
	public String toString() {
		return "news [news_num=" + news_num + ", title=" + title + ", cont=" + cont + ", date=" + date + ", poster="
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
