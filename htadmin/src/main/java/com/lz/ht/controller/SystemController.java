package com.lz.ht.controller;

import com.lz.ht.base.BaseController;
import com.lz.ht.model.Resources;
import com.lz.ht.service.*;
import com.lz.ht.util.MD5Util;
import com.lz.ht.util.ToolKit;
import lombok.extern.slf4j.Slf4j;
///import org.apache.shiro.SecurityUtils;
//import org.apache.shiro.subject.Subject;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 *
 *
 * @author Administrator
 */
@Slf4j
@Controller
@RequestMapping(value = "/")
public class SystemController extends BaseController {

    @Autowired
    private UserService userService;
    @Autowired
    private UserRoleService userRoleService;
    @Autowired
    private ResourcesService resourcesService;
    @Autowired
    private RoleResourcesService roleResourcesService;




    private static final long PAGE_SIZE = 10L ;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String defaultLogin() {
        return "login/login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String mainIndex(@RequestParam("userName") String userName, @RequestParam("password") String password,Model model){
        String md5Pass = MD5Util.getMD5(password);
        System.out.println(md5Pass);
        String loginRet = login(userName, md5Pass);
        //int num = 1/0 ;
        if("登录成功".equals(loginRet)){
            //获取菜单
            List<Map<String, Object>> menuList = getMenuList();
            model.addAttribute("modulesList",menuList);
            return "main/mainIndex";
        }else {
            model.addAttribute("loginRet",loginRet);
            return "login/login";
        }

    }


    private List<Map<String,Object>> getMenuList(){
        List<Resources> allResources = resourcesService.findAll();
        List<Map<String,Object>> modules = new ArrayList<>();
        allResources.stream().forEach(r -> {
            Long presKey = r.getPresKey();
            if(presKey.intValue() == 0 ){// 模块名称
                try {
                    HashMap<String, Object> map = ToolKit.javaBeanToMap(r);
                    modules.add(map);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
        modules.stream().forEach(map->{
            String resKey = map.get("resKey").toString();
            List<Resources> subMenu = new ArrayList<>();
            for (Resources r : allResources) {
                String presKey = r.getPresKey().toString();
                if(presKey!=null && presKey.equals(resKey)){
                    subMenu.add(r);
                }
            }
            map.put("subMenu",subMenu);
        });
        return modules;
    }
    private String login(String userName,String password) {
        // 从SecurityUtils里边创建一个 subject
        Subject subject = SecurityUtils.getSubject();
        // 在认证提交前准备 token（令牌）
        UsernamePasswordToken token = new UsernamePasswordToken(userName, password);
        // 执行认证登陆
        try {
            subject.login(token);
        } catch (UnknownAccountException uae) {
            return "未知账户";
        } catch (IncorrectCredentialsException ice) {
            return "密码不正确";
        } catch (LockedAccountException lae) {
            return "账户已锁定";
        } catch (ExcessiveAttemptsException eae) {
            return "用户名或密码错误次数过多";
        } catch (AuthenticationException ae) {
            return "用户名或密码不正确！";
        }
        if (subject.isAuthenticated()) {
            return "登录成功";
        } else {
            token.clear();
            return "登录失败";
        }
    }



}
