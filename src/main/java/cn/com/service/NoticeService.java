package cn.com.service;


import cn.com.entity.Notice;
import org.springframework.stereotype.Service;

import java.util.List;



public interface NoticeService
{
   List<Notice> selectAllNotice();
   List<Notice> selectNoticeBytime();
   int insert(Notice notice);
   Notice selectNoticeBynoticeId(String id);
   int deleteNotice(String id);
   int update(Notice notice);
}
