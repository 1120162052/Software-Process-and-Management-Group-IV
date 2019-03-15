package team.abc.ssm.modules.sys.entity;

import team.abc.ssm.common.persistence.DataEntity;

import java.util.List;

public class Role extends DataEntity<Role> {

    private String name;
    private String code;

    private List<Function> functionList; // 角色拥有的功能列表

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

    public List<Function> getFunctionList() {
        return functionList;
    }

    public void setFunctionList(List<Function> functionList) {
        this.functionList = functionList;
    }
}
