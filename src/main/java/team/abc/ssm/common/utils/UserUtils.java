package team.abc.ssm.common.utils;

import org.apache.shiro.SecurityUtils;
import team.abc.ssm.modules.sys.entity.SysUser;
import team.abc.ssm.modules.sys.service.SysUserService;

/**
 * 用户工具类
 */
public class UserUtils {

    private static SysUserService userService = SpringContextHolder.getBean(SysUserService.class);

    /**
     * @return 返回当前登陆用户
     */
    public static SysUser getCurrentUser() {
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        return userService.getUserByUsername(username);
    }
}
