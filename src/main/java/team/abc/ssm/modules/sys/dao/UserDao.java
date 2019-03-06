package team.abc.ssm.modules.sys.dao;

import team.abc.ssm.modules.sys.entity.User;

public interface UserDao {

    // 通过用户名获取用户信息
    User get1(String username);
}
