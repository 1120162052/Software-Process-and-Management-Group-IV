package team.abc.ssm.modules.sys.dao;

import team.abc.ssm.modules.sys.entity.Role;

import java.util.List;

public interface RoleDao {

    // 通过用户名获取该用户拥有的所有角色
    List<Role> get1(String username);
}
