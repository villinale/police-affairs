package com.police;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.police.entity.User;
import com.police.mapper.UserMapper;

import java.util.List;

@SpringBootTest
@RunWith(SpringJUnit4ClassRunner.class)
public class SampleTest {
    @Autowired
    private UserMapper userMapper;

    @Test
    public void testSelect() {
        System.out.println("----------- method test --------------");
        // List<User> userList = userMapper.selectList(null);
        // Assert.assertEquals(2, userList.size());
        // userList.forEach(System.out::println);
    }

}
