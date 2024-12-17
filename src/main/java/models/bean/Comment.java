package models.bean;

import java.util.Date;

public class Comment {
	private int commentID;
	private String content;
	private int articleId;
	private String creatorId;
	private String creator;
	private Date createdAt;

	public Comment() {
	}

	public Comment(int commentID, String content, int articleId, String creatorId, Date createdAt) {
		this.commentID = commentID;
		this.content = content;
		this.articleId = articleId;
		this.creatorId = creatorId;
		this.createdAt = createdAt;
	}

	public int getCommentID() {
		return commentID;
	}

	public void setCommentID(int commentID) {
		this.commentID = commentID;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getArticleId() {
		return articleId;
	}

	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}

	public String getCreatorId() {
		return creatorId;
	}

	public void setCreatorId(String creatorId) {
		this.creatorId = creatorId;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public String getCreator() {
		return creator;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
}