package team.abc.ssm.modules.sys.entity;

import team.abc.ssm.common.persistence.DataEntity;

public class SysRole extends DataEntity<SysRole> {

    private String name;
    private String code;

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
}
