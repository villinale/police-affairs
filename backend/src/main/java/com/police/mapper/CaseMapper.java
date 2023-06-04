package com.police.mapper;

import com.police.entity.Case;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface CaseMapper extends BaseMapper<Case> {
    List<Case> getUserCasesByUId(Integer u_no);

    List<Case> getAllCases();

    Case getCasesByCId(Integer c_no);
}
