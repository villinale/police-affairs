package com.police.controller;

import com.police.entity.Case;
import org.springframework.web.bind.annotation.RequestMapping;

import com.police.mapper.CaseMapper;

import freemarker.core.ParseException;

import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.sql.Timestamp;

@Controller
@RestController
@ResponseBody
@RequestMapping("/case")
public class CaseController {

    @Autowired
    private CaseMapper caseMapper;

    @PostMapping("/addCase")
    public Boolean addCase(@RequestBody Map<String, Object> requestBody) {
        String c_Title = (String) requestBody.get("c_title");
        String c_Text = (String) requestBody.get("c_text");
        String c_Date = (String) requestBody.get("c_date");
        int c_level = (int) requestBody.get("c_level");
        String c_province = (String) requestBody.get("c_province");
        String c_city = (String) requestBody.get("c_city");
        String c_area = (String) requestBody.get("c_area");
        String c_address = (String) requestBody.get("c_address");
        double c_lon = (double) requestBody.get("c_lon");
        double c_lat = (double) requestBody.get("c_lat");
        // Stirng c_stat = '未处理';
        int u_no = (int) requestBody.get("u_no");

        // 时间格式转换 原格式："2023-06-10T16:26" 转换后："2023-06-10 16:26"
        DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");

        LocalDateTime dateTime = LocalDateTime.parse(c_Date, inputFormatter);

        // TODO:分配警局和警员
        // int stationNo = (int) requestBody.get("stationNo");
        // int officerNo = (int) requestBody.get("officerNo");
        Case c = new Case();
        c.setC_text(c_Text);
        c.setC_title(c_Title);
        c.setC_date(dateTime);
        c.setC_level(c_level);
        c.setC_province(c_province);
        c.setC_city(c_city);
        c.setC_area(c_area);
        c.setC_address(c_address);
        c.setC_lon(c_lon);
        c.setC_lat(c_lat);
        c.setC_stat("待分配");// TODO:分配警员后需要修改
        c.setC_isPublic(false);
        c.setS_no(1);
        c.setO_no(1);
        c.setU_no(u_no);
        System.out.println("addCase: " + c);
        int res = caseMapper.insert(c);
        if (res == 1)
            return true;
        return false;
    }
}
