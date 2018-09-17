package cn.com.service;
import cn.com.entity.Message;
import cn.com.entity.ReportData;

import java.util.List;

public interface MessageService {
   List<Message> selectMyMessagebystate(Message message);

   Message selectByid(String id);

   int updateState(String id, String state);

   int delete(String id);

   int count(Message message);

   int insert(Message message);
}

