package com.lz.ht.controller;

import com.lz.ht.result.Result;
import com.lz.ht.model.User;
import com.lz.ht.page.PageModel;
import com.lz.ht.result.Result;
import com.lz.ht.service.UserService;
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
public class UserController extends BaseController{

    @Autowired
    private UserService userServiceImpl;


    @RequestMapping(value = "/user/list",method = {RequestMethod.GET})
    public String user_list()throws Exception{
        return "user/user_list";
    }



    @RequestMapping(value = "/user/list",method = {RequestMethod.POST})
    @ResponseBody
    public PageModel list(User user, PageModel page)throws Exception{
           List<User> list = userServiceImpl.findPageList(page,user);
           long count = userServiceImpl.findCount(user);
           PageModel<User> pageModel = new PageModel<User>(page.getCurrentPageNum(),count,list);
           return pageModel;
    }

    @RequestMapping(value = "/user/add",method = {RequestMethod.GET})
    public String addInit(User user,Model model){
        return "user/user_list";
    }

    @RequestMapping(value = "/user/add",method = {RequestMethod.POST})
    @ResponseBody
    public Result add(User user){
        userServiceImpl.add(user);
        return Result.genSuccessResult();
    }

    @RequestMapping(value = "/user/update",method = {RequestMethod.GET})
    public String updateInit(User user,Model model){
        return "user/user_list";
    }

    @RequestMapping(value = "/user/update",method = {RequestMethod.POST})
    @ResponseBody
    public Result update(User user){
        userServiceImpl.updateById(user);
        return Result.genSuccessResult();
    }

    @RequestMapping(value = "/user/delete",method = {RequestMethod.POST})
    @ResponseBody
    public Result delete(User user){
        userServiceImpl.deleteById(user.getId().intValue());
        return Result.genSuccessResult();
    }
}
