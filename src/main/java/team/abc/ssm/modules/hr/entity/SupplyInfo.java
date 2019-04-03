package team.abc.ssm.modules.hr.entity;

import java.util.Date;

public class SupplyInfo {
    private String id;

    /**
	* 季度
	*/
    private String supplyQuarter;

    /**
	* 需求人数
	*/
    private Integer supplyDemand;

    /**
	* 求职人数
	*/
    private Integer supplyHunt;

    /**
	* 状态信息
	*/
    private Integer status;

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

    public String getSupplyQuarter() {
        return supplyQuarter;
    }

    public void setSupplyQuarter(String supplyQuarter) {
        this.supplyQuarter = supplyQuarter;
    }

    public Integer getSupplyDemand() {
        return supplyDemand;
    }

    public void setSupplyDemand(Integer supplyDemand) {
        this.supplyDemand = supplyDemand;
    }

    public Integer getSupplyHunt() {
        return supplyHunt;
    }

    public void setSupplyHunt(Integer supplyHunt) {
        this.supplyHunt = supplyHunt;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
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