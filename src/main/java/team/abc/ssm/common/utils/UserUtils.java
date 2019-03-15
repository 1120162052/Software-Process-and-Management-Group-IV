package team.abc.ssm.common.utils;

import org.apache.shiro.SecurityUtils;
import team.abc.ssm.modules.sys.entity.User;
import team.abc.ssm.modules.sys.service.UserService;

/**
 * 用户工具类
 */
public class UserUtils {

    private static UserService userService = SpringContextHolder.getBean(UserService.class);

    /**
     * @return 返回当前登陆用户
     */
    public static User getCurrentUser() {
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        return userService.getUserByUsername(username);
    }
}
