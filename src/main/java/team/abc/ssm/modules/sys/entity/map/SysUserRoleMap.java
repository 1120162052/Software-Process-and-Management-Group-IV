package team.abc.ssm.modules.sys.entity.map;

import team.abc.ssm.common.persistence.DataEntity;
import team.abc.ssm.common.utils.IdGen;

import java.util.Date;

public class SysUserRoleMap extends DataEntity {
    private String id;
    private String userId;
    private String roleId;

    @Override
    public String getId() {
        return id;
    }

    @Override
    public void setId(String id) {
        this.id = id;
    }

    public SysUserRoleMap() {

    }

    public SysUserRoleMap(String userId, String roleId, String createUserId) {
        this.userId = userId;
        this.roleId = roleId;
        this.id = IdGen.uuid();
        this.commonCreateUserId = createUserId;
        this.commonModifyUserId = createUserId;
        this.commonCreateDate = new Date();
        this.commonModifyDate = this.commonCreateDate;
    }


    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }
}
