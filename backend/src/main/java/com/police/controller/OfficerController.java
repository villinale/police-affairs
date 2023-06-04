package com.police.controller;

import com.police.entity.Officer;
import org.springframework.web.bind.annotation.RequestMapping;

import com.police.mapper.OfficerMapper;
import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RestController
@ResponseBody
@RequestMapping("/officer")
public class OfficerController {

    @Autowired
    private OfficerMapper officerMapper;

    @GetMapping("/getAllOfficers")
    public List<Officer> getAllOfficers() {// 根据用户id查找用户信息
        List<Officer> o = officerMapper.getAllOfficers();
        return o;
    }

    @GetMapping("/getOfficerByNo")
    public Officer getOfficerByNo(@RequestParam("o_no") int o_no) {// 根据用户id查找用户信息
        Officer o = officerMapper.getOfficerByONo(o_no);
        return o;
    }
}
