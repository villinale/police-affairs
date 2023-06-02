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
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

@Controller
@RestController
@ResponseBody
@RequestMapping("/case")
public class CaseController {

    @Autowired
    private CaseMapper caseMapper;

    @PostMapping("/addCase")
    public Boolean addCase(@RequestBody Map<String, Object> requestBody) {
        String caseTitle = (String) requestBody.get("c_title");
        String caseDate = (String) requestBody.get("c_date");
        System.out.println(caseDate);
        String caseLocation = (String) requestBody.get("c_loc");
        String caseText = (String) requestBody.get("c_text");
        int caseLevel = (int) requestBody.get("c_level");
        int caseStatus = (int) requestBody.get("c_stat");

        Date sqlDate = null;
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date d = null;
        try {
            d = format.parse(caseDate);
        } catch (Exception e) {
            e.printStackTrace();
        }
        sqlDate = new java.sql.Date(d.getTime());
        // TODO:分配警局和警员
        // int stationNo = (int) requestBody.get("stationNo");
        // int officerNo = (int) requestBody.get("officerNo");
        Case c = new Case();
        c.setC_text(caseText);
        c.setC_title(caseTitle);
        c.setC_data(sqlDate);
        c.setC_level(caseLevel);
        c.setC_loc(caseLocation);
        c.setC_stat(caseStatus);
        c.setS_no(1);
        c.setO_no(1);
        System.out.println("addCase: " + c);
        int res = caseMapper.insert(c);
        if (res == 1)
            return true;
        return false;
    }
}
