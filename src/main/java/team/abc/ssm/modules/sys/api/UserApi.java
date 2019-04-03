package team.abc.ssm.modules.sys.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import team.abc.ssm.common.persistence.Page;
import team.abc.ssm.common.utils.UserUtils;
import team.abc.ssm.common.web.BaseApi;
import team.abc.ssm.common.web.MsgType;
import team.abc.ssm.modules.sys.entity.User;
import team.abc.ssm.modules.sys.service.UserService;
import team.abc.ssm.modules.sys.service.map.UserRoleService;

import java.util.List;

/**
 * put                      添加
 * deleteList               批量删除
 * update                   更新
 * getList                  分页查询
 * checkUsername            校验用户名重名
 * getCurrentUser           获取当前登陆用户信息
 */
@Controller
@RequestMapping("api/sys/user")
public class UserApi extends BaseApi {

    @Autowired
    private UserService userService;

    @Autowired
    private UserRoleService userRoleService;

    @RequestMapping(value = "put", method = RequestMethod.POST)
    @ResponseBody
    public Object put(@RequestBody User user) {
        boolean success1 = userService.addUser(user);
        boolean success2 = userRoleService.add(user);
        return  success1 && success2 ? retMsg.Set(MsgType.SUCCESS) : retMsg.Set(MsgType.ERROR);
    }

    @RequestMapping(value = "deleteList", method = RequestMethod.POST)
    @ResponseBody
    public Object deleteList(@RequestBody List<User> userList) {
        boolean success1 = userRoleService.delete(userList);
        boolean success2 = userService.deleteUserByIds(userList);
        return success1 && success2 ? retMsg.Set(MsgType.SUCCESS) : retMsg.Set(MsgType.ERROR);
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    @ResponseBody
    public Object update(@RequestBody User user) {
        boolean success1 = userService.update(user);
        boolean success2 = userRoleService.update(user, user.getRoleList());
        if (success1 && success2)
            return retMsg.Set(MsgType.SUCCESS);
        else
            return retMsg.Set(MsgType.ERROR);
    }

    @RequestMapping(value = "updateList", method = RequestMethod.POST)
    @ResponseBody
    public Object updateList(@RequestBody List<User> userList) {
        boolean success = userService.updateList(userList);
        if (success)
            return retMsg.Set(MsgType.SUCCESS);
        else
            return retMsg.Set(MsgType.ERROR);
    }

    @RequestMapping(value = "getList", method = RequestMethod.POST)
    @ResponseBody
    public Object getList(@RequestBody User user) {
        return retMsg.Set(MsgType.SUCCESS, userService.getUsersByPage(user));
    }

    @RequestMapping(value = "checkUsername", method = RequestMethod.POST)
    @ResponseBody
    public Object checkUsername(@RequestBody User user) {
        if (userService.isUsernameExist(user)) {
            return retMsg.Set(MsgType.ERROR);
        }
        return retMsg.Set(MsgType.SUCCESS);
    }

    @RequestMapping(value = "getCurrentUser", method = RequestMethod.POST)
    @ResponseBody
    public Object getCurrentUser() {
        return retMsg.Set(MsgType.SUCCESS, UserUtils.getCurrentUser());
    }

    @RequestMapping(value = "getCompleteUserInfo", method = RequestMethod.POST)
    @ResponseBody
    public Object getCompleteUserInfo(@RequestBody User user) {
        return retMsg.Set(MsgType.SUCCESS, userService.getUserByUsername(user));
    }

    // used in notice publish when add a user to receiver list
    @RequestMapping(value = "selectListByPage2", method = RequestMethod.POST)
    @ResponseBody
    public Object selectListByPage2(@RequestBody User user){
        Page<User> page = new Page<>();
        page.setResultList(userService.selectListByPage2(user));
        page.setTotal(userService.selectSearchCount2(user));
        return retMsg.Set(MsgType.SUCCESS, page);
    }
}
