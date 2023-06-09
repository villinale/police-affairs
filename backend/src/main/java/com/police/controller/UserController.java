/*
 * @Author: yingxin wang
 * @Date: 2023-06-02 08:06:43
 * @LastEditors: yingxin wang
 * @LastEditTime: 2023-06-08 23:54:01
 * @Description: 请填写简介
 */
package com.police.controller;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.police.entity.User;
import org.springframework.web.bind.annotation.RequestMapping;

import com.police.mapper.UserMapper;
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
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserMapper userMapper;

    @PostMapping("/login")
    public User login(@RequestBody Map<String, Object> requestBody) {
        String phone = (String) requestBody.get("phone");
        String psw = (String) requestBody.get("psw");
        User u = userMapper.searchByPhoneAndPsw(phone, psw);
        System.out.println("login:phone: " + phone + "psw: " + psw);
        if (u == null) {
            u = new User();
            u.setU_no(null);
            u.setU_name("null");
            u.setU_psw("null");
            u.setU_phone("null");
            u.setU_role("null");
            u.setU_sex("null");
        }
        return u;
    }

    @PostMapping("/updateUserInfo")
    public Boolean updateUserInfo(@RequestBody Map<String, Object> requestBody) {
        System.out.println("updateUserInfo: " + requestBody);
        try {
            Integer u_no = (Integer) requestBody.get("u_no");
            String u_name = (String) requestBody.get("u_name");
            String u_sex = (String) requestBody.get("u_sex");
            String u_phone = (String) requestBody.get("u_phone");

            UpdateWrapper<User> updateWrapper = new UpdateWrapper<>();
            updateWrapper.eq("u_no", u_no)
                    .set("u_name", u_name)
                    .set("u_sex", u_sex)
                    .set("u_phone", u_phone);
            userMapper.update(null, updateWrapper);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @PostMapping("/hasPhone")
    public Boolean hasPhone(@RequestParam(name = "phone") String phone) {
        System.out.println("hasPhone:phone: " + phone);
        List<User> u = userMapper.searchByPhone(phone);
        System.out.println(u);
        if (!u.isEmpty())
            return true;
        return false;
    }

    @PostMapping("/register")
    public Boolean register(@RequestBody Map<String, Object> requestBody) {
        String phone = (String) requestBody.get("phone");
        String psw = (String) requestBody.get("psw");
        String name = (String) requestBody.get("name");
        System.out.println("register:phone: " + phone + "psw: " + psw + "name: " + name);
        User user = new User();
        user.setU_name(name);
        user.setU_phone(phone);
        user.setU_psw(psw);
        user.setU_role("用户");
        user.setU_sex("男");
        try {
            userMapper.insert(user);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @GetMapping("/getUserInfoById/{id}")
    public User getUserInfoById(@PathVariable Integer id) {// 根据用户id查找用户信息
        User u = userMapper.selectById(id);
        return u;
    }
}
