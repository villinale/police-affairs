package com.police.entity.response_type;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.Map;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

@Data
public class StationStatistics {
    private int totalCases;
    private int closedCases;
    private double closedRatio;
    private List<Map<String, Object>> dailyNewCases; // 新增案件数
    private List<Map<String, Object>> dailyClosedCases; // 新增结案数

    public StationStatistics() {

    }
}