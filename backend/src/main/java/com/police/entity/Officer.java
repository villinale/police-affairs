package com.police.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
@TableName("officer")
public class Officer implements Serializable {

    @TableId(value = "u_no")
    private int u_no;

    private String u_role;

    private String u_name;

    private String u_psw;

    private String u_sex;

    private String u_phone;

    private int o_no;

    private String o_stat;

    private int s_no;

    public Officer() {
    }
}
