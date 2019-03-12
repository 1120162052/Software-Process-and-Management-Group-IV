package team.abc.ssm.modules.web.functions.sys;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import team.abc.ssm.common.web.BaseController;
import team.abc.ssm.common.web.MsgType;
import team.abc.ssm.modules.sys.service.SysFunctionService;

import java.util.List;

@Controller
@RequestMapping("functions/sys/functionManager")
public class FunctionManagerController extends BaseController {

    @Autowired
    private SysFunctionService functionService;

    @RequestMapping(value = "getFunctionTree", method = RequestMethod.POST)
    @ResponseBody
    public Object getFunctionTree() {
        List<SysFunctionService.Category> categoryList = functionService.getFunctionTree("", true);
        return retMsg.Set(MsgType.SUCCESS, categoryList);
    }
}
