package cn.com.service.impl;

import cn.com.dao.NoticeMapper;
import cn.com.dao.ProductMapper;
import cn.com.entity.*;
import cn.com.service.NoticeService;
import cn.com.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.management.NotCompliantMBeanException;
import java.sql.Date;
import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService
{
  @Autowired private NoticeMapper noticeMapper;

  @Override
  public List<Notice> selectAllNotice() {
    NoticeExample noticeExample=new NoticeExample();
    return noticeMapper.selectByExample(noticeExample);
  }

  @Override
  public List<Notice> selectNoticeBytime() {
    NoticeExample noticeExample=new NoticeExample();
    noticeExample.setOrderByClause("create_time desc");
    return  noticeMapper.selectByExample(noticeExample);
  }

  @Override
  public int insert(Notice notice) {
    Date date = new Date(System.currentTimeMillis());
    notice.setCreateTime(date);
    return noticeMapper.insert(notice);
  }

  @Override
  public Notice selectNoticeBynoticeId(String id) {
    NoticeExample noticeExample=new NoticeExample();
    NoticeExample.Criteria criteria = noticeExample.createCriteria();
    criteria.andNoticeIdEqualTo(Long.parseLong(id));
    return noticeMapper.selectByExample(noticeExample).get(0);
  }

  @Override
  public int deleteNotice(String id) {
    NoticeExample noticeExample=new NoticeExample();
    NoticeExample.Criteria criteria = noticeExample.createCriteria();
    criteria.andNoticeIdEqualTo(Long.parseLong(id));
    return noticeMapper.deleteByExample(noticeExample);
  }

  @Override
  public int update(Notice notice) {
    NoticeExample noticeExample=new NoticeExample();
    NoticeExample.Criteria criteria = noticeExample.createCriteria();
    criteria.andNoticeIdEqualTo(notice.getNoticeId());
    return noticeMapper.updateByExampleSelective(notice,noticeExample);
  }
}
