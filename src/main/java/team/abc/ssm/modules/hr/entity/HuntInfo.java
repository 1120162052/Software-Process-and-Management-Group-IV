package team.abc.ssm.modules.hr.entity;

import java.util.Date;

public class HuntInfo {
    private String id;

    /**
	* 求职者id
	*/
    private String huntId;

    /**
	* 新成长失业青年求职人数
	*/
    private Integer growHuntNum;

    /**
	* 就业转失业人员求职人数
	*/
    private Integer emptounempHuntNum;

    /**
	* 其他失业人员求职人数
	*/
    private Integer otherHuntNum;

    /**
	* 在业人员求职人数
	*/
    private Integer practHuntNum;

    /**
	* 下岗职工求职人数
	*/
    private Integer laidOffHuntNum;

    /**
	* 退休人员求职人数
	*/
    private Integer retireeHuntNum;

    /**
	* 在学人员求职人数
	*/
    private Integer instructorHuntNum;

    /**
	* 本市农村人员求职人数
	*/
    private Integer cityHuntNum;

    /**
	* 外埠人员求职人数
	*/
    private Integer outcityHuntNum;

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

    public String getHuntId() {
        return huntId;
    }

    public void setHuntId(String huntId) {
        this.huntId = huntId;
    }

    public Integer getGrowHuntNum() {
        return growHuntNum;
    }

    public void setGrowHuntNum(Integer growHuntNum) {
        this.growHuntNum = growHuntNum;
    }

    public Integer getEmptounempHuntNum() {
        return emptounempHuntNum;
    }

    public void setEmptounempHuntNum(Integer emptounempHuntNum) {
        this.emptounempHuntNum = emptounempHuntNum;
    }

    public Integer getOtherHuntNum() {
        return otherHuntNum;
    }

    public void setOtherHuntNum(Integer otherHuntNum) {
        this.otherHuntNum = otherHuntNum;
    }

    public Integer getPractHuntNum() {
        return practHuntNum;
    }

    public void setPractHuntNum(Integer practHuntNum) {
        this.practHuntNum = practHuntNum;
    }

    public Integer getLaidOffHuntNum() {
        return laidOffHuntNum;
    }

    public void setLaidOffHuntNum(Integer laidOffHuntNum) {
        this.laidOffHuntNum = laidOffHuntNum;
    }

    public Integer getRetireeHuntNum() {
        return retireeHuntNum;
    }

    public void setRetireeHuntNum(Integer retireeHuntNum) {
        this.retireeHuntNum = retireeHuntNum;
    }

    public Integer getInstructorHuntNum() {
        return instructorHuntNum;
    }

    public void setInstructorHuntNum(Integer instructorHuntNum) {
        this.instructorHuntNum = instructorHuntNum;
    }

    public Integer getCityHuntNum() {
        return cityHuntNum;
    }

    public void setCityHuntNum(Integer cityHuntNum) {
        this.cityHuntNum = cityHuntNum;
    }

    public Integer getOutcityHuntNum() {
        return outcityHuntNum;
    }

    public void setOutcityHuntNum(Integer outcityHuntNum) {
        this.outcityHuntNum = outcityHuntNum;
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