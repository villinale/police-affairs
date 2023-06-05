/*
 * @Author: yingxin wang
 * @Date: 2023-06-03 21:58:45
 * @LastEditors: yingxin wang
 * @LastEditTime: 2023-06-05 21:02:28
 * @Description: 请填写简介
 */
package com.police.controller;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.police.entity.Station;
import org.springframework.web.bind.annotation.RequestMapping;

import com.police.mapper.StationMapper;
import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

@Controller
@RestController
@ResponseBody
@RequestMapping("/station")
public class StationController {

    @Autowired
    private StationMapper StationMapper;

    @GetMapping("/getAllStations")
    public List<Station> getAllStations() {// 根据用户id查找用户信息
        List<Station> o = StationMapper.getAllStations();
        return o;
    }

    @GetMapping("/getStationByNo")
    public Station getStationByNo(@RequestParam("s_no") int s_no) {// 根据用户id查找用户信息
        System.out.println("getStationByNo" + s_no);
        Station o = StationMapper.getStationBySNo(s_no);
        return o;
    }

    @PostMapping("/updateStationInfo")
    public boolean updateStationInfo(@RequestBody Map<String, Object> requestBody) {
        for (String key : requestBody.keySet()) {
            System.out.println(key + " " + requestBody.get(key));
        }

        try {
            int s_no = (int) requestBody.get("s_no");
            String s_name = (String) requestBody.get("s_name");
            String s_phone = (String) requestBody.get("s_phone");
            double s_lon = (double) requestBody.get("s_lon");
            double s_lat = (double) requestBody.get("s_lat");
            String s_area = (String) requestBody.get("s_area");
            String s_address = (String) requestBody.get("s_address");

            UpdateWrapper<Station> updateWrapper = new UpdateWrapper<>();
            updateWrapper.eq("s_no", s_no)
                    .set("s_name", s_name)
                    .set("s_phone", s_phone)
                    .set("s_lon", s_lon)
                    .set("s_lat", s_lat)
                    .set("s_area", s_area)
                    .set("s_address", s_address);
            StationMapper.update(null, updateWrapper);

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
