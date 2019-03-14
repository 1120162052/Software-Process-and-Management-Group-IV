package team.abc.ssm.modules.web.functions.sys;

import org.aspectj.apache.bcel.generic.RET;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import team.abc.ssm.common.persistence.Page;
import team.abc.ssm.common.web.BaseController;
import team.abc.ssm.common.web.MsgType;
import team.abc.ssm.modules.sys.entity.SysRole;
import team.abc.ssm.modules.sys.entity.map.SysRoleFunction;
import team.abc.ssm.modules.sys.service.SysFunctionService;
import team.abc.ssm.modules.sys.service.SysRoleService;
import team.abc.ssm.modules.sys.service.map.SysRoleFunctionService;

/**
 * 角色管理
 */
@Controller
@RequestMapping("functions/sys/roleManager")
public class RoleManagerController extends BaseController {

    @Autowired
    private SysRoleService roleService;

    @Autowired
    private SysFunctionService functionService;

    @Autowired
    private SysRoleFunctionService roleFunctionService;

    @RequestMapping(value = "getList", method = RequestMethod.POST)
    @ResponseBody
    public Object getList(@RequestBody Page<SysRole> page) {
        return retMsg.Set(MsgType.SUCCESS, roleService.getByPage(page));
    }

    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    public Object add(@RequestBody SysRole role) {
        return retMsg.Set(MsgType.SUCCESS);
    }

    @RequestMapping(value = "edit", method = RequestMethod.POST)
    @ResponseBody
    public Object edit(@RequestBody SysRole role) {
        return retMsg.Set(MsgType.SUCCESS);
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    public Object delete(@RequestParam("idList[]") String[] ids) {
        return retMsg.Set(MsgType.SUCCESS);
    }

    @RequestMapping(value = "getRoleWithFunctions", method = RequestMethod.POST)
    @ResponseBody
    public Object getRoleWithFunctions(@RequestBody SysRole role) {
        return retMsg.Set(MsgType.SUCCESS, functionService.getFunctionTree(null, role));
    }

    @RequestMapping(value = "updateRoleFunction", method = RequestMethod.POST)
    @ResponseBody
    public Object updateRoleFunction(@RequestBody SysRole role) {
        roleFunctionService.updateByRole(role);
        return retMsg.Set(MsgType.SUCCESS);
    }
}
