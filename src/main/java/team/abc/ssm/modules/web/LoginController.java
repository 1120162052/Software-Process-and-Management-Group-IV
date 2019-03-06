package team.abc.ssm.modules.web;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import team.abc.ssm.common.web.BaseController;
import team.abc.ssm.common.web.MsgType;

@Controller
@RequestMapping("login")
public class LoginController extends BaseController {

    @RequestMapping(value = "", method = RequestMethod.POST)
    @ResponseBody
    public Object login(
            @RequestParam("username") String username,
            @RequestParam("password") String password
    ) {
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        // 如果已经登陆，则退出已经登陆的用户
        if (subject.isAuthenticated()) {
            subject.logout();
        }
        try {
            subject.login(token);
            return retMsg.Set(MsgType.SUCCESS);
        } catch (AuthenticationException e) {
            return retMsg.Set(MsgType.ERROR);
        }
    }
}
