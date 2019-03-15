package team.abc.ssm.modules.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.abc.ssm.common.persistence.Page;
import team.abc.ssm.modules.sys.dao.UserDao;
import team.abc.ssm.modules.sys.entity.User;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    /**
     * @param username 用户名
     * @return 对应用户对象
     */
    public User getUserByUsername(String username) {
        return userDao.selectByUsername(username);
    }

    /**
     * @return 获取所有用户
     */
    public List<User> getAllUsers() {
        return userDao.selectAll();
    }

    /**
     * 分页 + 搜索(模糊匹配用户名)获取用户列表和总数
     *
     * @param page 分页参数
     * @return 用户列表以及total
     */
    public Page<User> getUsersByPage(Page<User> page) {
        // 先获取分页的users
        List<User> userList = userDao.selectByPage(page);
        // 再查询具体内容
        page.setResultList(userDao.selectByIds(userList));
        page.setTotal(userDao.selectSearchCount(page.getSearchKey()));
        return page;
    }

    /**
     * 检测用户名是否重复
     *
     * @param username 用户名
     * @return 是否
     */
    public boolean isUsernameExist(String username) {
        User user = userDao.selectByUsername(username);
        return user != null;
    }

    public boolean addUser(User user) {
        if (isUsernameExist(user.getUsername()))
            return false;
        user.preInsert();
        int count = userDao.insert(user);
        return count == 1;
    }

    /**
     * @param user 用户对象
     * @return 成功与否
     */
    public boolean update(User user) {
        int count = userDao.update(user);
        return count == 1;
    }

    public boolean deleteUserByIds(List<User> userList) {
        int count = userDao.deleteByIds(userList);
        return count == userList.size();
    }
}
