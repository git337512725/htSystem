package com.lz.ht.controller;

import com.lz.ht.result.Result;
import com.lz.ht.model.Role;
import com.lz.ht.page.PageModel;
import com.lz.ht.result.Result;
import com.lz.ht.service.RoleService;
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
public class RoleController extends BaseController{

    @Autowired
    private RoleService roleServiceImpl;


    @RequestMapping(value = "/role/list",method = {RequestMethod.GET})
    public String role_list()throws Exception{
        return "role/role_list";
    }



    @RequestMapping(value = "/role/list",method = {RequestMethod.POST})
    @ResponseBody
    public PageModel list(Role role, PageModel<Role> page)throws Exception{
           page.init();
           List<Role> list = roleServiceImpl.findPageList(page,role);
           long count = roleServiceImpl.findCount(role);
           page.packData(count,list);
           return page;
    }

    @RequestMapping(value = "/role/add",method = {RequestMethod.GET})
    public String addInit(Role role,Model model){
        return "role/role_add";
    }

    @RequestMapping(value = "/role/add",method = {RequestMethod.POST})
    @ResponseBody
    public Result add(Role role){
        roleServiceImpl.add(role);
        return Result.genSuccessResult();
    }

    @RequestMapping(value = "/role/update",method = {RequestMethod.GET})
    public String updateInit(Role role,Model model){
        role = roleServiceImpl.findById(role.getId());
        model.addAttribute("role",role);
        return "role/role_update";
    }

    @RequestMapping(value = "/role/update",method = {RequestMethod.POST})
    @ResponseBody
    public Result update(Role role){
        roleServiceImpl.updateById(role);
        return Result.genSuccessResult();
    }

    @RequestMapping(value = "/role/delete",method = {RequestMethod.POST})
    @ResponseBody
    public Result delete(Role role){
        roleServiceImpl.deleteById(role.getId());
        return Result.genSuccessResult();
    }
}
