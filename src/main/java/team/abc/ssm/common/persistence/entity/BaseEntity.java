package team.abc.ssm.common.persistence.entity;

import team.abc.ssm.common.persistence.Page;
import team.abc.ssm.modules.sys.entity.SysUser;

import java.io.Serializable;

public abstract class BaseEntity<T> implements Serializable {

    protected String id;            // 实体编号（唯一标识）
    protected Page<T> page;         // 当前实体分页对象
    protected SysUser currentUser;  // 当前用户

    public BaseEntity() {

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public SysUser getCurrentUser() {
        return currentUser;
    }

    public void setCurrentUser(SysUser currentUser) {
        this.currentUser = currentUser;
    }

    public Page<T> getPage() {
        return page;
    }

    public void setPage(Page<T> page) {
        this.page = page;
    }
}
