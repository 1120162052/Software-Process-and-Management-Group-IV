package team.abc.ssm.modules.notice.entity;

import team.abc.ssm.common.persistence.DataEntity;
import team.abc.ssm.modules.sys.entity.User;

import java.util.Date;

public class NoticeReceive extends DataEntity<NoticeReceive> {

    private String receiverId;
    private String noticeId;
    private String status; // 0 - 未读，1 - 已读

    private String title;
    private String content;
    private Date publishDate;
    private User publisher;

    public String getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(String receiverId) {
        this.receiverId = receiverId;
    }

    public String getNoticeId() {
        return noticeId;
    }

    public void setNoticeId(String noticeId) {
        this.noticeId = noticeId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public User getPublisher() {
        return publisher;
    }

    public void setPublisher(User publisher) {
        this.publisher = publisher;
    }
}
