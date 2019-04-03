package team.abc.ssm.modules.hr.entity;

import java.util.Date;

public class ProfessionInfo {
    private String id;

    /**
	* 农林牧渔
	*/
    private Integer farm;

    /**
	* 采矿
	*/
    private Integer mining;

    /**
	* 制造
	*/
    private Integer create;

    /**
	* 电力
	*/
    private Integer electric;

    /**
	* 建筑
	*/
    private Integer structure;

    /**
	* 交通
	*/
    private Integer traffic;

    /**
	* 信息传输
	*/
    private Integer information;

    /**
	* 批发
	*/
    private Integer wholesale;

    /**
	* 住宿
	*/
    private Integer room;

    /**
	* 金融
	*/
    private Integer financial;

    /**
	* 房地产
	*/
    private Integer estate;

    /**
	* 租赁
	*/
    private Integer lease;

    /**
	* 科研
	*/
    private Integer research;

    /**
	* 水利
	*/
    private Integer water;

    /**
	* 居民服务
	*/
    private Integer resident;

    /**
	* 教育
	*/
    private Integer education;

    /**
	* 卫生
	*/
    private Integer health;

    /**
	* 文化
	*/
    private Integer culture;

    /**
	* 公共管理
	*/
    private Integer management;

    /**
	* 国际组织
	*/
    private Integer international;

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

    public Integer getFarm() {
        return farm;
    }

    public void setFarm(Integer farm) {
        this.farm = farm;
    }

    public Integer getMining() {
        return mining;
    }

    public void setMining(Integer mining) {
        this.mining = mining;
    }

    public Integer getCreate() {
        return create;
    }

    public void setCreate(Integer create) {
        this.create = create;
    }

    public Integer getElectric() {
        return electric;
    }

    public void setElectric(Integer electric) {
        this.electric = electric;
    }

    public Integer getStructure() {
        return structure;
    }

    public void setStructure(Integer structure) {
        this.structure = structure;
    }

    public Integer getTraffic() {
        return traffic;
    }

    public void setTraffic(Integer traffic) {
        this.traffic = traffic;
    }

    public Integer getInformation() {
        return information;
    }

    public void setInformation(Integer information) {
        this.information = information;
    }

    public Integer getWholesale() {
        return wholesale;
    }

    public void setWholesale(Integer wholesale) {
        this.wholesale = wholesale;
    }

    public Integer getRoom() {
        return room;
    }

    public void setRoom(Integer room) {
        this.room = room;
    }

    public Integer getFinancial() {
        return financial;
    }

    public void setFinancial(Integer financial) {
        this.financial = financial;
    }

    public Integer getEstate() {
        return estate;
    }

    public void setEstate(Integer estate) {
        this.estate = estate;
    }

    public Integer getLease() {
        return lease;
    }

    public void setLease(Integer lease) {
        this.lease = lease;
    }

    public Integer getResearch() {
        return research;
    }

    public void setResearch(Integer research) {
        this.research = research;
    }

    public Integer getWater() {
        return water;
    }

    public void setWater(Integer water) {
        this.water = water;
    }

    public Integer getResident() {
        return resident;
    }

    public void setResident(Integer resident) {
        this.resident = resident;
    }

    public Integer getEducation() {
        return education;
    }

    public void setEducation(Integer education) {
        this.education = education;
    }

    public Integer getHealth() {
        return health;
    }

    public void setHealth(Integer health) {
        this.health = health;
    }

    public Integer getCulture() {
        return culture;
    }

    public void setCulture(Integer culture) {
        this.culture = culture;
    }

    public Integer getManagement() {
        return management;
    }

    public void setManagement(Integer management) {
        this.management = management;
    }

    public Integer getInternational() {
        return international;
    }

    public void setInternational(Integer international) {
        this.international = international;
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