package team.abc.ssm.modules.hr.entity;

import java.util.Date;

public class SexInfo {
    private String id;

    /**
	* 男性需求人数
	*/
    private Integer maleReqNum;

    /**
	* 女性需求人数
	*/
    private Integer femaleReqNmu;

    /**
	* 无要求需求人数
	*/
    private Integer noRequestReqNum;

    /**
	* 男性求职人数
	*/
    private Integer maleHuntNum;

    /**
	* 女性求职人数
	*/
    private Integer femaleHuntNum;

    /**
	* 无要求求职人数
	*/
    private Integer noRequestHuntNum;

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

    public Integer getMaleReqNum() {
        return maleReqNum;
    }

    public void setMaleReqNum(Integer maleReqNum) {
        this.maleReqNum = maleReqNum;
    }

    public Integer getFemaleReqNmu() {
        return femaleReqNmu;
    }

    public void setFemaleReqNmu(Integer femaleReqNmu) {
        this.femaleReqNmu = femaleReqNmu;
    }

    public Integer getNoRequestReqNum() {
        return noRequestReqNum;
    }

    public void setNoRequestReqNum(Integer noRequestReqNum) {
        this.noRequestReqNum = noRequestReqNum;
    }

    public Integer getMaleHuntNum() {
        return maleHuntNum;
    }

    public void setMaleHuntNum(Integer maleHuntNum) {
        this.maleHuntNum = maleHuntNum;
    }

    public Integer getFemaleHuntNum() {
        return femaleHuntNum;
    }

    public void setFemaleHuntNum(Integer femaleHuntNum) {
        this.femaleHuntNum = femaleHuntNum;
    }

    public Integer getNoRequestHuntNum() {
        return noRequestHuntNum;
    }

    public void setNoRequestHuntNum(Integer noRequestHuntNum) {
        this.noRequestHuntNum = noRequestHuntNum;
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