package com.police.mapper;

import com.police.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface UserMapper extends BaseMapper<User> {
    // User searchById(Integer id);

    // User searchByEmail(String email);

    User searchByPhoneAndPsw(String u_phone, String u_psw);

    List<User> searchByPhone(String u_phone);
}
