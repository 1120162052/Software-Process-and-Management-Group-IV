package team.abc.ssm.modules.sys.dao;

import team.abc.ssm.modules.sys.entity.SysFunction;

import java.util.List;

public interface SysFunctionDao {

    // 通过用户名获取该用户拥有的所有功能
    List<SysFunction> getFunctionsByUsername(String username);

    // 获取所有功能
    List<SysFunction> getAllFunctions();
}
