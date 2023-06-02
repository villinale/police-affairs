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

    public User(String u_role, String u_name, String u_psw, String u_sex, String u_phone) {
        this.u_role = u_role;
        this.u_name = u_name;
        this.u_psw = u_psw;
        this.u_sex = u_sex;
        this.u_phone = u_phone;
    }
}
