package models.bean;

import java.util.Date;

public class Comment {
    private String commentID;
    private String content;
    private String articleId;
    private String creatorId;
    private Date createdAt;

    public Comment() {
    }

    public Comment(String commentID, String content, String articleId, String creatorId, Date createdAt) {
        this.commentID = commentID;
        this.content = content;
        this.articleId = articleId;
        this.creatorId = creatorId;
        this.createdAt = createdAt;
    }

    public String getCommentID() {
        return commentID;
    }

    public void setCommentID(String commentID) {
        this.commentID = commentID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getArticleId() {
        return articleId;
    }

    public void setArticleId(String articleId) {
        this.articleId = articleId;
    }

    public String getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(String creatorId) {
        this.creatorId = creatorId;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
}