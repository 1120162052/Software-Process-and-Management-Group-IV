package team.abc.ssm.modules.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.abc.ssm.modules.sys.dao.PermissionDao;
import team.abc.ssm.modules.sys.entity.Permission;

import java.util.*;

@Service
public class PermissionService {

    @Autowired
    private PermissionDao permissionDao;

    @Autowired
    private RoleService roleService;

    // 通过用户名获取该用户拥有的所有权限
    public Set<String> get1(String username) {
        List<Permission> permissionList = get2(username);
        Set<String> result = new HashSet<>();
        for (Permission permission : permissionList) {
            result.add(permission.getCode());
        }
        return result;
    }

    // 通过用户名获取该用户拥有的所有权限
    public List<Permission> get2(String username) {
        if (roleService.isAdmin(username)) // 具有特殊角色admin时直接获取所有权限
            return permissionDao.get2();
        else
            return permissionDao.get1(username);
    }

    // 通过用户名获取该用户的权限，并构建成一棵二级的菜单树
    public List<Category> get3(String username) {
        List<Category> categoryList = new ArrayList<>();
        List<Permission> permissionList = get2(username);
        // list中添加category
        for (Permission permission : permissionList) {
            if (permission.getType() == 0) {
                categoryList.add(new Category(permission));
            }
        }
        // category中添加function
        for (Category category : categoryList) {
            for (Permission permission : permissionList) {
                if (category.getId().equals(permission.getParentId())) {
                    category.functionList.add(new Function(permission));
                }
            }
        }
        // 重新排序
        categoryList.sort((Category c1, Category c2) -> (c1.index - c2.index));
        for (Category category : categoryList) {
            category.functionList.sort((Function f1, Function f2) -> (f1.index - f2.index));
        }
        return categoryList;
    }

    public class Category {
        private String id;
        private String name;
        private int index;

        private List<Function> functionList;

        public Category(Permission permission) {
            id = permission.getId();
            name = permission.getName();
            index = permission.getIndex_();
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
    }

    public class Function {
        private String id;
        private String name;
        private String url;
        private String parentId;
        private int index;

        public Function(Permission permission) {
            id = permission.getId();
            name = permission.getName();
            url = permission.getUrl();
            parentId = permission.getParentId();
            index = permission.getIndex_();
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
    }
}
