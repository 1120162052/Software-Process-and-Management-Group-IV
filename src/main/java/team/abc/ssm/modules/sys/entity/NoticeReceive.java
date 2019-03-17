package team.abc.ssm.modules.sys.entity;

import team.abc.ssm.common.persistence.DataEntity;

public class NoticeReceive extends DataEntity<NoticeReceive> {

    private String receiverId;
    private String noticeId;
    private int status; // 0-未读，1-已读

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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
