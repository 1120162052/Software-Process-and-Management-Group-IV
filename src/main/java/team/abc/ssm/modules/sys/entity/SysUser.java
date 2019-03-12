package team.abc.ssm.modules.sys.entity;

import team.abc.ssm.common.persistence.DataEntity;

import java.util.List;

public class SysUser extends DataEntity<SysUser> {

    private String username;
    private String password;

    private List<SysRole> roleList; // 相关角色列表

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

    public List<SysRole> getRoleList() {
        return roleList;
    }

    public void setRoleList(List<SysRole> roleList) {
        this.roleList = roleList;
    }
}
