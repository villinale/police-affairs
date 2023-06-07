package com.police.controller;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.police.entity.Case;
import com.police.entity.response_type.StationStatistics;
import com.police.entity.response_type.UserStatistics;

import org.springframework.web.bind.annotation.RequestMapping;

import com.police.mapper.CaseMapper;
import com.police.mapper.OfficerMapper;

import freemarker.core.ParseException;

import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import java.util.Collections;
import java.util.Comparator;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.sql.Timestamp;
import java.sql.Date;

@Controller
@RestController
@ResponseBody
@RequestMapping("/case")
public class CaseController {

    @Autowired
    private CaseMapper caseMapper;

    @Autowired
    private OfficerMapper officerMapper;

    @PostMapping("/addCase")
    public Boolean addCase(@RequestBody Map<String, Object> requestBody) {
        String c_Title = (String) requestBody.get("c_title");
        String c_Text = (String) requestBody.get("c_text");
        String c_Date = (String) requestBody.get("c_date");
        int levelint = (int) requestBody.get("c_level");
        String c_level = (levelint == 0) ? "轻微" : "一般";
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

        LocalDateTime dateTime = LocalDateTime.parse(c_Date, inputFormatter);

        // TODO:分配警局和警员
        // int stationNo = (int) requestBody.get("stationNo");
        // int officerNo = (int) requestBody.get("officerNo");
        Case c = new Case();
        c.setC_text(c_Text);
        c.setC_title(c_Title);
        c.setC_startdate(dateTime);
        c.setC_enddate(dateTime);
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

    // 该用户是警官，返回警官负责的案件
    // 该用户是其他用户，返回该用户的案件
    @GetMapping("/getUserCasesByUId/{uid}/{isOfficer}")
    public List<Case> getUserCasesByUId(@PathVariable Integer uid, @PathVariable boolean isOfficer) {
        System.out.println("getUserCasesByUId: " + uid + " " + isOfficer);
        if (isOfficer) {
            List<Case> res = caseMapper.getOfficerCasesByUId(uid);
            return res;
        }

        List<Case> res = caseMapper.getUserCasesByUId(uid);
        return res;
    }

    @GetMapping("/getAllCases")
    public List<Case> getAllCases() {
        System.out.println("getAllCases");
        List<Case> res = caseMapper.getAllCases();
        return res;
    }

    @GetMapping("/getCasesByCId/{cid}")
    public Case getCasesByCId(@PathVariable Integer cid) {
        System.out.println("getCasesByCId: " + cid);
        Case res = caseMapper.getCasesByCId(cid);
        return res;
    }

    private List<Map<String, Object>> fillCaseNumber(List<Map<String, Object>> days) {
        LocalDate endDate = LocalDate.now();
        LocalDate startDate = endDate.minusDays(6);

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate currentDatel = startDate;
        while (!currentDatel.isAfter(endDate)) {
            Date currentDate = Date.valueOf(currentDatel);

            boolean found = false;
            for (Map<String, Object> map : days) {
                Date mapKey = (Date) map.get("key");
                if (currentDate.equals(mapKey)) {
                    found = true;
                    break;
                }
            }
            if (!found) {
                Map<String, Object> newMap = Map.of("value", 0, "key", currentDate);
                days.add(newMap);
            }

            currentDatel = currentDatel.plusDays(1);
        }
        return days;
    }

    public static void sortByDate(List<Map<String, Object>> list) {
        Collections.sort(list, new Comparator<Map<String, Object>>() {
            @Override
            public int compare(Map<String, Object> map1, Map<String, Object> map2) {
                Date date1 = (Date) map1.get("key");
                Date date2 = (Date) map2.get("key");
                return date1.compareTo(date2);
            }
        });
    }

    @GetMapping("/getStatisticsBySNo/{s_no}")
    public StationStatistics getStatisticsBySNo(@PathVariable int s_no) {
        System.out.println("getStatisticsBySNo: " + s_no);
        StationStatistics s = caseMapper.getStationStatisticsBySNo(s_no);

        List<Map<String, Object>> dailyNewCases = caseMapper.getStationDailyNewCasesBySNo(s_no);
        fillCaseNumber(dailyNewCases);
        sortByDate(dailyNewCases);

        List<Map<String, Object>> dailyClosedCases = caseMapper.getStationDailyClosedCasesBySNo(s_no);
        fillCaseNumber(dailyClosedCases);
        sortByDate(dailyClosedCases);

        s.setDailyNewCases(dailyNewCases);
        s.setDailyClosedCases(dailyClosedCases);
        return s;
    }

    @GetMapping("/getStatisticsByUNo/{u_no}/{isOfficer}")
    public UserStatistics getStatisticsByUNo(@PathVariable int u_no, @PathVariable boolean isOfficer) {
        System.out.println("getStatisticsByUNo: " + u_no + " " + isOfficer);
        if (!isOfficer) {
            UserStatistics s = caseMapper.getUserStatisticsByUNo(u_no);

            List<Map<String, Object>> dailyNewCases = caseMapper.getUserDailyNewCasesByUNo(u_no);
            fillCaseNumber(dailyNewCases);
            sortByDate(dailyNewCases);

            List<Map<String, Object>> dailyClosedCases = caseMapper.getUserDailyClosedCasesByUNo(u_no);
            fillCaseNumber(dailyClosedCases);
            sortByDate(dailyClosedCases);

            s.setDailyNewCases(dailyNewCases);
            s.setDailyClosedCases(dailyClosedCases);
            return s;
        }

        int o_no = officerMapper.getOfficerByUNo(u_no).getO_no();
        UserStatistics s = caseMapper.getOfficerStatisticsByONo(o_no);

        List<Map<String, Object>> dailyNewCases = caseMapper.getOfficerDailyNewCasesByONo(o_no);
        fillCaseNumber(dailyNewCases);
        sortByDate(dailyNewCases);

        List<Map<String, Object>> dailyClosedCases = caseMapper.getOfficerDailyClosedCasesByONo(o_no);
        fillCaseNumber(dailyClosedCases);
        sortByDate(dailyClosedCases);

        s.setDailyNewCases(dailyNewCases);
        s.setDailyClosedCases(dailyClosedCases);
        return s;
    }

    @PostMapping("/updateCaseInfo")
    public boolean updateCaseInfo(@RequestBody Map<String, Object> requestBody) {
        for (String key : requestBody.keySet()) {
            System.out.println(key + " " + requestBody.get(key));
        }

        try {
            int c_no = (int) requestBody.get("c_no");
            String c_title = (String) requestBody.get("c_title");
            String c_address = (String) requestBody.get("c_address");
            String c_level = (String) requestBody.get("c_level");
            String c_enddate = (String) requestBody.get("c_enddate");
            String c_stat = (String) requestBody.get("c_stat");
            int o_no = (int) requestBody.get("o_no");
            int s_no = (int) requestBody.get("s_no");

            LocalDateTime dateTime = null;
            if (c_enddate.contains("T")) {
                DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
                dateTime = LocalDateTime.parse(c_enddate, inputFormatter);
            } else {
                DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
                dateTime = LocalDateTime.parse(c_enddate, inputFormatter);
            }

            UpdateWrapper<Case> updateWrapper = new UpdateWrapper<>();
            updateWrapper.eq("c_no", c_no)
                    .set("c_title", c_title)
                    .set("c_address", c_address)
                    .set("c_level", c_level)
                    .set("c_enddate", dateTime)
                    .set("c_stat", c_stat)
                    .set("o_no", o_no)
                    .set("s_no", s_no);
            caseMapper.update(null, updateWrapper);

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @GetMapping("/getAllOpenClosedCases")
    public List<Case> getAllOpenClosedCases() {
        System.out.println("getAllOpenClosedCases: ");
        List<Case> res = caseMapper.getAllOpenClosedCases();
        return res;
    }
}
