package team.abc.ssm.modules.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.abc.ssm.common.persistence.Page;
import team.abc.ssm.modules.sys.dao.SysUserDao;
import team.abc.ssm.modules.sys.entity.SysRole;
import team.abc.ssm.modules.sys.entity.SysUser;
import team.abc.ssm.modules.sys.entity.map.SysUserRoleMap;

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
        // 先获取分页的users
        List<SysUser> userList = userDao.getUsersByPage(page);
        // 再查询具体内容
        page.setResultList(userDao.getUsersByIds(userList));
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
     * @param user   用户对象
     * @param userId 创建者id（当前登陆用户）
     * @return 成功与否
     */
    public boolean updateUser(SysUser user, String userId) {
        // 更新user的内部信息
        int count = userDao.updateUser(user);
        boolean success1 = count == 1;
        // 更新user和role的关联信息
        boolean success2 = updateUserRoleMap(user, userId);
        return success1 && success2;
    }

    /**
     * 采用先删所有后加的更新方式
     *
     * @param user         需要和角色关联的用户（包含了需要关联的角色列表）
     * @param createUserId 创建者id（当前登陆用户）
     * @return 成功与否
     */
    private boolean updateUserRoleMap(SysUser user, String createUserId) {
        // 删除所有目标用户和角色的关联
        userDao.deleteAllUserRoleMap(user);
        // 角色列表为空直接返回成功
        if (user.getRoleList().size() == 0) return true;
        // 添加关联
        List<SysUserRoleMap> urList = new ArrayList<>();
        for (SysRole role : user.getRoleList()) {
            SysUserRoleMap ur = new SysUserRoleMap(user.getId(), role.getId(), createUserId);
            urList.add(ur);
        }
        int count = userDao.addUserRoleMap(urList);
        return count == urList.size();
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
