package team.abc.ssm.common.web;

import team.abc.ssm.common.utils.UserUtils;
import team.abc.ssm.modules.sys.entity.User;

/**
 * 页面控制器的基类
 */
public abstract class BaseController {

    protected AjaxMessage retMsg = new AjaxMessage();

    // 获取当前登陆的用户信息
    protected User getCurrentUser(){
        return UserUtils.getCurrentUser();
    }
}
