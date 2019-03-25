package team.abc.ssm.modules.sys.entity;

import team.abc.ssm.common.persistence.DataEntity;

public class Dict extends DataEntity<Dict> {

    private String type;
    private String nameCn;
    private String nameEn;
    private String parentId;
    private int sort;

    private String parentNameCn;
    private String parentNameEn;
    private String typeNameCn;
    private String typeNameEn;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getNameCn() {
        return nameCn;
    }

    public void setNameCn(String nameCn) {
        this.nameCn = nameCn;
    }

    public String getNameEn() {
        return nameEn;
    }

    public void setNameEn(String nameEn) {
        this.nameEn = nameEn;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public int getSort() {
        return sort;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }

    public String getParentNameCn() {
        return parentNameCn;
    }

    public void setParentNameCn(String parentNameCn) {
        this.parentNameCn = parentNameCn;
    }

    public String getParentNameEn() {
        return parentNameEn;
    }

    public void setParentNameEn(String parentNameEn) {
        this.parentNameEn = parentNameEn;
    }

    public String getTypeNameCn() {
        return typeNameCn;
    }

    public void setTypeNameCn(String typeNameCn) {
        this.typeNameCn = typeNameCn;
    }

    public String getTypeNameEn() {
        return typeNameEn;
    }

    public void setTypeNameEn(String typeNameEn) {
        this.typeNameEn = typeNameEn;
    }
}
