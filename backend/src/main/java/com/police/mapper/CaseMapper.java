package com.police.mapper;

import com.police.entity.Case;
import com.police.entity.response_type.StationStatistics;
import com.police.entity.response_type.UserStatistics;
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

    List<Case> getAllOpenClosedCases();

    Case getCasesByCId(Integer c_no);

    List<Case> getUnclosedCasesByOId(int o_no);

    List<Case> getUnclosedCasesBySId(int s_no);

    @ResultMap("StationStatisticsResultMap")
    StationStatistics getStationStatisticsBySNo(int s_no);

    @ResultMap("StationStatisticsResultMap")
    StationStatistics getMonthStationStatisticsBySNo(int s_no);

    @MapKey("dates")
    List<Map<String, Object>> getStationDailyNewCasesBySNo(int s_no);

    @MapKey("dates")
    List<Map<String, Object>> getStationDailyClosedCasesBySNo(int s_no);

    @ResultMap("UserStatisticsResultMap")
    UserStatistics getUserStatisticsByUNo(int u_no);

    @MapKey("dates")
    List<Map<String, Object>> getUserDailyNewCasesByUNo(int u_no);

    @MapKey("dates")
    List<Map<String, Object>> getUserDailyClosedCasesByUNo(int u_no);

    @ResultMap("UserStatisticsResultMap")
    UserStatistics getOfficerStatisticsByONo(int o_no);

    @MapKey("dates")
    List<Map<String, Object>> getOfficerDailyNewCasesByONo(int u_no);

    @MapKey("dates")
    List<Map<String, Object>> getOfficerDailyClosedCasesByONo(int u_no);

}
