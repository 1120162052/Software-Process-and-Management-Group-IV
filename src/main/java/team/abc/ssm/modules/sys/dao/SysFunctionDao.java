package team.abc.ssm.modules.sys.dao;

import team.abc.ssm.common.persistence.CrudDao;
import team.abc.ssm.modules.sys.entity.SysFunction;

import java.util.List;

public interface SysFunctionDao extends CrudDao<SysFunction>{

    // 通过用户名获取该用户拥有的所有功能
    List<SysFunction> selectByUsername(String username);

    // 取出所有启用的功能
    List<SysFunction> selectAllEnabled();

    // 由id更新index
    int updateIndex(List<SysFunction> functionList);
}
