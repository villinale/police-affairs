package com.police.controller;

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
        Station o = StationMapper.getStationBySNo(s_no);
        return o;
    }
}
