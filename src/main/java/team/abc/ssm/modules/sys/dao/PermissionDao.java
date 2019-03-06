package team.abc.ssm.modules.sys.dao;

import team.abc.ssm.modules.sys.entity.Permission;

import java.util.List;

public interface PermissionDao {

    // 通过用户名获取该用户拥有的所有权限
    List<Permission> get1(String username);

    // 获取所有权限
    List<Permission> get2();
}
