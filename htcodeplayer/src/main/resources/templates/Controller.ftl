package ${package_name}.controller;

import ${package_name}.result.Result;
import ${package_name}.model.${model_simple_name};
import ${package_name}.page.PageModel;
import ${package_name}.result.Result;
import ${package_name}.service.${model_simple_name}Service;
import ${package_name}.util.JwtUtil;
import ${package_name}.base.BaseController;
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
public class ${model_simple_name}Controller extends BaseController{

    @Autowired
    private ${model_simple_name}Service ${model_simple_name?uncap_first}ServiceImpl;


    @RequestMapping(value = "${list_url}",method = {RequestMethod.GET})
    public String ${model_simple_name?uncap_first}_list()throws Exception{
        return "${model_simple_name?uncap_first}/${model_simple_name?uncap_first}_list";
    }



    @RequestMapping(value = "${list_url}",method = {RequestMethod.POST})
    @ResponseBody
    public PageModel list(${model_simple_name} ${model_simple_name?uncap_first}, PageModel<${model_simple_name}> page)throws Exception{
           page.init();
           List<${model_simple_name}> list = ${model_simple_name?uncap_first}ServiceImpl.findPageList(page,${model_simple_name?uncap_first});
           long count = ${model_simple_name?uncap_first}ServiceImpl.findCount(${model_simple_name?uncap_first});
           page.packData(count,list);
           return page;
    }

    @RequestMapping(value = "${list_add}",method = {RequestMethod.GET})
    public String addInit(${model_simple_name} ${model_simple_name?uncap_first},Model model){
        return "${model_simple_name?uncap_first}/${model_simple_name?uncap_first}_add";
    }

    @RequestMapping(value = "${list_add}",method = {RequestMethod.POST})
    @ResponseBody
    public Result add(${model_simple_name} ${model_simple_name?uncap_first}){
        ${model_simple_name?uncap_first}ServiceImpl.add(${model_simple_name?uncap_first});
        return Result.genSuccessResult();
    }

    @RequestMapping(value = "${list_update}",method = {RequestMethod.GET})
    public String updateInit(${model_simple_name} ${model_simple_name?uncap_first},Model model){
        ${model_simple_name?uncap_first} = ${model_simple_name?uncap_first}ServiceImpl.findById(${model_simple_name?uncap_first}.getId());
        model.addAttribute("${model_simple_name?uncap_first}",${model_simple_name?uncap_first});
        return "${model_simple_name?uncap_first}/${model_simple_name?uncap_first}_update";
    }

    @RequestMapping(value = "${list_update}",method = {RequestMethod.POST})
    @ResponseBody
    public Result update(${model_simple_name} ${model_simple_name?uncap_first}){
        ${model_simple_name?uncap_first}ServiceImpl.updateById(${model_simple_name?uncap_first});
        return Result.genSuccessResult();
    }

    @RequestMapping(value = "${list_delete}",method = {RequestMethod.POST})
    @ResponseBody
    public Result delete(${model_simple_name} ${model_simple_name?uncap_first}){
        ${model_simple_name?uncap_first}ServiceImpl.deleteById(${model_simple_name?uncap_first}.getId());
        return Result.genSuccessResult();
    }
}
