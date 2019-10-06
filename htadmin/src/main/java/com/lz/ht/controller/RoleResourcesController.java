package com.lz.ht.controller;

import com.lz.ht.result.Result;
import com.lz.ht.model.RoleResources;
import com.lz.ht.page.PageModel;
import com.lz.ht.result.Result;
import com.lz.ht.service.RoleResourcesService;
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
public class RoleResourcesController extends BaseController{

    @Autowired
    private RoleResourcesService roleResourcesServiceImpl;


    @RequestMapping(value = "/roleResources/list",method = {RequestMethod.GET})
    public String roleResources_list()throws Exception{
        return "user/user_list";
    }



    @RequestMapping(value = "/roleResources/list",method = {RequestMethod.POST})
    @ResponseBody
    public PageModel list(RoleResources roleResources, PageModel page)throws Exception{
           List<RoleResources> list = roleResourcesServiceImpl.findPageList(page,roleResources);
           long count = roleResourcesServiceImpl.findCount(roleResources);
           PageModel<RoleResources> pageModel = new PageModel<RoleResources>(page.getCurrentPageNum(),count,list);
           return pageModel;
    }

    @RequestMapping(value = "/roleResources/add",method = {RequestMethod.GET})
    public String addInit(RoleResources roleResources,Model model){
        return "roleResources/roleResources_list";
    }

    @RequestMapping(value = "/roleResources/add",method = {RequestMethod.POST})
    @ResponseBody
    public Result add(RoleResources roleResources){
        roleResourcesServiceImpl.add(roleResources);
        return Result.genSuccessResult();
    }

    @RequestMapping(value = "/roleResources/update",method = {RequestMethod.GET})
    public String updateInit(RoleResources roleResources,Model model){
        return "roleResources/roleResources_list";
    }

    @RequestMapping(value = "/roleResources/update",method = {RequestMethod.POST})
    @ResponseBody
    public Result update(RoleResources roleResources){
        roleResourcesServiceImpl.updateById(roleResources);
        return Result.genSuccessResult();
    }

    @RequestMapping(value = "/roleResources/delete",method = {RequestMethod.POST})
    @ResponseBody
    public Result delete(RoleResources roleResources){
        roleResourcesServiceImpl.deleteById(roleResources.getId().intValue());
        return Result.genSuccessResult();
    }
}
