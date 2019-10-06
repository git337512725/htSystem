package com.lz.ht.controller;

import com.lz.ht.result.Result;
import com.lz.ht.model.Dept;
import com.lz.ht.page.PageModel;
import com.lz.ht.result.Result;
import com.lz.ht.service.DeptService;
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
public class DeptController extends BaseController{

    @Autowired
    private DeptService deptServiceImpl;


    @RequestMapping(value = "/dept/list",method = {RequestMethod.GET})
    public String dept_list()throws Exception{
        return "user/user_list";
    }



    @RequestMapping(value = "/dept/list",method = {RequestMethod.POST})
    @ResponseBody
    public PageModel list(Dept dept, PageModel page)throws Exception{
           List<Dept> list = deptServiceImpl.findPageList(page,dept);
           long count = deptServiceImpl.findCount(dept);
           PageModel<Dept> pageModel = new PageModel<Dept>(page.getCurrentPageNum(),count,list);
           return pageModel;
    }

    @RequestMapping(value = "/dept/add",method = {RequestMethod.GET})
    public String addInit(Dept dept,Model model){
        return "dept/dept_list";
    }

    @RequestMapping(value = "/dept/add",method = {RequestMethod.POST})
    @ResponseBody
    public Result add(Dept dept){
        deptServiceImpl.add(dept);
        return Result.genSuccessResult();
    }

    @RequestMapping(value = "/dept/update",method = {RequestMethod.GET})
    public String updateInit(Dept dept,Model model){
        return "dept/dept_list";
    }

    @RequestMapping(value = "/dept/update",method = {RequestMethod.POST})
    @ResponseBody
    public Result update(Dept dept){
        deptServiceImpl.updateById(dept);
        return Result.genSuccessResult();
    }

    @RequestMapping(value = "/dept/delete",method = {RequestMethod.POST})
    @ResponseBody
    public Result delete(Dept dept){
        deptServiceImpl.deleteById(dept.getId().intValue());
        return Result.genSuccessResult();
    }
}
