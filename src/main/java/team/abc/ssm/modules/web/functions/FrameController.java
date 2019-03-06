package team.abc.ssm.modules.web.functions;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import team.abc.ssm.common.web.BaseController;
import team.abc.ssm.common.web.MsgType;
import team.abc.ssm.modules.sys.entity.Permission;
import team.abc.ssm.modules.sys.entity.User;
import team.abc.ssm.modules.sys.service.PermissionService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("functions/frame")
public class FrameController extends BaseController {

    @Autowired
    private PermissionService permissionService;

    @RequestMapping(value = "init", method = RequestMethod.POST)
    @ResponseBody
    public Object init(){
        // 获取登陆用户信息
        User user = getLoginUser();
        // 获取用户拥有的权限信息
        List<PermissionService.Category> categoryList = permissionService.get3(user.getUsername());
        Map<String, Object> data = new HashMap<>();
        data.put("user", user);
        data.put("categoryList", categoryList);
        return retMsg.Set(MsgType.SUCCESS, data);
    }
}
