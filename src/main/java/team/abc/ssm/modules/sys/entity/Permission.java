package team.abc.ssm.modules.sys.entity;

import team.abc.ssm.common.entity.BaseEntity;

public class Permission extends BaseEntity {

    private String name;
    private String code;
    private int type;
    private String parentId;
    private String url;
    private int index_;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public int getIndex_() {
        return index_;
    }

    public void setIndex_(int index_) {
        this.index_ = index_;
    }
}
