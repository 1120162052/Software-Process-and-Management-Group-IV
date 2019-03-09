package team.abc.ssm.common.web;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import team.abc.ssm.modules.sys.entity.SysUser;
import team.abc.ssm.modules.sys.service.SysUserService;

public abstract class BaseController {

    protected AjaxMessage retMsg = new AjaxMessage();

    @Autowired
    private SysUserService userService;

    // 获取当前登陆的用户信息
    protected SysUser getCurrentUser(){
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        SysUser user = userService.getUserByUsername(username);
        return user;
    }
}
