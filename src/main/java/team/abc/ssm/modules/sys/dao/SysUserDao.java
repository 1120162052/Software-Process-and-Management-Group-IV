package team.abc.ssm.modules.sys.dao;

import org.apache.ibatis.annotations.Param;
import team.abc.ssm.common.persistence.Page;
import team.abc.ssm.modules.sys.entity.SysUser;
import team.abc.ssm.modules.sys.entity.map.SysUserRoleMap;

import java.util.List;

public interface SysUserDao {

    // 通过用户名获取用户信息
    SysUser getUserByUsername(String username);

    // 获取所有用户列表
    List<SysUser> getAllUsers();

    // 分页 + 搜索(模糊匹配用户名)获取用户列表（无角色信息）
    List<SysUser> getUsersByPage(Page<SysUser> page);

    // 根据ids获取用户列表（有角色信息）
    List<SysUser> getUsersByIds(@Param("userList") List<SysUser> userList);

    // 模糊搜索结果总数
    int getSearchTotal(@Param("searchKey") String searchKey);

    // 添加一名新用户
    int addUser(SysUser user);

    // 更新用户信息
    int updateUser(SysUser user);

    // 删除指定id的用户
    int deleteUserByIds(String[] ids);

    // 删除所有目标用户和角色的关联
    int deleteAllUserRoleMap(SysUser user);

    // 添加目标用户和响应角色的关联
    int addUserRoleMap(@Param("urList") List<SysUserRoleMap> urlist);
}
