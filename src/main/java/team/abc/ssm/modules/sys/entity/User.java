package team.abc.ssm.modules.sys.entity;

import team.abc.ssm.common.persistence.DataEntity;

import java.util.List;

public class User extends DataEntity<User> {

    private String username;
    private String password;

    private int userType; // 用户类型: 0 - 管理员;1 - 省;2 - 市;3 - 监测点
    private int status; // 0 - 未审核，1 - 审核中，2 - 退回，3 - 通过
    private String userId;
    private String provinceId;
    private String cityId;
    private String industryId;
    private String marketName;
    private String marketCode;
    private String contactName;
    private String contactMobile;
    private String contactPhone;
    private String fax;

    private UserInfo userInfo; // 存储详细信息

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

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }
}
