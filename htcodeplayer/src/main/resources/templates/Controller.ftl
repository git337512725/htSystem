package ${package_name}.controller;

import ${package_name}.result.Result;
import ${package_name}.util.JwtUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;

@Slf4j
@Controller
public class ${model_simple_name}Controller {

    @Autowired
    private I${model_simple_name}Service ${model_simple_name?uncap_first}ServiceImpl;

    @RequestMapping(value = "${list_url}")
    @ResponseBody
    public PageModel list(${model_simple_name} ${model_simple_name?uncap_first}, PageModel page){
           List<${model_simple_name}> list = ${model_simple_name?uncap_first}ServiceImpl.findPageList(page,${model_simple_name?uncap_first});
           long count = ${model_simple_name?uncap_first}ServiceImpl.findCount(${model_simple_name?uncap_first});
           PageModel<${model_simple_name}> pageModel = new PageModel<${model_simple_name}>(page.getCurrentPageNum(),count,list);
           return pageModel;
    }

    @RequestMapping(value = "${list_add}",method = {RequestMethod.GET})
    public void addInit(${model_simple_name} ${model_simple_name?uncap_first},Model model){
        return "${model_simple_name?uncap_first}/${model_simple_name?uncap_first}_list"
    }

    @RequestMapping(value = "${list_add}",method = {RequestMethod.POST})
    @ResponseBody
    public Result add(${model_simple_name} ${model_simple_name?uncap_first}){
        ${model_simple_name?uncap_first}ServiceImpl.add(${model_simple_name?uncap_first});
        return Result.genSuccessResult();
    }

    @RequestMapping(value = "${list_update}",method = {RequestMethod.GET})
    public void updateInit(${model_simple_name} ${model_simple_name?uncap_first},Model model){
        return "${model_simple_name?uncap_first}/${model_simple_name?uncap_first}_list"
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
