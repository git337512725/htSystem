package com.lz.ht.configuration;

import com.lz.ht.realm.CustomRealm;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.web.config.DefaultShiroFilterChainDefinition;
import org.apache.shiro.spring.web.config.ShiroFilterChainDefinition;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author Administrator
 */
@Configuration
public class shiroConfig {



    @Bean
    public CustomRealm customRealm() {
        CustomRealm realm = new CustomRealm();
        return realm;
    }

    /**
     * 为了保证实现了Shiro内部lifecycle函数的bean执行 也是shiro的生命周期，注入LifecycleBeanPostProcessor
     * @return
     */
    @Bean
    public LifecycleBeanPostProcessor lifecycleBeanPostProcessor() {
        return new LifecycleBeanPostProcessor();
    }

    /**
     * 配置安全管理器，SecurityManager是Shiro框架的核心，
     * 典型的Facade模式，Shiro通过SecurityManager来管理内部组件实例，并通过它来提供安全管理的各种服务。
     * @return
     */
    @Bean
    public DefaultWebSecurityManager securityManager() {
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        securityManager.setRealm(customRealm());
        return securityManager;
    }

    /**
     * 使用注解方式控制权限
     * @return
     */
    @Bean
    public ShiroFilterChainDefinition shiroFilterChainDefinition() {
        DefaultShiroFilterChainDefinition chain = new DefaultShiroFilterChainDefinition();
        //这里配置所有请求路径都可以匿名访问
        chain.addPathDefinition("/**", "anon");
        // 这另一种配置方式。但是还是用上面那种吧，容易理解一点。
        // chainDefinition.addPathDefinition("/**", "authcBasic[permissive]");
        return chain;
    }




}


/** 不可删
 *
 * 配置缩写                            对应的过滤器                                    功能
 * anon                          AnonymousFilter                            指定url可以匿名访问
 * authc                         FormAuthenticationFilter               指定url需要form表单登录，默认会从请求中获取username、password,rememberMe等参数并尝试登录，如果登录不了就会跳转到loginUrl配置的路径。我们也可以用这个过滤器做默认的登录逻辑，但是一般都是我们自己在控制器写登录逻辑的，自己写的话出错返回的信息都可以定制嘛。
 * authcBasic                 BasicHttpAuthenticationFilter        指定url需要basic登录
 * logout                        LogoutFilter                                   登出过滤器，配置指定url就可以实现退出功能，非常方便
 * noSessionCreation    NoSessionCreationFilter                 禁止创建会话
 * perms                        PermissionsAuthorizationFilter      需要指定权限才能访问
 * port                            PortFilter                                        需要指定端口才能访问
 * rest                            HttpMethodPermissionFilter          将http请求方法转化成相应的动词来构造一个权限字符串，这个感觉意义不大，有兴趣自己看源码的注释
 * roles                            RolesAuthorizationFilter               需要指定角色才能访问
 * ssl                                SslFilter                                        需要https请求才能访问
 * user                            UserFilter                                       需要已登录或“记住我”的用户才能访问
 *
 *
 * Shiro是一堆一堆的过滤链，所以要对shiro 的过滤进行设置，
 * @return
 */
//    @Bean
//    public ShiroFilterChainDefinition shiroFilterChainDefinition() {
//        DefaultShiroFilterChainDefinition chainDefinition = new DefaultShiroFilterChainDefinition();
//        chainDefinition.addPathDefinition("favicon.ico", "anon");
//        chainDefinition.addPathDefinition("/login", "anon");
//        chainDefinition.addPathDefinition("/**", "user");
//        return chainDefinition;
//    }


/** 不可删
 * setUsePrefix(false)用于解决一个奇怪的bug。在引入spring aop的情况下。
 * 在@Controller注解的类的方法中加入@RequiresRole等shiro注解，会导致该方法无法映射请求，
 * 导致返回404。加入这项配置能解决这个bug
 */
//    @Bean
//    @DependsOn("lifecycleBeanPostProcessor")
//    public static DefaultAdvisorAutoProxyCreator getDefaultAdvisorAutoProxyCreator(){
//        DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator=new DefaultAdvisorAutoProxyCreator();
//        defaultAdvisorAutoProxyCreator.setUsePrefix(true);
//        return defaultAdvisorAutoProxyCreator;
//    }



