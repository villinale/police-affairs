package com.police.mapper;

import com.police.entity.Station;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface StationMapper extends BaseMapper<Station> {

    List<Station> getAllStations();
}
