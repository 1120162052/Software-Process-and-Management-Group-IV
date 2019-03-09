package team.abc.ssm.modules.sys.service;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.abc.ssm.common.entity.Page;
import team.abc.ssm.modules.sys.dao.UserDao;
import team.abc.ssm.modules.sys.entity.User;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    // 通过用户名获取用户信息
    public User get1(String username) {
        User user = userDao.get1(username);
        return user;
    }

    // 获取所有用户
    public List<User> get2() {
        return userDao.get2();
    }

    // 分页 + 搜索(模糊匹配用户名)获取用户列表和总数
    public Page get3(Page<User> page) {
        page.setResultList(userDao.get3(page));
        page.setTotal(userDao.get4(page.getSearchKey()));
        return page;
    }

    // 检测用户名是否重复
    public boolean get4(String username) {
        User user = userDao.get1(username);
        if (user != null)
            return true;
        else
            return false;
    }

    // 获取当前登陆的用户信息
    public User get5() {
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        User user = userDao.get1(username);
        return user;
    }

    // 添加一名新用户
    public boolean add1(String username, String password, String createUserId) {
        User user = new User(username, password, createUserId);
        int count = userDao.add1(user);
        if (count == 1)
            return true;
        return false;
    }
}
