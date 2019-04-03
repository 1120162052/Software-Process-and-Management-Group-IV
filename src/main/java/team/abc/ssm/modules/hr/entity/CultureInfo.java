package team.abc.ssm.modules.hr.entity;

import java.util.Date;

public class CultureInfo {
    private Integer id;

    /**
	* 初中及以下需求人数
	*/
    private Integer juniorHighSchoolReqNum;

    /**
	* 职高需求人数
	*/
    private Integer vocReqNum;

    /**
	* 技校需求人数
	*/
    private Integer tecReqNum;

    /**
	* 中专需求人数
	*/
    private Integer secReqNum;

    /**
	* 大专需求人数
	*/
    private Integer collegeReqNum;

    /**
	* 大学需求人数
	*/
    private Integer universityReqNum;

    /**
	* 硕士需求人数
	*/
    private Integer masterReqNum;

    /**
	* 无要求需求人数
	*/
    private Integer noRequestReqNmu;

    /**
	* 初中及以下求职人数
	*/
    private Integer juniorHighSchoolHuntNum;

    /**
	* 职高求职人数
	*/
    private Integer vocHuntNum;

    /**
	* 技校求职人数
	*/
    private Integer tecHuntNum;

    /**
	* 中专求职人数
	*/
    private Integer secHuntNum;

    /**
	* 大专求职人数
	*/
    private Integer collegeHuntNum;

    /**
	* 大学求职人数
	*/
    private Integer universityHuntNum;

    /**
	* 硕士求职人数
	*/
    private Integer masterHuntNum;

    /**
	* 无要求求职人数
	*/
    private Integer noRequestHuntNmu;

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

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getJuniorHighSchoolReqNum() {
        return juniorHighSchoolReqNum;
    }

    public void setJuniorHighSchoolReqNum(Integer juniorHighSchoolReqNum) {
        this.juniorHighSchoolReqNum = juniorHighSchoolReqNum;
    }

    public Integer getVocReqNum() {
        return vocReqNum;
    }

    public void setVocReqNum(Integer vocReqNum) {
        this.vocReqNum = vocReqNum;
    }

    public Integer getTecReqNum() {
        return tecReqNum;
    }

    public void setTecReqNum(Integer tecReqNum) {
        this.tecReqNum = tecReqNum;
    }

    public Integer getSecReqNum() {
        return secReqNum;
    }

    public void setSecReqNum(Integer secReqNum) {
        this.secReqNum = secReqNum;
    }

    public Integer getCollegeReqNum() {
        return collegeReqNum;
    }

    public void setCollegeReqNum(Integer collegeReqNum) {
        this.collegeReqNum = collegeReqNum;
    }

    public Integer getUniversityReqNum() {
        return universityReqNum;
    }

    public void setUniversityReqNum(Integer universityReqNum) {
        this.universityReqNum = universityReqNum;
    }

    public Integer getMasterReqNum() {
        return masterReqNum;
    }

    public void setMasterReqNum(Integer masterReqNum) {
        this.masterReqNum = masterReqNum;
    }

    public Integer getNoRequestReqNmu() {
        return noRequestReqNmu;
    }

    public void setNoRequestReqNmu(Integer noRequestReqNmu) {
        this.noRequestReqNmu = noRequestReqNmu;
    }

    public Integer getJuniorHighSchoolHuntNum() {
        return juniorHighSchoolHuntNum;
    }

    public void setJuniorHighSchoolHuntNum(Integer juniorHighSchoolHuntNum) {
        this.juniorHighSchoolHuntNum = juniorHighSchoolHuntNum;
    }

    public Integer getVocHuntNum() {
        return vocHuntNum;
    }

    public void setVocHuntNum(Integer vocHuntNum) {
        this.vocHuntNum = vocHuntNum;
    }

    public Integer getTecHuntNum() {
        return tecHuntNum;
    }

    public void setTecHuntNum(Integer tecHuntNum) {
        this.tecHuntNum = tecHuntNum;
    }

    public Integer getSecHuntNum() {
        return secHuntNum;
    }

    public void setSecHuntNum(Integer secHuntNum) {
        this.secHuntNum = secHuntNum;
    }

    public Integer getCollegeHuntNum() {
        return collegeHuntNum;
    }

    public void setCollegeHuntNum(Integer collegeHuntNum) {
        this.collegeHuntNum = collegeHuntNum;
    }

    public Integer getUniversityHuntNum() {
        return universityHuntNum;
    }

    public void setUniversityHuntNum(Integer universityHuntNum) {
        this.universityHuntNum = universityHuntNum;
    }

    public Integer getMasterHuntNum() {
        return masterHuntNum;
    }

    public void setMasterHuntNum(Integer masterHuntNum) {
        this.masterHuntNum = masterHuntNum;
    }

    public Integer getNoRequestHuntNmu() {
        return noRequestHuntNmu;
    }

    public void setNoRequestHuntNmu(Integer noRequestHuntNmu) {
        this.noRequestHuntNmu = noRequestHuntNmu;
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