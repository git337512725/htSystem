package com.lz.ht.controller;

import com.lz.ht.result.Result;
import com.lz.ht.model.SysConfig;
import com.lz.ht.page.PageModel;
import com.lz.ht.result.Result;
import com.lz.ht.service.SysConfigService;
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
public class SysConfigController extends BaseController{

    @Autowired
    private SysConfigService sysConfigServiceImpl;


    @RequestMapping(value = "/sysConfig/list",method = {RequestMethod.GET})
    public String sysConfig_list()throws Exception{
        return "user/user_list";
    }



    @RequestMapping(value = "/sysConfig/list",method = {RequestMethod.POST})
    @ResponseBody
    public PageModel list(SysConfig sysConfig, PageModel page)throws Exception{
           List<SysConfig> list = sysConfigServiceImpl.findPageList(page,sysConfig);
           long count = sysConfigServiceImpl.findCount(sysConfig);
           PageModel<SysConfig> pageModel = new PageModel<SysConfig>(page.getCurrentPageNum(),count,list);
           return pageModel;
    }

    @RequestMapping(value = "/sysConfig/add",method = {RequestMethod.GET})
    public String addInit(SysConfig sysConfig,Model model){
        return "sysConfig/sysConfig_list";
    }

    @RequestMapping(value = "/sysConfig/add",method = {RequestMethod.POST})
    @ResponseBody
    public Result add(SysConfig sysConfig){
        sysConfigServiceImpl.add(sysConfig);
        return Result.genSuccessResult();
    }

    @RequestMapping(value = "/sysConfig/update",method = {RequestMethod.GET})
    public String updateInit(SysConfig sysConfig,Model model){
        return "sysConfig/sysConfig_list";
    }

    @RequestMapping(value = "/sysConfig/update",method = {RequestMethod.POST})
    @ResponseBody
    public Result update(SysConfig sysConfig){
        sysConfigServiceImpl.updateById(sysConfig);
        return Result.genSuccessResult();
    }

    @RequestMapping(value = "/sysConfig/delete",method = {RequestMethod.POST})
    @ResponseBody
    public Result delete(SysConfig sysConfig){
        sysConfigServiceImpl.deleteById(sysConfig.getId().intValue());
        return Result.genSuccessResult();
    }
}
