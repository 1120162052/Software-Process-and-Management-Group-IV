package team.abc.ssm.modules.web.functions.sys;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import team.abc.ssm.common.persistence.Page;
import team.abc.ssm.common.web.BaseController;
import team.abc.ssm.common.web.MsgType;
import team.abc.ssm.modules.sys.entity.Role;
import team.abc.ssm.modules.sys.entity.User;
import team.abc.ssm.modules.sys.service.RoleService;
import team.abc.ssm.modules.sys.service.UserService;
import team.abc.ssm.modules.sys.service.map.UserRoleService;

import java.util.List;

@Controller
@RequestMapping("functions/sys/userManager")
public class UserManagerController extends BaseController {

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private UserRoleService userRoleService;

    /**
     * 分页+模糊搜索获取用户列表
     *
     * @param page 分页参数：pageIndex, pageSize, searchKey
     * @return 用户列表
     */
    @RequestMapping(value = "getUserList", method = RequestMethod.POST)
    @ResponseBody
    public Object getUserList(@RequestBody Page<User> page) {
        return retMsg.Set(MsgType.SUCCESS, userService.getUsersByPage(page));
    }

    /**
     * 编辑用户信息
     *
     * @param user 用户对象
     * @return 更新成功与否
     */
    @RequestMapping(value = "editUser", method = RequestMethod.POST)
    @ResponseBody
    public Object editUser(@RequestBody User user) {
        if (user.getPassword() == null || user.getPassword().equals("")) {
            return retMsg.Set(MsgType.ERROR);
        }
        boolean success1 = userService.update(user);
        boolean success2 = userRoleService.update(user, user.getRoleList());
        if (success1 && success2)
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

    @RequestMapping(value = "getRoleList", method = RequestMethod.POST)
    @ResponseBody
    public Object getRoleList() {
        List<Role> roleList = roleService.getAllRoles();
        return retMsg.Set(MsgType.SUCCESS, roleList);
    }

    @RequestMapping(value = "test", method = RequestMethod.POST)
    @ResponseBody
    public Object test() {
        return retMsg.Set(MsgType.SUCCESS);
    }
}
