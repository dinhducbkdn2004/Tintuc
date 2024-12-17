package models.bean;

public class Home {
	private int articleId;
	private int position;

	public Home() {
	}

	public Home(int articleId, int position) {
		this.articleId = articleId;
		this.position = position;
	}

	public int getArticleId() {
		return articleId;
	}

	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}

	public int getPosition() {
		return position;
	}

	public void setPosition(int position) {
		this.position = position;
	}
}