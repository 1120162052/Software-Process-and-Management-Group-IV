package team.abc.ssm.modules.sys.entity;

import team.abc.ssm.common.persistence.DataEntity;

import java.util.List;

public class User extends DataEntity<User> {

    private String username;
    private String password;

    private int userType; // 用户类型: 0 - 管理员;1 - 省;2 - 市;3 - 监测点
    private int recordStatus; // 0 - 未提交，1 - 已提交（市审核中），2 - 市审核通过（省审核中），3 - 省审核通过，4 - 退回
    private int reportStatus; // 0 - 未提交，1 - 已提交（市审核中），2 - 市审核通过（省审核中），3 - 省审核通过，4 - 退回
    private int actionType; //0 - 无，1 - 查询备案，2 - 查询报表
    private String provinceId;
    private String cityId;
    private String industryId;
    private String marketName;
    private String marketCode;
    private String contactName;
    private String contactMobile;
    private String contactPhone;
    private String fax;

    private Dict province;
    private Dict city;

    private List<Role> roleList; // 相关角色列表

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<Role> getRoleList() {
        return roleList;
    }

    public void setRoleList(List<Role> roleList) {
        this.roleList = roleList;
    }

    public int getUserType() {
        return userType;
    }

    public void setUserType(int userType) {
        this.userType = userType;
    }

    public int getRecordStatus() {
        return recordStatus;
    }

    public void setStatus(int recordStatus) {
        this.recordStatus = recordStatus;
    }

    public String getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(String provinceId) {
        this.provinceId = provinceId;
    }

    public String getCityId() {
        return cityId;
    }

    public void setCityId(String cityId) {
        this.cityId = cityId;
    }

    public String getIndustryId() {
        return industryId;
    }

    public void setIndustryId(String industryId) {
        this.industryId = industryId;
    }

    public String getMarketName() {
        return marketName;
    }

    public void setMarketName(String marketName) {
        this.marketName = marketName;
    }

    public String getMarketCode() {
        return marketCode;
    }

    public void setMarketCode(String marketCode) {
        this.marketCode = marketCode;
    }

    public String getContactName() {
        return contactName;
    }

    public void setContactName(String contactName) {
        this.contactName = contactName;
    }

    public String getContactMobile() {
        return contactMobile;
    }

    public void setContactMobile(String contactMobile) {
        this.contactMobile = contactMobile;
    }

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public Dict getProvince() {
        return province;
    }

    public void setProvince(Dict province) {
        this.province = province;
    }

    public Dict getCity() {
        return city;
    }

    public void setCity(Dict city) {
        this.city = city;
    }

    public int getReportStatus() {
        return reportStatus;
    }

    public void setReportStatus(int reportStatus) {
        this.reportStatus = reportStatus;
    }

    public int getActionType() {
        return actionType;
    }

    public void setActionType(int actionType) {
        this.actionType = actionType;
    }
}
