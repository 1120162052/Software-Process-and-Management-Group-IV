package team.abc.ssm.modules.sys.service;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.abc.ssm.common.persistence.Page;
import team.abc.ssm.modules.sys.dao.SysUserDao;
import team.abc.ssm.modules.sys.entity.SysUser;

import java.util.List;

@Service
public class SysUserService {

    @Autowired
    private SysUserDao userDao;

    // 通过用户名获取用户信息
    public SysUser getUserByUsername(String username) {
        SysUser user = userDao.getUserByUsername(username);
        return user;
    }

    // 获取所有用户
    public List<SysUser> getAllUsers() {
        return userDao.getAllUsers();
    }

    // 分页 + 搜索(模糊匹配用户名)获取用户列表和总数
    public Page getUsersByPage(Page<SysUser> page) {
        page.setResultList(userDao.getUsersByPage(page));
        page.setTotal(userDao.getSearchTotal(page.getSearchKey()));
        return page;
    }

    // 检测用户名是否重复
    public boolean isUsernameExist(String username) {
        SysUser user = userDao.getUserByUsername(username);
        if (user != null)
            return true;
        else
            return false;
    }

    // 获取当前登陆的用户信息
    public SysUser getLoginUser() {
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        SysUser user = userDao.getUserByUsername(username);
        return user;
    }

    // 添加一名新用户
    public boolean addUser(String username, String password, String createUserId) {
        SysUser user = new SysUser(username, password, createUserId);
        int count = userDao.addUser(user);
        if (count == 1)
            return true;
        return false;
    }
}
