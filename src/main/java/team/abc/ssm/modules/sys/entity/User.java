package team.abc.ssm.modules.sys.entity;

import team.abc.ssm.common.entity.BaseEntity;
import team.abc.ssm.common.utils.IdGen;

import java.util.Date;

public class User extends BaseEntity {

    private String username;
    private String password;

    // 通过username，password创建用户
    public User(String username, String password, String createUserId) {
        this.username = username;
        this.password = password;
        this.id = IdGen.uuid();
        this.commonCreateUserId = createUserId;
        this.commonModifyUserId = this.commonCreateUserId;
        this.commonCreateDate = new Date();
        this.commonModifyDate = this.commonCreateDate;
    }

    public User() {

    }

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
}
