package team.abc.ssm.common.entity;

import java.util.Date;

public abstract class BaseEntity {
    protected String id;
    protected int commonStatus;
    protected String commonCreateUserId;
    protected Date commonCreateDate;
    protected String commonModifyUserId;
    protected Date commonModifyDate;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getCommonStatus() {
        return commonStatus;
    }

    public void setCommonStatus(int commonStatus) {
        this.commonStatus = commonStatus;
    }

    public String getCommonCreateUserId() {
        return commonCreateUserId;
    }

    public void setCommonCreateUserId(String commonCreateUserId) {
        this.commonCreateUserId = commonCreateUserId;
    }

    public Date getCommonCreateDate() {
        return commonCreateDate;
    }

    public void setCommonCreateDate(Date commonCreateDate) {
        this.commonCreateDate = commonCreateDate;
    }

    public String getCommonModifyUserId() {
        return commonModifyUserId;
    }

    public void setCommonModifyUserId(String commonModifyUserId) {
        this.commonModifyUserId = commonModifyUserId;
    }

    public Date getCommonModifyDate() {
        return commonModifyDate;
    }

    public void setCommonModifyDate(Date commonModifyDate) {
        this.commonModifyDate = commonModifyDate;
    }
}
