package com.police.mapper;

import com.police.entity.Officer;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface OfficerMapper extends BaseMapper<Officer> {

    List<Officer> getAllOfficers();
}
