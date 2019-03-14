package team.abc.ssm.modules.sys.dao.map;

import team.abc.ssm.common.persistence.CrudDao;
import team.abc.ssm.modules.sys.entity.SysRole;
import team.abc.ssm.modules.sys.entity.map.SysRoleFunction;

import java.util.List;

public interface SysRoleFunctionDao extends CrudDao<SysRoleFunction> {

    // 删除一个角色的所有功能
    int deleteByRole(SysRole role);

    int insertList(List<SysRoleFunction> list);
}
