package team.abc.ssm.modules.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.abc.ssm.common.persistence.Page;
import team.abc.ssm.modules.sys.dao.SysRoleDao;
import team.abc.ssm.modules.sys.entity.SysRole;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class SysRoleService {

    @Autowired
    private SysRoleDao roleDao;

    // 通过用户名获取该用户拥有的所有角色
    public Set<String> getRolesByUsername(String username) {
        List<SysRole> roleList = roleDao.getRolesByUsername(username);
        Set<String> result = new HashSet<>();
        for (SysRole role : roleList) {
            result.add(role.getCode());
        }
        return result;
    }

    // 获取所有角色
    public List<SysRole> getAllRoles(){
        return roleDao.getAllRoles();
    }

    // 通过用户名判断一个用户是否是管理员
    public boolean isAdmin(String username) {
        List<SysRole> roleList = roleDao.getRolesByUsername(username);
        for (SysRole role : roleList) {
            if (role.getCode().equals("admin"))
                return true;
        }
        return false;
    }

    public Page<SysRole> getByPage(Page<SysRole> page){
        List<SysRole> roleList = roleDao.selectByPage(page);
        page.setResultList(roleDao.selectByIds(roleList));
        page.setTotal(roleDao.selectSearchCount(page));
        return page;
    }
}
