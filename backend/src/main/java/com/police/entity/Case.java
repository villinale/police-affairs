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

import java.sql.Timestamp;

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
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date c_data;

    @TableField
    private int c_level;

    @TableField
    private String c_loc;

    @TableField
    private int c_stat;

    @TableField
    private int s_no;

    @TableField
    private int o_no;

    public Case() {
    }

    public Case(int c_no, String c_text, String c_title, Date c_data, int c_level, String c_loc,
            int c_stat, int s_no, int o_no) {
        this.c_no = c_no;
        this.c_title = c_title;
        this.c_text = c_text;
        this.c_data = c_data;
        this.c_level = c_level;
        this.c_loc = c_loc;
        this.c_stat = c_stat;
        this.s_no = s_no;
        this.o_no = o_no;
    }
}