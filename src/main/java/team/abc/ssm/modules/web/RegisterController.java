package team.abc.ssm.modules.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import team.abc.ssm.common.web.BaseController;
import team.abc.ssm.common.web.MsgType;

@Controller
@RequestMapping("register")
public class RegisterController extends BaseController {

    @RequestMapping(value = "", method = RequestMethod.POST)
    @ResponseBody
    public Object register(){
        return retMsg.Set(MsgType.SUCCESS);
    }
}
