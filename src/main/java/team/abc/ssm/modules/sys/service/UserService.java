package team.abc.ssm.modules.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.abc.ssm.modules.sys.dao.UserDao;
import team.abc.ssm.modules.sys.entity.User;

@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    // 通过用户名获取用户信息
    public User get1(String username){
        User user = userDao.get1(username);
        return user;
    }
}
