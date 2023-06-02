/*
 * @Author: yingxin wang
 * @Date: 2023-06-02 08:06:43
 * @LastEditors: yingxin wang
 * @LastEditTime: 2023-06-02 20:14:04
 * @Description: 请填写简介
 */
package com.police;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.scheduling.annotation.EnableScheduling;

@MapperScan(basePackages = "com.police.mapper")
@SpringBootApplication
@EnableScheduling
public class Application {
	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}
}
