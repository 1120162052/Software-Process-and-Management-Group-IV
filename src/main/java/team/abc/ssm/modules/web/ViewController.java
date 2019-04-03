package team.abc.ssm.modules.web;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import team.abc.ssm.common.web.BaseController;

@Controller
public class ViewController extends BaseController {

    /**
     * 常规页
     **/
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index() {
        return "functions/frame";
    }

    @RequestMapping(value = "functions/home", method = RequestMethod.GET)
    public String home() {
        return "functions/home";
    }

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value = "register", method = RequestMethod.GET)
    public String register() {
        return "register";
    }
    /** 常规页 **/

    /**
     * 系统功能
     **/
    @RequestMapping(value = "functions/sys/userManager", method = RequestMethod.GET)
    @RequiresPermissions("sys:user")
    public String sys_user() {
        return "functions/sys/userManager";
    }

    @RequestMapping(value = "functions/sys/roleManager", method = RequestMethod.GET)
    @RequiresPermissions("sys:role")
    public String sys_role() {
        return "functions/sys/roleManager";
    }

    @RequestMapping(value = "functions/sys/functionManager", method = RequestMethod.GET)
    @RequiresPermissions("sys:function")
    public String sys_function() {
        return "functions/sys/functionManager";
    }

    @RequestMapping(value = "functions/sys/dictManager", method = RequestMethod.GET)
    @RequiresPermissions("sys:dict")
    public String sys_dict() {
        return "functions/sys/dictManager";
    }

    @RequestMapping(value = "functions/sys/dictTypeManager", method = RequestMethod.GET)
    @RequiresPermissions("sys:dict")
    public String sys_dictType() {
        return "functions/sys/dictTypeManager";
    }
    /** 系统功能 **/

    /**
     * 通知模块
     */
    @RequestMapping(value = "functions/notice/publishNotice", method = RequestMethod.GET)
    public String notice_publishNotice(){
        return "functions/notice/publishNotice";
    }

    @RequestMapping(value = "functions/notice/receiveNotice", method = RequestMethod.GET)
    public String notice_receiveNotice(){
        return "functions/notice/receiveNotice";
    }
    /** 通知模块 **/

    /**
     * 备案模块
     **/
    @RequestMapping(value = "functions/record/fillRecord", method = RequestMethod.GET)
    public String record_fillRecord() {
        return "functions/record/fillRecord";
    }

    @RequestMapping(value = "functions/record/recordManagerCity", method = RequestMethod.GET)
    public String record_recordManagerCity() {
        return "functions/record/recordManagerCity";
    }

    @RequestMapping(value = "functions/record/recordManagerProvince", method = RequestMethod.GET)
    public String record_recordManagerProvince() {
        return "functions/record/recordManagerProvince";
    }

    @RequestMapping(value = "functions/record/userManagerOfProvince", method = RequestMethod.GET)
    public String user_manager_of_province() {
        return "functions/record/userManagerOfProvince";
    }
    /** 备案模块 **/

    /**
     * 报表模块
     */
    @RequestMapping(value = "functions/report/releaseReport", method = RequestMethod.GET)
    public String release_report() {
        return "functions/report/releaseReport";
    }

    @RequestMapping(value = "functions/report/reportManagerCity", method = RequestMethod.GET)
    public String report_manager_city() {
        return "functions/report/reportManagerCity";
    }
}
