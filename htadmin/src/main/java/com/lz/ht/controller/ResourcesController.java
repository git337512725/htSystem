package com.lz.ht.controller;

import com.lz.ht.result.Result;
import com.lz.ht.model.Resources;
import com.lz.ht.page.PageModel;
import com.lz.ht.result.Result;
import com.lz.ht.service.ResourcesService;
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
public class ResourcesController extends BaseController{

    @Autowired
    private ResourcesService resourcesServiceImpl;


    @RequestMapping(value = "/resources/list",method = {RequestMethod.GET})
    public String resources_list()throws Exception{
        return "resources/resources_list";
    }



    @RequestMapping(value = "/resources/list",method = {RequestMethod.POST})
    @ResponseBody
    public PageModel list(Resources resources, PageModel<Resources> page)throws Exception{
           page.init();
           List<Resources> list = resourcesServiceImpl.findPageList(page,resources);
           long count = resourcesServiceImpl.findCount(resources);
           page.packData(count,list);
           return page;
    }

    @RequestMapping(value = "/resources/add",method = {RequestMethod.GET})
    public String addInit(Resources resources,Model model){
        return "resources/resources_add";
    }

    @RequestMapping(value = "/resources/add",method = {RequestMethod.POST})
    @ResponseBody
    public Result add(Resources resources){
        resourcesServiceImpl.add(resources);
        return Result.genSuccessResult();
    }

    @RequestMapping(value = "/resources/update",method = {RequestMethod.GET})
    public String updateInit(Resources resources,Model model){
        return "resources/resources_update";
    }

    @RequestMapping(value = "/resources/update",method = {RequestMethod.POST})
    @ResponseBody
    public Result update(Resources resources){
        resourcesServiceImpl.updateById(resources);
        return Result.genSuccessResult();
    }

    @RequestMapping(value = "/resources/delete",method = {RequestMethod.POST})
    @ResponseBody
    public Result delete(Resources resources){
        resourcesServiceImpl.deleteById(resources.getId());
        return Result.genSuccessResult();
    }
}
