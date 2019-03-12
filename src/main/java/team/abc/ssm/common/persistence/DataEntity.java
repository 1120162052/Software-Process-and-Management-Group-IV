package team.abc.ssm.common.persistence;

import team.abc.ssm.common.utils.IdGen;
import team.abc.ssm.common.utils.UserUtils;

import java.util.Date;

/**
 * 所有表格的对应实体类的基类
 * 提供了基础的通用属性
 */
public class DataEntity {

    protected String id;
    protected String commonRemarks;         // 备注
    protected String commonDelFlag;         // 删除标记（0：正常；1：删除；2：审核）
    protected String commonCreateUserId;    // 创建者id
    protected String commonModifyUserId;    // 最后修改者id
    protected Date commonCreateDate;        // 创建日期
    protected Date commonModifyDate;        // 最后修改日期

    public DataEntity() {

    }

    /**
     * 插入之前手动调用
     */
    public void preInsert(){
        id = IdGen.uuid();
        commonDelFlag = "0";
        commonCreateUserId = UserUtils.getCurrentUser().getId();
        commonModifyUserId = commonCreateUserId;
        commonCreateDate = new Date();
        commonModifyDate = commonCreateDate;
    }

    /**
     * 更新之前手动调用
     */
    public void preUpdate(){
        commonModifyUserId = commonCreateUserId;
        commonModifyDate = commonCreateDate;
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

    public String getCommonDelFlag() {
        return commonDelFlag;
    }

    public void setCommonDelFlag(String commonDelFlag) {
        this.commonDelFlag = commonDelFlag;
    }
}
