package team.abc.ssm.modules.web.functions.sys;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import team.abc.ssm.common.web.BaseController;
import team.abc.ssm.common.web.MsgType;
import team.abc.ssm.modules.sys.entity.Function;
import team.abc.ssm.modules.sys.service.FunctionService;

import java.util.List;

@Controller
@RequestMapping("functions/sys/functionManager")
public class FunctionManagerController extends BaseController {

    @Autowired
    private FunctionService functionService;

    @RequestMapping(value = "getFunctionTree", method = RequestMethod.POST)
    @ResponseBody
    public Object getFunctionTree() {
        List<Function> categoryList = functionService.getFunctionTree(null, null);
        return retMsg.Set(MsgType.SUCCESS, categoryList);
    }

    @RequestMapping(value = "addNewCategory", method = RequestMethod.POST)
    @ResponseBody
    public Object addNewCategory(@RequestBody Function category) {
        Function newCategory = functionService.addNewCategory(category);
        if (newCategory != null)
            return retMsg.Set(MsgType.SUCCESS, newCategory);
        else
            return retMsg.Set(MsgType.ERROR);
    }

    @RequestMapping(value = "addNewFunction", method = RequestMethod.POST)
    @ResponseBody
    public Object addNewFunction(@RequestBody Function function) {
        Function newFunction = functionService.addNewFunction(function);
        if (newFunction != null)
            return retMsg.Set(MsgType.SUCCESS, newFunction);
        else
            return retMsg.Set(MsgType.ERROR);
    }

    @RequestMapping(value = "deleteCategoryOrFunction", method = RequestMethod.POST)
    @ResponseBody
    public Object deleteCategory(@RequestBody List<Function> categoryList) {
        // 删除第一个，后续的更新index
        boolean success1 = functionService.deleteById(categoryList.get(0));
        categoryList.remove(0);
        boolean success2 = functionService.updateIndex(categoryList);
        if (success1 && success2)
            return retMsg.Set(MsgType.SUCCESS);
        return retMsg.Set(MsgType.ERROR);
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    @ResponseBody
    public Object update(@RequestBody Function function) {
        boolean success = functionService.update(function);
        if (success)
            return retMsg.Set(MsgType.SUCCESS);
        return retMsg.Set(MsgType.ERROR);
    }
}
