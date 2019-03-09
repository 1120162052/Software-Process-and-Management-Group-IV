package team.abc.ssm.modules.web.functions.sys;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import team.abc.ssm.common.persistence.Page;
import team.abc.ssm.common.web.BaseController;
import team.abc.ssm.common.web.MsgType;
import team.abc.ssm.modules.sys.entity.SysUser;
import team.abc.ssm.modules.sys.service.SysUserService;

@Controller
@RequestMapping("functions/sys/userManager")
public class UserManagerController extends BaseController {

    @Autowired
    private SysUserService userService;

    @RequestMapping(value = "getUserList", method = RequestMethod.POST)
    @ResponseBody
    public Object getUserList(@RequestBody Page<SysUser> page) {
        return retMsg.Set(MsgType.SUCCESS, userService.getUsersByPage(page));
    }

    @RequestMapping(value = "addUser", method = RequestMethod.POST)
    @ResponseBody
    public Object addUser(
            @RequestParam("username") String username,
            @RequestParam("password") String password
    ) {
        if (password == null || password.equals("")) {
            return retMsg.Set(MsgType.ERROR);
        }
        if (username == null || username.equals("")) {
            return retMsg.Set(MsgType.ERROR);
        }
        // 如果用户名重复，直接返回error
        if (userService.isUsernameExist(username) == true) {
            return retMsg.Set(MsgType.ERROR);
        }
        boolean success = userService.addUser(username, password, getCurrentUser().getId());
        if (success)
            return retMsg.Set(MsgType.SUCCESS);
        else
            return retMsg.Set(MsgType.ERROR);
    }

    @RequestMapping(value = "validateUsername", method = RequestMethod.POST)
    @ResponseBody
    public Object validateUsername(
            @RequestParam("username") String username
    ) {
        // 如果用户名重复，直接返回error
        if (userService.isUsernameExist(username) == true) {
            return retMsg.Set(MsgType.ERROR);
        }
        return retMsg.Set(MsgType.SUCCESS);
    }
}
