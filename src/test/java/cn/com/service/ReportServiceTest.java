package cn.com.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/applicationContext-*.xml")
public class ReportServiceTest {
    @Autowired
    private ReportService reportService;
    @Test
    public void todayCount() throws Exception {
        int t_order = reportService.todayCount("t_order");
        System.out.println(t_order);
    }

}