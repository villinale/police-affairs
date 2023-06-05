package com.police;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.police.entity.User;
import com.police.mapper.UserMapper;
import com.police.entity.response_type.StationStatistics;
import com.police.mapper.CaseMapper;

import java.util.List;

@SpringBootTest
@RunWith(SpringJUnit4ClassRunner.class)
public class SampleTest {
    @Autowired
    private CaseMapper caseMapper;

    @Test
    public void testSelect() {
        System.out.println("----------- method test --------------");
    }

}
