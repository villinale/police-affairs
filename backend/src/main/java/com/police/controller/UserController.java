/*
 * @Author: yingxin wang
 * @Date: 2023-06-01 15:21:12
 * @LastEditors: yingxin wang
 * @LastEditTime: 2023-06-01 21:37:35
 * @Description: 请填写简介
 */
package com.police.controller;

import com.police.entity.User;
import org.springframework.web.bind.annotation.RequestMapping;

import com.police.mapper.UserMapper;
import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

@Controller
@RestController
@ResponseBody
@RequestMapping("/user")
public class UserController {

}
