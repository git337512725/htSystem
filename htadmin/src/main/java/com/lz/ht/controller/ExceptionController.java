package com.lz.ht.controller;

import com.lz.ht.result.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author Administrator
 */
@Slf4j
@Controller
@RequestMapping("/error")
public class ExceptionController  implements ErrorController {

    @RequestMapping("/noToken")
    @ResponseBody
    public Result noToken(){
        return Result.genNoTokenResult();
    }

    @Override
    public String getErrorPath() {
        return "error/error";
    }
}
