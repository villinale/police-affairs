package com.police.controller;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.police.entity.Officer;
import com.police.entity.User;
import org.springframework.web.bind.annotation.RequestMapping;

import com.police.mapper.OfficerMapper;
import com.police.mapper.UserMapper;
import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RestController
@ResponseBody
@RequestMapping("/officer")
public class OfficerController {

    @Autowired
    private OfficerMapper officerMapper;
    @Autowired
    private UserMapper userMapper;

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

    @PostMapping("/updateOfficerInfo")
    public boolean updateOfficerInfo(@RequestBody Map<String, Object> requestBody) {
        for (String key : requestBody.keySet()) {
            System.out.println(key + " " + requestBody.get(key));
        }

        try {
            int o_no = (int) requestBody.get("o_no");
            int u_no = (int) requestBody.get("u_no");
            String u_name = (String) requestBody.get("u_name");
            String u_sex = (String) requestBody.get("u_sex");
            String u_phone = (String) requestBody.get("u_phone");
            String o_stat = (String) requestBody.get("o_stat");
            int s_no = (int) requestBody.get("s_no");

            UpdateWrapper<Officer> updateWrapper = new UpdateWrapper<>();
            updateWrapper.eq("o_no", o_no)
                    .set("o_stat", o_stat)
                    .set("s_no", s_no);
            officerMapper.update(null, updateWrapper);

            UpdateWrapper<User> updateWrapper2 = new UpdateWrapper<>();
            updateWrapper2.eq("u_no", u_no)
                    .set("u_name", u_name)
                    .set("u_sex", u_sex)
                    .set("u_phone", u_phone);
            userMapper.update(null, updateWrapper2);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @PostMapping("/addOfficer")
    public boolean addOfficer(@RequestBody Map<String, Object> requestBody) {
        try {
            String u_name = (String) requestBody.get("u_name");
            String u_sex = (String) requestBody.get("u_sex");
            String u_phone = (String) requestBody.get("u_phone");
            String o_stat = (String) requestBody.get("o_stat");
            int s_no = (int) requestBody.get("s_no");

            Officer officer = new Officer();
            User user = new User();

            user.setU_name(u_name);
            user.setU_phone(u_phone);
            user.setU_role("警员");
            user.setU_psw(u_phone);
            user.setU_sex(u_sex);

            userMapper.insert(user);

            int u_no2 = userMapper.searchByPhoneAndPsw(u_phone, u_phone).getU_no();

            officer.setO_stat(o_stat);
            officer.setU_no(u_no2);
            officer.setS_no(s_no);

            officerMapper.insert(officer);

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
