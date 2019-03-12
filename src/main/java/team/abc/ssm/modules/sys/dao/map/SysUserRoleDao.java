package team.abc.ssm.modules.sys.dao.map;

import team.abc.ssm.modules.sys.entity.SysUser;
import team.abc.ssm.modules.sys.entity.map.SysUserRole;

import java.util.List;

public interface SysUserRoleDao {

    // 删除某个用户的所有角色关联
    int deleteByUserId(SysUser user);

    // 批量添加
    int insert(List<SysUserRole> userRoleList);
}
