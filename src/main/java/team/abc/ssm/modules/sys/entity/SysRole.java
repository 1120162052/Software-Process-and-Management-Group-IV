package team.abc.ssm.modules.sys.entity;

import team.abc.ssm.common.persistence.DataEntity;

import java.util.List;

public class SysRole extends DataEntity<SysRole> {

    private String name;
    private String code;

    private List<SysFunction> functionList; // 角色拥有的功能列表

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

    public List<SysFunction> getFunctionList() {
        return functionList;
    }

    public void setFunctionList(List<SysFunction> functionList) {
        this.functionList = functionList;
    }
}
