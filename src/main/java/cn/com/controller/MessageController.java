package cn.com.controller;

import cn.com.entity.*;
import cn.com.service.MessageService;
import cn.com.service.ReportService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Controller
public class MessageController {
    @Autowired
    private MessageService messageService;
    //根据id状态查自己的product页面
    @RequestMapping(value="/user/message",method = RequestMethod.GET)
    public String list(@RequestParam(value = "state",required = false)String state, @RequestParam(required=true,defaultValue="1")Integer page, Model model) {
        User user1 = (User) SecurityUtils.getSubject().getPrincipal();
        Integer userId = user1.getUserId();
        Message message=new Message();
        message.setUserId(userId);
        if (!"all".equals(state)){
            message.setMessageState(state);
        }
        PageHelper.startPage(page, 5);
        List<Message> messages = messageService.selectMyMessagebystate(message);
        PageInfo<Message> p = new PageInfo<>(messages);
        model.addAttribute("page", p);
        model.addAttribute("state",state);
        model.addAttribute("message", messages);
        return "user/mymessage";
    }
    //根据id查message详情页面并改变状态
     @RequestMapping(value="/user/message/detail/{id}",method = RequestMethod.GET)
    public ModelAndView message(@PathVariable("id")String id) {
        ModelAndView mv = new ModelAndView();
        System.out.println("=============");
        Message message = messageService.selectByid(id);
        messageService.updateState(id,"2");
        mv.addObject("message", message);
        mv.setViewName("user/messagedetail");
        return mv;
    }
    /*删除消息*/
    @RequestMapping(value = "/user/message/delete",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> deleteMessage(@RequestParam(value = "id")String id) throws IOException {
        int flag = messageService.delete(id);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("flag",flag);
        map.put("success","删除成功");
        map.put("error","删除失败");
        return map;
    }
    /*geshu*/
    @RequestMapping(value = "/user/messagecount",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> countMessage() throws IOException {
        User user1 =(User) SecurityUtils.getSubject().getPrincipal();
        Message message=new Message();
        message.setUserId(user1.getUserId());
        int count = messageService.count(message);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("count",count);
        return map;
    }
}
