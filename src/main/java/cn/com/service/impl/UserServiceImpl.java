package cn.com.service.impl;


import java.sql.Date;
import java.util.List;


import cn.com.entity.Message;

import cn.com.service.MessageService;

import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.dao.UserMapper;
import cn.com.entity.User;
import cn.com.service.UserService;
import cn.com.util.MailUtil;
import cn.com.util.SaltUtil;
import cn.com.util.UUIDUtils;

@Service
public class UserServiceImpl implements UserService
{
    @Autowired
    UserMapper userMapper;
    @Autowired
    MessageService messageService;

    @Override
    public boolean doRegister(User user)
    {
        // TODO Auto-generated method stub
        // 生成激活码
        String code =UUIDUtils.getUUID();
        ByteSource salt = SaltUtil.getSalt(user.getUserName(),
                user.getPassword());
        String password = SaltUtil.getPassword(user.getPassword(), salt.toString());
        user.setPassword(password);
        user.setSalt(salt.toString());
        user.setCode(code);
        Date date = new Date(System.currentTimeMillis());
        user.setCreateTime(date);
        user.setStatus("0");
        // 将用户保存到数据库
        // 保存成功则通过线程的方式给用户发送一封邮件
        if (userMapper.insert(user) > 0)
        {
            new Thread(new MailUtil(user.getUserName(),user.getEmail(), code)).start();
            Message message=new Message();
            message.setUserId(user.getUserId());
            message.setMessageContent("   <p class=\"propmt-info mt12\">尊敬的用户:<br>\n" +
                    "\t\t<span class=\"text-indent\">\n" +
                    "   亲爱的用户，非常欢迎您访问我们【飞天猫】平台。我们是一个专注于手机网络游戏商品的交易平台，希望为广大游戏玩家打造一个公平、公正，安全快捷的游戏虚拟物品交易市场。\n" +
                    "   我们的域名是：<a href=\"http://www.lingjunz.cn\">http://www.lingjunz.cn</a>，手机和电脑都可以同时访问，我们的发货客服将提供7*24小时不间断的全天候服务，确保买家及时收到物品，确保卖家及时获得收益。\n" +
                    "\t\t</span>\n" +
                    "\t\t<span class=\"text-indent\">如有任何疑问请联系客服</span>\n" +
                    "</p>");
            message.setCreateTime(date);
            message.setMessageTitle("【飞天猫】欢迎你");
            message.setMessageType("系统");
            message.setMessageState("1");
            messageService.insert(message);
            return true;
        }
        return false;
    }

    @Override
    public boolean activeUser(String code)
    {
        if (userMapper.updateByCode(code) > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    @Override
    public User selectByUserName(String id) {
        return userMapper.selectByUserName(id);
    }

    @Override
    public int updateUser(User user) {
        return userMapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public int insertUser(User user) {
        return userMapper.insertSelective(user);
    }


    @Override
    public List<User> selectUserList() {
        return userMapper.selectUserList();
    }



    @Override
    public boolean usernameCheck(String username)
    {
        // TODO Auto-generated method stub
        User user = userMapper.selectByUserName(username);
        if(user==null)
            return true;
        return false;
    }

}
