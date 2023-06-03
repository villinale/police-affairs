package com.police.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

@Data
@TableName("station")
public class Station implements Serializable {
    @TableId(value = "s_no", type = IdType.AUTO)
    private int s_no;

    private String s_name;

    private double s_lon;

    private double s_lat;

    private String s_phone;

    private String s_province;

    private String s_city;

    private String s_area;

    private String s_address;

    public Station() {
    }
}