package team.abc.ssm.modules.web.functions.sys;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import team.abc.ssm.common.persistence.Page;
import team.abc.ssm.common.web.BaseController;
import team.abc.ssm.common.web.MsgType;
import team.abc.ssm.modules.sys.entity.SysUser;
import team.abc.ssm.modules.sys.service.SysUserService;

import java.util.List;

@Controller
@RequestMapping("functions/sys/userManager")
public class UserManagerController extends BaseController {

    @Autowired
    private SysUserService userService;

    /**
     * 分页+模糊搜索获取用户列表
     *
     * @param page 分页参数：pageIndex, pageSize, searchKey
     * @return 用户列表
     */
    @RequestMapping(value = "getUserList", method = RequestMethod.POST)
    @ResponseBody
    public Object getUserList(@RequestBody Page<SysUser> page) {
        return retMsg.Set(MsgType.SUCCESS, userService.getUsersByPage(page));
    }

    /**
     * 创建一名新用户
     *
     * @param username 用户名
     * @param password 密码
     * @return 成功与否
     */
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
        if (userService.isUsernameExist(username)) {
            return retMsg.Set(MsgType.ERROR);
        }
        boolean success = userService.addUser(username, password, getCurrentUser().getId());
        if (success)
            return retMsg.Set(MsgType.SUCCESS);
        else
            return retMsg.Set(MsgType.ERROR);
    }

    /**
     * 检测用户名是否合法
     *
     * @param username 用户名
     * @return 如果用户名重复，返回error
     */
    @RequestMapping(value = "validateUsername", method = RequestMethod.POST)
    @ResponseBody
    public Object validateUsername(
            @RequestParam("username") String username
    ) {
        if (userService.isUsernameExist(username)) {
            return retMsg.Set(MsgType.ERROR);
        }
        return retMsg.Set(MsgType.SUCCESS);
    }

    /**
     * 删除指定id的所有用户
     * @param ids id数组
     * @return 指定id的所有用户都被删除时返回成功
     */
    @RequestMapping(value = "deleteUser", method = RequestMethod.POST)
    @ResponseBody
    public Object deleteUser(@RequestParam("idList[]") String[] ids) {
        boolean success = userService.deleteUserByIds(ids);
        if (success)
            return retMsg.Set(MsgType.SUCCESS);
        else
            return retMsg.Set(MsgType.ERROR);
    }
}
