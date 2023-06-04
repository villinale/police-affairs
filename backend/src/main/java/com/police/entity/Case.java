package com.police.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

@Data
@TableName("cases")
public class Case implements Serializable {

    @TableId(value = "c_no", type = IdType.AUTO)
    private int c_no;

    @TableField
    private String c_title;

    @TableField
    private String c_text;

    @TableField
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private LocalDateTime c_startdate;

    @TableField
    private String c_level;

    @TableField
    private String c_province;

    @TableField
    private String c_city;

    @TableField
    private String c_area;

    @TableField
    private String c_address;

    @TableField
    private double c_lon;

    @TableField
    private double c_lat;

    @TableField
    private String c_stat;

    @TableField
    private Boolean c_isPublic;

    @TableField
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private LocalDateTime c_enddate;

    @TableField
    private int s_no;

    // @TableField
    // private int s_name;

    @TableField
    private int o_no;

    // @TableField
    // private int o_name;

    @TableField
    private int u_no;

    public Case() {
    }

}