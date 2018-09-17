package cn.com.realm;

import cn.com.service.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import cn.com.entity.User;
import cn.com.dao.UserMapper;

public class UserRealm extends AuthorizingRealm
{
    @Autowired
    private UserService userService;

    String pass;

    /**
     * 授权:
     * 
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(
            PrincipalCollection principalCollection)
    {
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        User user =(User)principalCollection.getPrimaryPrincipal();// 获取登录的用户名
        // 两个if根据判断赋予登录用户权限
        if ("common".equals(user.getRole()))
        {
            info.addRole("common");
        }
        if ("manager".equals(user.getRole()))
        {
            info.addRole("manager");
        }
        return info;
    }
    /*
     * 用户验证
     * 
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(
            AuthenticationToken token) throws AuthenticationException
    {
        // 1. token 中获取登录的 username! 注意不需要获取password.
          Object principal = token.getPrincipal();
        // 2. 利用 username 查询数据库得到用户的信息.
        User user = userService.selectByUserName((String) principal);
        if( user==null ){
            //未知用户
            throw  new UnknownAccountException();
        }
        if(user!=null&& "0".equals(user.getStatus())){
            //未激活
            throw  new LockedAccountException();
        }
        if(user != null && ("2".equals(user.getStatus()) )){
            //被禁用
            throw new DisabledAccountException();
        }
        String credentials = user.getPassword();
        String salt = user.getSalt();
        // 3.设置盐值 ，（加密的调料，让加密出来的东西更具安全性，一般是通过数据库查询出来的。
        // 简单的说，就是把密码根据特定的东西而进行动态加密，如果别人不知道你的盐值，就解不出你的密码）
        ByteSource credentialsSalt = ByteSource.Util.bytes(salt);
        // 当前 Realm 的name
        String realmName = getName();
        // 返回值实例化
        SimplePrincipalCollection s=new SimplePrincipalCollection();
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user,
                credentials, credentialsSalt, realmName);
        return info;
    }

    // init-method 配置.
//    public void setCredentialMatcher()
//    {
//        HashedCredentialsMatcher credentialsMatcher = new HashedCredentialsMatcher();
//        credentialsMatcher.setHashAlgorithmName("MD5");// MD5算法加密
//        credentialsMatcher.setHashIterations(1024);// 1024次循环加密
//        setCredentialsMatcher(credentialsMatcher);
//    }

    // 用来测试的算出密码password盐值加密后的结果，下面方法用于新增用户添加到数据库操作的，我这里就直接用main获得，直接数据库添加了，省时间
//    public static void main(String[] args)
//    {
//        long timestamp = System.currentTimeMillis();
//        System.out.println(timestamp);
//        String hashAlgorithmName = "MD5";
//        String credentials = "ck58734366";
//        ByteSource salt1 = ByteSource.Util
//                .bytes("chendong" + "ck58734366" + timestamp);
//        ByteSource salt = ByteSource.Util.bytes(salt1.toString());
//        System.out.println(salt1);
//        int hashIterations = 1024;
//        Object result = new SimpleHash(hashAlgorithmName, credentials, salt,
//                hashIterations);
//        System.out.println(result);
//    }

}