package team.abc.ssm.modules.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.abc.ssm.common.persistence.Page;
import team.abc.ssm.modules.sys.dao.SysUserDao;
import team.abc.ssm.modules.sys.entity.SysUser;

import java.util.ArrayList;
import java.util.List;

@Service
public class SysUserService {

    @Autowired
    private SysUserDao userDao;

    /**
     * @param username 用户名
     * @return 对应用户对象
     */
    public SysUser getUserByUsername(String username) {
        return userDao.getUserByUsername(username);
    }

    /**
     * @return 获取所有用户
     */
    public List<SysUser> getAllUsers() {
        return userDao.getAllUsers();
    }

    /**
     * 分页 + 搜索(模糊匹配用户名)获取用户列表和总数
     *
     * @param page 分页参数
     * @return 用户列表以及total
     */
    public Page getUsersByPage(Page<SysUser> page) {
        page.setResultList(userDao.getUsersByPage(page));
        page.setTotal(userDao.getSearchTotal(page.getSearchKey()));
        return page;
    }

    /**
     * 检测用户名是否重复
     *
     * @param username 用户名
     * @return 是否
     */
    public boolean isUsernameExist(String username) {
        SysUser user = userDao.getUserByUsername(username);
        return user != null;
    }

    /**
     * 创建用户
     *
     * @param username     用户名
     * @param password     密码
     * @param createUserId 创建者id
     * @return 成功与否
     */
    public boolean addUser(String username, String password, String createUserId) {
        SysUser user = new SysUser(username, password, createUserId);
        int count = userDao.addUser(user);
        return count == 1;
    }

    /**
     * 更新用户信息
     * @param userId 用户id
     * @param password 密码
     * @return 成功与否
     */
    public boolean updateUser(String userId, String password) {
        SysUser user = new SysUser();
        user.setId(userId);
        user.setPassword(password);
        int count = userDao.updateUser(user);
        return count == 1;
    }

    /**
     * 删除指定id的所有用户
     *
     * @param ids id数组
     * @return 指定id的所有用户都被删除时返回true
     */
    public boolean deleteUserByIds(String[] ids) {
        int count = userDao.deleteUserByIds(ids);
        return count == ids.length;
    }
}
