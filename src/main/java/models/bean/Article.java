package models.bean;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Article {
    private String id;
    private String title;
    private String subjectId;
    private String thumbnail;
    private String content;
    private Date createdAt;
    private String introduce;

    public Article() {
    }

    public Article(String id, String title, String subjectId, String thumbnail, String content, Date createdAt,
            String introduce) {
        this.id = id;
        this.title = title;
        this.subjectId = subjectId;
        this.thumbnail = thumbnail;
        this.content = content;
        this.createdAt = createdAt;
        this.introduce = introduce;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(String subjectId) {
        this.subjectId = subjectId;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }
}