package team.abc.ssm.modules.sys.dao;

import org.apache.ibatis.annotations.Param;
import team.abc.ssm.common.persistence.Page;
import team.abc.ssm.modules.sys.entity.SysUser;

import java.util.List;

public interface SysUserDao {

    // 通过用户名获取用户信息
    SysUser getUserByUsername(String username);

    // 获取所有用户列表
    List<SysUser> getAllUsers();

    // 分页 + 搜索(模糊匹配用户名)获取用户列表
    List<SysUser> getUsersByPage(Page<SysUser> page);

    // 模糊搜索结果总数
    int getSearchTotal(@Param("searchKey") String searchKey);

    // 添加一名新用户
    int addUser(SysUser user);
}
