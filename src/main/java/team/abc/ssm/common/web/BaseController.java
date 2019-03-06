package team.abc.ssm.common.web;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import team.abc.ssm.modules.sys.entity.User;
import team.abc.ssm.modules.sys.service.UserService;

public abstract class BaseController {

    protected AjaxMessage retMsg = new AjaxMessage();

    @Autowired
    private UserService userService;

    // 获取当前登陆的用户
    protected User getLoginUser(){
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        User user = userService.get1(username);
        return user;
    }
}
