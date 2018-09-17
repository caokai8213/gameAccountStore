package cn.com.service.impl;


import cn.com.dao.MessageMapper;
import cn.com.dao.ReportMapper;
import cn.com.entity.Message;
import cn.com.entity.MessageExample;
import cn.com.entity.ProductExample;
import cn.com.entity.ReportData;
import cn.com.service.MessageService;
import cn.com.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageServiceImpl implements MessageService
{
    @Autowired
    private MessageMapper messageMapper;


    @Override
    public List<Message> selectMyMessagebystate(Message message) {
        MessageExample example =new MessageExample();
        example.setOrderByClause("create_time DESC");
        MessageExample.Criteria criteria = example.createCriteria();
        criteria.andUserIdEqualTo(message.getUserId());
        if(message.getMessageState()!=null&&!"".equals(message.getMessageState())){
        criteria.andMessageStateEqualTo(message.getMessageState());
        }
        return messageMapper.selectByExample(example);
    }

    @Override
    public Message selectByid(String id) {
        return messageMapper.selectByPrimaryKey(Long.parseLong(id));
    }

    @Override
    public int updateState(String id,String state) {
        Message message=new Message();
        message.setMessageId(Long.parseLong(id));
        message.setMessageState(state);
        return messageMapper.updateByPrimaryKeySelective(message);
    }

    @Override
    public int delete(String id) {
        return messageMapper.deleteByPrimaryKey(Long.parseLong(id));
    }

    @Override
    public int count(Message message) {
        MessageExample messageExample=new MessageExample();
        MessageExample.Criteria criteria = messageExample.createCriteria();
        criteria.andMessageStateEqualTo("1");
        criteria.andUserIdEqualTo(message.getUserId());
        return messageMapper.countByExample(messageExample);
    }

    @Override
    public int insert(Message message) {
        return messageMapper.insertSelective(message);
    }
}
