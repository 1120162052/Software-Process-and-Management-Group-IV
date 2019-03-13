package team.abc.ssm.common.shiro;

import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import team.abc.ssm.modules.sys.service.SysFunctionService;
import team.abc.ssm.modules.sys.service.SysRoleService;
import team.abc.ssm.modules.sys.service.SysUserService;

import java.util.Set;

public class SystemAuthorizingRealm extends AuthorizingRealm {

    @Autowired
    private SysUserService userService;
    @Autowired
    private SysRoleService roleService;
    @Autowired
    private SysFunctionService functionService;

    // 用户角色、权限验证（用户已经登陆）
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        // 获取当前登陆用户的username
        String username = (String) principalCollection.getPrimaryPrincipal();
        // 首先根据username获取userID，然后获取角色和功能信息
        Set<String> roles = roleService.getRolesByUsername(username);
        Set<String> permissions = functionService.getFunctionSetByUsername(username);
        roles.removeIf(str -> str == null || str.length() == 0);
        permissions.removeIf(str -> str == null || str.length() == 0);
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.setRoles(roles);
        info.setStringPermissions(permissions);
        return info;
    }

    // 用户登陆验证
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        // 获取客户端提供的用户名和密码
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        String username = token.getUsername();
        String password = new String(token.getPassword());
        // 根据用户名获取数据库中正确的密码
        String passwordInDB = userService.getUserByUsername(username).getPassword();
        // 账号不存在或密码错误
        if (passwordInDB == null || !passwordInDB.equals(password)) {
            throw new AuthenticationException();
        }
        // 认证信息中存放账号密码，getName()是继承自父类的方法，返回当前的类名
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(username, password, getName());
        return info;
    }
}
