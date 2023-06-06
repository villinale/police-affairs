package com.police.entity.response_type;

import lombok.Data;

import java.util.Map;
import java.util.List;

@Data
public class UserStatistics {
    private Integer totalCases;
    private Integer closedCases;
    private Double closedRatio;

    private List<Map<String, Object>> dailyNewCases; // 新增案件数
    private List<Map<String, Object>> dailyClosedCases; // 新增结案数

    // getters and setters
}
