package com.lz.ht.controller;

import com.lz.ht.result.Result;
import com.lz.ht.model.UserRole;
import com.lz.ht.page.PageModel;
import com.lz.ht.result.Result;
import com.lz.ht.service.UserRoleService;
import com.lz.ht.util.JwtUtil;
import com.lz.ht.base.BaseController;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;

@Slf4j
@Controller
public class UserRoleController extends BaseController{

    @Autowired
    private UserRoleService userRoleServiceImpl;


    @RequestMapping(value = "/userRole/list",method = {RequestMethod.GET})
    public String userRole_list()throws Exception{
        return "userRole/userRole_list";
    }



    @RequestMapping(value = "/userRole/list",method = {RequestMethod.POST})
    @ResponseBody
    public PageModel list(UserRole userRole, PageModel<UserRole> page)throws Exception{
           page.init();
           List<UserRole> list = userRoleServiceImpl.findPageList(page,userRole);
           long count = userRoleServiceImpl.findCount(userRole);
           page.packData(count,list);
           return page;
    }

    @RequestMapping(value = "/userRole/add",method = {RequestMethod.GET})
    public String addInit(UserRole userRole,Model model){
        return "userRole/userRole_add";
    }

    @RequestMapping(value = "/userRole/add",method = {RequestMethod.POST})
    @ResponseBody
    public Result add(UserRole userRole){
        userRoleServiceImpl.add(userRole);
        return Result.genSuccessResult();
    }

    @RequestMapping(value = "/userRole/update",method = {RequestMethod.GET})
    public String updateInit(UserRole userRole,Model model){
        return "userRole/userRole_update";
    }

    @RequestMapping(value = "/userRole/update",method = {RequestMethod.POST})
    @ResponseBody
    public Result update(UserRole userRole){
        userRoleServiceImpl.updateById(userRole);
        return Result.genSuccessResult();
    }

    @RequestMapping(value = "/userRole/delete",method = {RequestMethod.POST})
    @ResponseBody
    public Result delete(UserRole userRole){
        userRoleServiceImpl.deleteById(userRole.getId());
        return Result.genSuccessResult();
    }
}
