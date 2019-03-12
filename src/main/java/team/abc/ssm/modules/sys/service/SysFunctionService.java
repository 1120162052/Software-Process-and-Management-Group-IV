package team.abc.ssm.modules.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.abc.ssm.modules.sys.dao.SysFunctionDao;
import team.abc.ssm.modules.sys.entity.SysFunction;

import java.util.*;

@Service
public class SysFunctionService {

    @Autowired
    private SysFunctionDao functionDao;

    @Autowired
    private SysRoleService roleService;

    // 通过用户名获取该用户拥有的所有功能
    public Set<String> getFunctionSetByUsername(String username) {
        List<SysFunction> functionList = getFunctionsByUsername(username);
        Set<String> result = new HashSet<>();
        for (SysFunction function : functionList) {
            result.add(function.getCode());
        }
        return result;
    }

    // 通过用户名获取该用户拥有的所有功能
    public List<SysFunction> getFunctionsByUsername(String username) {
        if (roleService.isAdmin(username)) // 具有特殊角色admin时直接获取所有权限
            return functionDao.getAllFunctions();
        else
            return functionDao.getFunctionsByUsername(username);
    }

    /**
     * 通过用户名获取该用户的功能，并构建成一棵二级的菜单树
     * @param username 用户名
     * @param all 是否获取全部功能（功能管理时如此）
     * @return 二级的菜单树
     */
    public List<Category> getFunctionTree(String username, boolean all) {
        List<Category> categoryList = new ArrayList<>();
        List<SysFunction> functionList;
        if (all)
            functionList = functionDao.getAllFunctions();
        else
            functionList = getFunctionsByUsername(username);
        // list中添加category
        for (SysFunction function : functionList) {
            if (function.getType() == 0) {
                categoryList.add(new Category(function));
            }
        }
        // category中添加function
        for (Category category : categoryList) {
            for (SysFunction function : functionList) {
                if (category.getId().equals(function.getParentId())) {
                    category.functionList.add(new Function(function));
                }
            }
        }
        // 重新排序
        categoryList.sort(Comparator.comparingInt((Category c) -> c.index));
        for (Category category : categoryList) {
            category.functionList.sort(Comparator.comparingInt((Function f) -> f.index));
        }
        return categoryList;
    }

    public class Category {
        private String id;
        private String name;
        private int index;
        private String code;

        private List<Function> functionList;

        public Category(SysFunction function) {
            id = function.getId();
            name = function.getName();
            index = function.getIndex_();
            code = function.getCode();
            functionList = new ArrayList<>();
        }

        public String getId() {
            return id;
        }

        public void setId(String id) {
            this.id = id;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public int getIndex() {
            return index;
        }

        public void setIndex(int index) {
            this.index = index;
        }

        public List<Function> getFunctionList() {
            return functionList;
        }

        public void setFunctionList(List<Function> functionList) {
            this.functionList = functionList;
        }

        public String getCode() {
            return code;
        }

        public void setCode(String code) {
            this.code = code;
        }
    }

    public class Function {
        private String id;
        private String name;
        private String url;
        private String parentId;
        private int index;
        private String code;

        public Function(SysFunction function) {
            id = function.getId();
            name = function.getName();
            url = function.getUrl();
            parentId = function.getParentId();
            index = function.getIndex_();
            code = function.getCode();
        }

        public String getId() {
            return id;
        }

        public void setId(String id) {
            this.id = id;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getUrl() {
            return url;
        }

        public void setUrl(String url) {
            this.url = url;
        }

        public String getParentId() {
            return parentId;
        }

        public void setParentId(String parentId) {
            this.parentId = parentId;
        }

        public int getIndex() {
            return index;
        }

        public void setIndex(int index) {
            this.index = index;
        }

        public String getCode() {
            return code;
        }

        public void setCode(String code) {
            this.code = code;
        }
    }
}
