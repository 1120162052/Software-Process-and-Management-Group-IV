package team.abc.ssm.modules.sys.service;

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
}
