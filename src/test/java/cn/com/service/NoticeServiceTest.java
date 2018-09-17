package cn.com.service;

import cn.com.entity.Notice;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/applicationContext-*.xml")
public class NoticeServiceTest {
    @Autowired private NoticeService noticeService;
    @Test
    public void selectAllNotice() throws Exception {
        List<Notice> notices = noticeService.selectAllNotice();
        for(Notice n:notices){
            System.out.println(n.toString());
        }
    }
    @Test
    public void insert() throws Exception {
        Notice notice=new Notice();
        notice.setNoticeTitle("aaa");
        notice.setNoticeContent("adsadas");
        int i= noticeService.insert(notice);
       System.out.println(i);
    }
    @Test
    public void selectByid() throws Exception {

    }
    @Test
    public void delete() throws Exception {
        String id="14";
        int i = noticeService.deleteNotice(id);
        System.out.println("================================"+i);
    }
    @Test
    public void update() throws Exception {

    }
}