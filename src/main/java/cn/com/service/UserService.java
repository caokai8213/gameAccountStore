package cn.com.service;
import cn.com.entity.ReportData;
import cn.com.entity.User;
import org.springframework.stereotype.Service;

import java.util.List;

public interface UserService
{
  //检查用户是否被使用
   boolean usernameCheck(String username);
  //注册发邮箱
  boolean  doRegister(User user);  
  //激活
  boolean activeUser(String code);
  //chaxun
  User selectByUserName(String id);

  int updateUser(User user);
  List<User> selectUserList();
  //react测试用
  int insertUser(User user);

}
