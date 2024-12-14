package models.bean;

public class Home {
    private String articleId;
    private int position;

    public Home() {
    }

    public Home(String articleId, int position) {
        this.articleId = articleId;
        this.position = position;
    }

    public String getArticleId() {
        return articleId;
    }

    public void setArticleId(String articleId) {
        this.articleId = articleId;
    }

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }
}