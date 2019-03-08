package team.abc.ssm.modules.web.functions.sys;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import team.abc.ssm.common.entity.Page;
import team.abc.ssm.common.web.BaseController;
import team.abc.ssm.common.web.MsgType;
import team.abc.ssm.modules.sys.entity.User;
import team.abc.ssm.modules.sys.service.UserService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("functions/sys/userManager")
public class UserManagerController extends BaseController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "getUserList", method = RequestMethod.POST)
    @ResponseBody
    public Object getUserList(@RequestBody Page<User> page) {
        return retMsg.Set(MsgType.SUCCESS, userService.get3(page));
    }
}
