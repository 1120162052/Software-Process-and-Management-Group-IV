package team.abc.ssm.modules.sys.dao;

import org.apache.ibatis.annotations.Param;
import team.abc.ssm.common.persistence.Page;
import team.abc.ssm.modules.sys.entity.SysUser;

import java.util.List;

public interface SysUserDao {

    // 通过用户名获取用户信息
    SysUser selectByUsername(String username);

    // 获取所有用户列表
    List<SysUser> selectAll();

    // 分页 + 搜索(模糊匹配用户名)获取用户列表（无角色信息）
    List<SysUser> selectByPage(Page<SysUser> page);

    // 根据ids获取用户列表（有角色信息）
    List<SysUser> selectByIds(@Param("userList") List<SysUser> userList);

    // 模糊搜索结果总数
    int selectSearchCount(@Param("searchKey") String searchKey);

    // 添加一名新用户
    int insert(SysUser user);

    // 更新用户信息
    int update(SysUser user);

    // 删除指定id的用户
    int deleteByIds(String[] ids);
}
