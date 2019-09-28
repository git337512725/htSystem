package com.lz.ht.realm;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

/**
 * 这个类是参照JDBCRealm写的，主要是自定义了如何查询用户信息，如何查询用户的角色和权限，如何校验密码等逻辑
 * @author Administrator
 */
public class CustomRealm extends AuthorizingRealm {


    /***
     * <bean id="credentialsMatcher"
     *         class="org.apache.shiro.authc.credential.HashedCredentialsMatcher">
     *   		<!-- 加密方式 -->
     *         <property name="hashAlgorithmName" value="MD5" />
     *   		<!-- 加密次数 -->
     *         <property name="hashIterations" value="2" />
     *   		<!-- 存储散列后的密码是否为16进制 -->
     *         <property name="storedCredentialsHexEncoded" value="true" />
     * </bean>
     */

    //告诉shiro如何根据获取到的用户信息中的密码和盐值来校验密码
    {
        //设置用于匹配密码的CredentialsMatcher
        HashedCredentialsMatcher hashMatcher = new HashedCredentialsMatcher();
        //加密方式
        hashMatcher.setHashAlgorithmName(Sha256Hash.ALGORITHM_NAME);
        hashMatcher.setStoredCredentialsHexEncoded(false);
        //加密次数
        hashMatcher.setHashIterations(1024);
        this.setCredentialsMatcher(hashMatcher);
    }


    //定义如何获取用户的角色和权限的逻辑，给shiro做权限判断
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        //null usernames are invalid
//        if (principals == null) {
//            throw new AuthorizationException("PrincipalCollection method argument cannot be null.");
//        }
//        SysUserDto user = (SysUserDto) getAvailablePrincipal(principals);
//        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
//        System.out.println("获取角色信息：" + user.getRoleTips());
//        System.out.println("获取权限信息：" + user.getMenuCodes());
//        info.setRoles(user.getRoleTips());
//        info.setStringPermissions(user.getMenuCodes());
//        return info;
        return  null;
    }

    //定义如何获取用户信息的业务逻辑，给shiro做登录
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
//        UsernamePasswordToken upToken = (UsernamePasswordToken) token;
//        String username = upToken.getUsername();
//        // Null username is invalid
//        if (username == null) {
//            throw new AccountException("请输入用户名");
//        }
//        SysUserDto userDB = userService.findShiroUserByName(username);
//        if (userDB == null) {
//            throw new UnknownAccountException("用户不存在");
//        }
//        //查询用户的角色和权限存到SimpleAuthenticationInfo中，这样在其它地方
//        //SecurityUtils.getSubject().getPrincipal()就能拿出用户的所有信息，包括角色和权限
//        Set<String> roles = roleService.getRolesByUserId(userDB.getId());
//        Set<String> perms = menuService.getResourcesByUserId(userDB.getId());
////        userDB.getRoles().addAll(roles);
////        userDB.getPerms().addAll(perms);
//        userDB.setRoleTips(roles);
//        userDB.setMenuCodes(perms);
//        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(userDB, userDB.getPassword(), getName());
//        info.setCredentialsSalt(new MySimpleByteSource(SysConstant.PUBLIC_SALT));
//        return info;
        return null;
    }


    public static void main(String[] args) {

    }

}