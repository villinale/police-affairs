package com.police.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
@TableName("user")
public class User implements Serializable {

    @TableId(value = "u_no", type = IdType.AUTO)
    private Integer u_no;

    private String u_role;

    private String u_name;

    private String u_psw;

    private String u_sex;

    private String u_phone;

    public User() {
    }
}
