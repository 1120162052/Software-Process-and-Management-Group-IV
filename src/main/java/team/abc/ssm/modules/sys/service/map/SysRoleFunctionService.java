package team.abc.ssm.modules.sys.service.map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.abc.ssm.modules.sys.dao.map.SysRoleFunctionDao;
import team.abc.ssm.modules.sys.entity.SysFunction;
import team.abc.ssm.modules.sys.entity.SysRole;
import team.abc.ssm.modules.sys.entity.map.SysRoleFunction;

import java.util.ArrayList;
import java.util.List;

@Service
public class SysRoleFunctionService {

    @Autowired
    private SysRoleFunctionDao roleFunctionDao;

    /**
     * 更新角色拥有的功能列表
     */
    public boolean updateByRole(SysRole role) {
        // 先删除角色拥有的所有功能
        roleFunctionDao.deleteByRole(role);
        // 再添加
        List<SysRoleFunction> list = new ArrayList<>();
        for (SysFunction function : role.getFunctionList()) {
            SysRoleFunction roleFunction = new SysRoleFunction();
            roleFunction.setRoleId(role.getId());
            roleFunction.setFunctionId(function.getId());
            roleFunction.preInsert();
            list.add(roleFunction);
        }
        if (list.size() == 0) return true;
        int count = roleFunctionDao.insertList(list);
        return count == list.size();
    }
}
