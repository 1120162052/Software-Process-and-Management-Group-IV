package team.abc.ssm.modules.hr.entity;

import java.util.Date;

public class UnitInfo {
    private Integer id;

    /**
	* 国有企业人数
	*/
    private Integer state;

    /**
	* 集体企业
	*/
    private Integer collective;

    /**
	* 股份合作
	*/
    private Integer cooperation;

    /**
	* 联营企业
	*/
    private Integer joint;

    /**
	* 有限责任企业
	*/
    private Integer limited;

    /**
	* 股份合作企业
	*/
    private Integer share;

    /**
	* 私营企业
	*/
    private Integer private;

    /**
	* 其他企业
	*/
    private Integer other;

    /**
	* 港澳台企业
	*/
    private Integer hk;

    /**
	* 外商投资企业
	*/
    private Integer foreign;

    /**
	* 个体经营
	*/
    private Integer self;

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

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getCollective() {
        return collective;
    }

    public void setCollective(Integer collective) {
        this.collective = collective;
    }

    public Integer getCooperation() {
        return cooperation;
    }

    public void setCooperation(Integer cooperation) {
        this.cooperation = cooperation;
    }

    public Integer getJoint() {
        return joint;
    }

    public void setJoint(Integer joint) {
        this.joint = joint;
    }

    public Integer getLimited() {
        return limited;
    }

    public void setLimited(Integer limited) {
        this.limited = limited;
    }

    public Integer getShare() {
        return share;
    }

    public void setShare(Integer share) {
        this.share = share;
    }

    public Integer getPrivate() {
        return private;
    }

    public void setPrivate(Integer private) {
        this.private = private;
    }

    public Integer getOther() {
        return other;
    }

    public void setOther(Integer other) {
        this.other = other;
    }

    public Integer getHk() {
        return hk;
    }

    public void setHk(Integer hk) {
        this.hk = hk;
    }

    public Integer getForeign() {
        return foreign;
    }

    public void setForeign(Integer foreign) {
        this.foreign = foreign;
    }

    public Integer getSelf() {
        return self;
    }

    public void setSelf(Integer self) {
        this.self = self;
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