package com.lz.ht.controller;

import com.lz.ht.code.JdbcUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.sql.SQLException;
import java.util.List;

@Controller
public class CodePlayerController {



    @RequestMapping(value = "/codePlayer",method = {RequestMethod.GET})
    public String codePlayerInit(Model model) throws SQLException {
        List<String> allTables = JdbcUtil.findAllTables("myboot");
        model.addAttribute("allTables",allTables);
        return "codeplayer/play";
    }






}
