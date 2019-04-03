package team.abc.ssm.modules.notice.entity;

import team.abc.ssm.common.persistence.DataEntity;
import team.abc.ssm.modules.sys.entity.User;

import java.util.Date;
import java.util.List;

public class NoticePublish extends DataEntity<NoticePublish> {

    private String title;                   // 通知标题
    private String content;                 // 通知内容
    private String publisherId;             // 发布人id(后端赋值)
    private Date publishDate;               // 发布日期(后端赋值)
    @Deprecated
    private String status;                  // 是否草稿(弃用)

    // 来自于前端的临时数据(群发)
    private List<User> userList;        // 接收用户id列表

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

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }
}
