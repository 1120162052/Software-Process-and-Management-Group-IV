package team.abc.ssm.modules.sys.service.map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.abc.ssm.modules.sys.dao.map.SysUserRoleDao;
import team.abc.ssm.modules.sys.entity.SysRole;
import team.abc.ssm.modules.sys.entity.SysUser;
import team.abc.ssm.modules.sys.entity.map.SysUserRole;

import java.util.ArrayList;
import java.util.List;

@Service
public class SysUserRoleService {

    @Autowired
    private SysUserRoleDao userRoleDao;

    /**
     * 覆盖式更新一个用户拥有的角色（缺点：丢失创建记录）
     *
     * @param user     目标用户
     * @param roleList 用户拥有的所有角色
     * @return 成功与否
     */
    public boolean update(SysUser user, List<SysRole> roleList) {
        userRoleDao.deleteByUserId(user);
        List<SysUserRole> userRoleList = new ArrayList<>();
        for (SysRole role : roleList) {
            SysUserRole userRole = new SysUserRole();
            userRole.setRoleId(role.getId());
            userRole.setUserId(user.getId());
            userRole.preInsert();
            userRoleList.add(userRole);
        }
        userRoleDao.insert(userRoleList);
        return true;
    }
}
