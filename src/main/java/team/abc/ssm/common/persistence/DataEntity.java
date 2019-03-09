package team.abc.ssm.common.persistence;

import java.util.Date;

public class DataEntity {

    protected String id;
    protected String commonCreateUserId;    // 创建者id
    protected Date commonCreateDate;        // 创建日期
    protected String commonModifyUserId;    // 最后修改者id
    protected Date commonModifyDate;        // 最后修改日期
    protected String commonRemarks;         // 备注

    public DataEntity() {

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public String getCommonRemarks() {
        return commonRemarks;
    }

    public void setCommonRemarks(String commonRemarks) {
        this.commonRemarks = commonRemarks;
    }
}
