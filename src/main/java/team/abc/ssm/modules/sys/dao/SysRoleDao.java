package team.abc.ssm.modules.sys.dao;

import team.abc.ssm.modules.sys.entity.SysRole;

import java.util.List;

public interface SysRoleDao {

    // 通过用户名获取该用户拥有的所有角色
    List<SysRole> getRolesByUsername(String username);

    // 获取所有角色
    List<SysRole> getAllRoles();
}
