package team.abc.ssm.modules.sys.entity;

import team.abc.ssm.common.persistence.DataEntity;

public class NoticePublish extends DataEntity<NoticePublish> {
    private String title;
    private String publisherId;
    private String publishDate;
    private String content;
    private int status; // 状态: 0-草稿，1-发布

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPublisherId() {
        return publisherId;
    }

    public void setPublisherId(String publisherId) {
        this.publisherId = publisherId;
    }

    public String getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(String publishDate) {
        this.publishDate = publishDate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
