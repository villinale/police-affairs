package com.police.mapper;

import com.police.entity.Case;
import com.police.entity.response_type.StationStatistics;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
public interface CaseMapper extends BaseMapper<Case> {
    List<Case> getUserCasesByUId(Integer u_no);

    List<Case> getOfficerCasesByUId(Integer u_no);

    List<Case> getAllCases();

    Case getCasesByCId(Integer c_no);

    @ResultMap("StationStatisticsResultMap")
    StationStatistics getStationStatisticsBySNo(int s_no);

    @MapKey("dates")
    List<Map<String, Object>> getStationDailyNewCasesBySNo(int s_no);

    @MapKey("dates")
    List<Map<String, Object>> getStationDailyClosedCasesBySNo(int s_no);
}
