package team.abc.ssm.modules.hr.entity;

import java.util.Date;

public class AgeInfo {
    private String id;

    /**
	* 16~24岁需求人数
	*/
    private Integer range1ReqNum;

    /**
	* 25~34岁需求人数
	*/
    private Integer range2ReqNum;

    /**
	* 35~44岁需求人数
	*/
    private Integer range3ReqNum;

    /**
	* 45岁以上需求人数
	*/
    private Integer range4ReqNum;

    /**
	* 无要求需求人数
	*/
    private Integer noRequestReqNum;

    /**
	* 16~24岁求职人数
	*/
    private Integer range1HuntNum;

    /**
	* 25~34岁求职人数
	*/
    private Integer range2HuntNum;

    /**
	* 35~44岁求职人数
	*/
    private Integer range3HuntNum;

    /**
	* 45岁以上求职人数
	*/
    private Integer range4HuntNum;

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

    public Integer getRange1ReqNum() {
        return range1ReqNum;
    }

    public void setRange1ReqNum(Integer range1ReqNum) {
        this.range1ReqNum = range1ReqNum;
    }

    public Integer getRange2ReqNum() {
        return range2ReqNum;
    }

    public void setRange2ReqNum(Integer range2ReqNum) {
        this.range2ReqNum = range2ReqNum;
    }

    public Integer getRange3ReqNum() {
        return range3ReqNum;
    }

    public void setRange3ReqNum(Integer range3ReqNum) {
        this.range3ReqNum = range3ReqNum;
    }

    public Integer getRange4ReqNum() {
        return range4ReqNum;
    }

    public void setRange4ReqNum(Integer range4ReqNum) {
        this.range4ReqNum = range4ReqNum;
    }

    public Integer getNoRequestReqNum() {
        return noRequestReqNum;
    }

    public void setNoRequestReqNum(Integer noRequestReqNum) {
        this.noRequestReqNum = noRequestReqNum;
    }

    public Integer getRange1HuntNum() {
        return range1HuntNum;
    }

    public void setRange1HuntNum(Integer range1HuntNum) {
        this.range1HuntNum = range1HuntNum;
    }

    public Integer getRange2HuntNum() {
        return range2HuntNum;
    }

    public void setRange2HuntNum(Integer range2HuntNum) {
        this.range2HuntNum = range2HuntNum;
    }

    public Integer getRange3HuntNum() {
        return range3HuntNum;
    }

    public void setRange3HuntNum(Integer range3HuntNum) {
        this.range3HuntNum = range3HuntNum;
    }

    public Integer getRange4HuntNum() {
        return range4HuntNum;
    }

    public void setRange4HuntNum(Integer range4HuntNum) {
        this.range4HuntNum = range4HuntNum;
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