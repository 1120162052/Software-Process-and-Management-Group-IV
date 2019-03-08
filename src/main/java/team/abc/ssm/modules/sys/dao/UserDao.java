package team.abc.ssm.modules.sys.dao;

import org.apache.ibatis.annotations.Param;
import team.abc.ssm.common.entity.Page;
import team.abc.ssm.modules.sys.entity.User;

import java.util.List;

public interface UserDao {

    // 通过用户名获取用户信息
    User get1(String username);

    // 获取所有用户列表
    List<User> get2();

    // 分页 + 搜索(模糊匹配用户名)获取用户列表
    List<User> get3(Page<User> page);

    // 模糊搜索结果总数
    int get4(@Param("searchKey") String searchKey);
}
