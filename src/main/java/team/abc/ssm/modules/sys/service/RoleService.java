package team.abc.ssm.modules.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.abc.ssm.modules.sys.dao.RoleDao;
import team.abc.ssm.modules.sys.dao.UserDao;
import team.abc.ssm.modules.sys.entity.Role;
import team.abc.ssm.modules.sys.entity.User;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class RoleService {

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private UserService userService;

    // 通过用户名获取该用户拥有的所有角色
    public Set<String> get1(String username) {
        List<Role> roleList = roleDao.get1(username);
        Set<String> result = new HashSet<>();
        for (Role role : roleList) {
            result.add(role.getCode());
        }
        return result;
    }

    // 通过用户名判断一个用户是否是管理员
    public boolean isAdmin(String username) {
        List<Role> roleList = roleDao.get1(username);
        for (Role role : roleList) {
            if (role.getCode().equals("admin"))
                return true;
        }
        return false;
    }
}
