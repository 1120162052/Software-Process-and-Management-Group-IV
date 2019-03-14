package team.abc.ssm.modules.sys.dao;

import org.apache.ibatis.annotations.Param;
import team.abc.ssm.common.persistence.CrudDao;
import team.abc.ssm.common.persistence.Page;
import team.abc.ssm.modules.sys.entity.SysRole;

import java.util.List;

public interface SysRoleDao extends CrudDao<SysRole> {

    // 通过用户名获取该用户拥有的所有角色
    List<SysRole> getRolesByUsername(String username);

    // 获取所有角色
    List<SysRole> getAllRoles();

    List<SysRole> selectByIds(@Param("list") List<SysRole> entityList);

    List<SysRole> selectByPage(Page<SysRole> page);

    int selectSearchCount(Page page);
}
