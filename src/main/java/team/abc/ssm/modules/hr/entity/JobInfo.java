package team.abc.ssm.modules.hr.entity;

import java.util.Date;

public class JobInfo {
    private String id;

    /**
	* 单位负责人的需求人数
	*/
    private Integer perChaDemand;

    /**
	* 单位负责人的求职人数
	*/
    private Integer perChaHunt;

    /**
	* 专业技术人员的需求人数
	*/
    private Integer proSkillDemand;

    /**
	* 专业技术人员的求职人数
	*/
    private Integer proSkillHunt;

    /**
	* 办事人员和有关人员的需求人数
	*/
    private Integer staffDemand;

    /**
	* 办事人员和有关人员的求职人数
	*/
    private Integer staffHunt;

    /**
	* 商业和服务人员的需求人数
	*/
    private Integer busDemand;

    /**
	* 商业和服务人员的求职人数
	*/
    private Integer busHunt;

    /**
	* 农林牧渔水利生产人员的需求人数
	*/
    private Integer productDemand;

    /**
	* 农林牧渔水利生产人员的求职人数
	*/
    private Integer productHunt;

    /**
	* 生产运输设备操作工需求人数
	*/
    private Integer tranDemand;

    /**
	* 生产运输设备操作工求职人数
	*/
    private Integer tranHunt;

    /**
	* 其他
	*/
    private Integer otherHunt;

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

    public Integer getPerChaDemand() {
        return perChaDemand;
    }

    public void setPerChaDemand(Integer perChaDemand) {
        this.perChaDemand = perChaDemand;
    }

    public Integer getPerChaHunt() {
        return perChaHunt;
    }

    public void setPerChaHunt(Integer perChaHunt) {
        this.perChaHunt = perChaHunt;
    }

    public Integer getProSkillDemand() {
        return proSkillDemand;
    }

    public void setProSkillDemand(Integer proSkillDemand) {
        this.proSkillDemand = proSkillDemand;
    }

    public Integer getProSkillHunt() {
        return proSkillHunt;
    }

    public void setProSkillHunt(Integer proSkillHunt) {
        this.proSkillHunt = proSkillHunt;
    }

    public Integer getStaffDemand() {
        return staffDemand;
    }

    public void setStaffDemand(Integer staffDemand) {
        this.staffDemand = staffDemand;
    }

    public Integer getStaffHunt() {
        return staffHunt;
    }

    public void setStaffHunt(Integer staffHunt) {
        this.staffHunt = staffHunt;
    }

    public Integer getBusDemand() {
        return busDemand;
    }

    public void setBusDemand(Integer busDemand) {
        this.busDemand = busDemand;
    }

    public Integer getBusHunt() {
        return busHunt;
    }

    public void setBusHunt(Integer busHunt) {
        this.busHunt = busHunt;
    }

    public Integer getProductDemand() {
        return productDemand;
    }

    public void setProductDemand(Integer productDemand) {
        this.productDemand = productDemand;
    }

    public Integer getProductHunt() {
        return productHunt;
    }

    public void setProductHunt(Integer productHunt) {
        this.productHunt = productHunt;
    }

    public Integer getTranDemand() {
        return tranDemand;
    }

    public void setTranDemand(Integer tranDemand) {
        this.tranDemand = tranDemand;
    }

    public Integer getTranHunt() {
        return tranHunt;
    }

    public void setTranHunt(Integer tranHunt) {
        this.tranHunt = tranHunt;
    }

    public Integer getOtherHunt() {
        return otherHunt;
    }

    public void setOtherHunt(Integer otherHunt) {
        this.otherHunt = otherHunt;
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