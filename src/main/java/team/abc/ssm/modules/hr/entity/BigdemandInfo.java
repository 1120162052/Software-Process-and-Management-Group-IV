package team.abc.ssm.modules.hr.entity;

import java.util.Date;

public class BigdemandInfo {
    private String id;

    /**
	* 职业类别
	*/
    private String bigdemandType;

    /**
	* 职业代码
	*/
    private Integer careerId;

    /**
	* 需求人数
	*/
    private Integer bigdemandDemand;

    /**
	* 求职人数
	*/
    private Integer bigdemandHunt;

    /**
	* 备注
	*/
    private String commonRemarks;

    /**
	* 删除标记
	*/
    private String commonDelFlag;

    /**
	* 创建者id
	*/
    private String commonCreateUserId;

    /**
	* 最后修改者id
	*/
    private String commonModifyUserId;

    /**
	* 创建日期
	*/
    private Date commonCreateDate;

    /**
	* 最后修改日期
	*/
    private Date commonModifyDate;

    /**
	* 用户id
	*/
    private String userId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getBigdemandType() {
        return bigdemandType;
    }

    public void setBigdemandType(String bigdemandType) {
        this.bigdemandType = bigdemandType;
    }

    public Integer getCareerId() {
        return careerId;
    }

    public void setCareerId(Integer careerId) {
        this.careerId = careerId;
    }

    public Integer getBigdemandDemand() {
        return bigdemandDemand;
    }

    public void setBigdemandDemand(Integer bigdemandDemand) {
        this.bigdemandDemand = bigdemandDemand;
    }

    public Integer getBigdemandHunt() {
        return bigdemandHunt;
    }

    public void setBigdemandHunt(Integer bigdemandHunt) {
        this.bigdemandHunt = bigdemandHunt;
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

    public String getCommonCreateUserId() {
        return commonCreateUserId;
    }

    public void setCommonCreateUserId(String commonCreateUserId) {
        this.commonCreateUserId = commonCreateUserId;
    }

    public String getCommonModifyUserId() {
        return commonModifyUserId;
    }

    public void setCommonModifyUserId(String commonModifyUserId) {
        this.commonModifyUserId = commonModifyUserId;
    }

    public Date getCommonCreateDate() {
        return commonCreateDate;
    }

    public void setCommonCreateDate(Date commonCreateDate) {
        this.commonCreateDate = commonCreateDate;
    }

    public Date getCommonModifyDate() {
        return commonModifyDate;
    }

    public void setCommonModifyDate(Date commonModifyDate) {
        this.commonModifyDate = commonModifyDate;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
}