package com.police.entity.response_type;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

@Data
public class StationStatistics {
    private int totalCases;
    private int closedCases;
    private double closedRatio;

    public StationStatistics() {

    }

    public StationStatistics(int totalCases, int closedCases, double closedRatio) {
        this.totalCases = totalCases;
        this.closedCases = closedCases;
        this.closedRatio = closedRatio;
    }
}