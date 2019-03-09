package team.abc.ssm.modules.web.functions;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import team.abc.ssm.common.web.BaseController;
import team.abc.ssm.common.web.MsgType;
import team.abc.ssm.modules.sys.entity.SysUser;
import team.abc.ssm.modules.sys.service.SysFunctionService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("functions/frame")
public class FrameController extends BaseController {

    @Autowired
    private SysFunctionService functionService;

    @RequestMapping(value = "init", method = RequestMethod.POST)
    @ResponseBody
    public Object init(){
        // 获取当前用户信息
        SysUser user = getCurrentUser();
        // 获取用户拥有的权限信息
        List<SysFunctionService.Category> categoryList = functionService.getFunctionTree(user.getUsername());
        Map<String, Object> data = new HashMap<>();
        data.put("user", user);
        data.put("categoryList", categoryList);
        return retMsg.Set(MsgType.SUCCESS, data);
    }
}
