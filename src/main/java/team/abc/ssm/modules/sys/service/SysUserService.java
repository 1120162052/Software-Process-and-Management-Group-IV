package team.abc.ssm.modules.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.abc.ssm.common.persistence.Page;
import team.abc.ssm.modules.sys.dao.SysUserDao;
import team.abc.ssm.modules.sys.entity.SysRole;
import team.abc.ssm.modules.sys.entity.SysUser;
import team.abc.ssm.modules.sys.entity.map.SysUserRole;

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
        return userDao.selectByUsername(username);
    }

    /**
     * @return 获取所有用户
     */
    public List<SysUser> getAllUsers() {
        return userDao.selectAll();
    }

    /**
     * 分页 + 搜索(模糊匹配用户名)获取用户列表和总数
     *
     * @param page 分页参数
     * @return 用户列表以及total
     */
    public Page<SysUser> getUsersByPage(Page<SysUser> page) {
        // 先获取分页的users
        List<SysUser> userList = userDao.selectByPage(page);
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
        SysUser user = userDao.selectByUsername(username);
        return user != null;
    }

    /**
     * 创建用户
     *
     * @param username 用户名
     * @param password 密码
     * @return 成功与否
     */
    public boolean addUser(String username, String password) {
        SysUser user = new SysUser();
        user.setUsername(username);
        user.setPassword(password);
        user.preInsert();
        int count = userDao.insert(user);
        return count == 1;
    }

    /**
     * @param user 用户对象
     * @return 成功与否
     */
    public boolean update(SysUser user) {
        int count = userDao.update(user);
        return count == 1;
    }

    /**
     * 删除指定id的所有用户
     *
     * @param ids id数组
     * @return 指定id的所有用户都被删除时返回true
     */
    public boolean deleteUserByIds(String[] ids) {
        int count = userDao.deleteByIds(ids);
        return count == ids.length;
    }
}
