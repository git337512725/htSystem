package com.lz.ht.controller;

import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;

/**
 *
 *
 *
 * @author Administrator
 */
@Slf4j
@Controller
@RequestMapping(value = "/")
public class SystemController {


    private static final long PAGE_SIZE = 10L ;


    @RequestMapping( value = "/login",method = {RequestMethod.GET})
    public String login(){
        return "login/login";
    }


    @RequestMapping(value = "/login", method = {RequestMethod.POST})
    public String login(HttpServletResponse response, @RequestParam("username") String username, @RequestParam("password") String password, Model model) throws Exception {
//        Subject currentUser = SecurityUtils.getSubject();
//        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
//        //登录
//        currentUser.login(token);
//        SysUserDto principal = (SysUserDto)currentUser.getPrincipal();
//        log.info("",principal);
//        List<SysMenu> menus = menuService.findMenusByUserId(principal.getId());
//        List<SysMenuDto> menusList = getMenu(menus);
//        model.addAttribute("xtMenuList",menusList);
        return "mainIndex";
    }

//    private List<SysMenuDto> getMenu(List<SysMenu> menusList ){
//        List<SysMenuDto> list = new ArrayList<>(0);
//        Map<String,String> module = new HashMap<>();
//        //遍历所有有权限的菜单
//        for (SysMenu sysMenu : menusList) {
//            Integer pid = sysMenu.getPid();
//            if (pid == 0L) {
//                SysMenuDto xtMenu = new SysMenuDto();
//                xtMenu.setModuleName(sysMenu.getName());
//                BeanUtils.copyProperties(sysMenu,xtMenu);
//                list.add(xtMenu);
//            }
//        }
//        //将  系统管理 ：用户管理 这样的层级保存在sysMenuDto 中
//        for (SysMenuDto dto : list) {
//            for (SysMenu sysMenu : menusList) {
//                Integer levels = sysMenu.getLevels();
//                Integer pid = sysMenu.getPid();
//                if(pid ==  (dto.getId().intValue())){
//                    dto.getSubResoureList().add(sysMenu);
//                }
//            }
//        }
//        return list;
//    }


    @RequestMapping("/logout")
    public String logOut() {
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "login";
    }


}
