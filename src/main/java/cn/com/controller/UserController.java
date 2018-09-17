package cn.com.controller;

import java.io.File;
import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.com.entity.Game;
import cn.com.entity.Message;
import cn.com.service.MessageService;
import cn.com.util.SaltUtil;
import cn.com.util.UUIDUtils;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jdk.nashorn.internal.parser.JSONParser;
import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.apache.shiro.web.filter.mgt.DefaultFilter;
import org.apache.shiro.web.util.SavedRequest;
import org.apache.shiro.web.util.WebUtils;
import org.omg.Messaging.SYNC_WITH_TRANSPORT;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cn.com.entity.User;
import cn.com.service.UserService;

import static org.apache.shiro.web.filter.mgt.DefaultFilter.user;

@Controller
@RequestMapping()
public class UserController
{
    Logger logger=Logger.getLogger(UserController.class);
@Autowired
UserService userService;
    @Autowired
    MessageService messageService;
@RequestMapping(value = "/login", method = RequestMethod.POST)
public ModelAndView login(User model,HttpServletRequest request) {
//    String ip = request.getHeader("x-forwarded-for");
//    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//        ip = request.getHeader("Proxy-Client-IP");
//    }
//    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//        ip = request.getHeader("WL-Proxy-Client-IP");
//    }
//    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//        ip = request.getHeader("HTTP_CLIENT_IP");
//    }
//    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//        ip = request.getHeader("HTTP_X_FORWARDED_FOR");
//    }
//    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//        ip = request.getRemoteAddr();
//    }
//    logger.info("==========="+ip);

    //获取当前用户对象
    Subject subject = SecurityUtils.getSubject();
    //生成令牌(传入用户输入的账号和密码)
    UsernamePasswordToken token = new UsernamePasswordToken(model.getUserName(),model.getPassword());
    ModelAndView mav = new ModelAndView();
    try {
        //执行认证操作. 
        subject.login(token);
    }catch (UnknownAccountException  ua){
        logger.info("登录失败：账户不存在"+ua.getMessage());
        mav.addObject("msg","登录失败：账户不存在！");
        mav.setViewName("login");
        return mav;
    }
    catch (LockedAccountException la) {
        logger.info("登陆失败: 账户未激活" + la.getMessage());
        mav.addObject("msg","登陆失败: 账户未激活！");
        mav.setViewName("login");
        return mav;
    }catch (DisabledAccountException da) {
        logger.info("登陆失败: 账户被禁用" + da.getMessage());
        mav.addObject("msg","登陆失败: 账户被禁用！");
        mav.setViewName("login");
        return mav;
    }catch (IncorrectCredentialsException  ae){
        logger.info("登陆失败: 密码错误" + ae.getMessage());
        mav.addObject("msg","登陆失败，密码错误！");
        mav.setViewName("login");
        return mav;
    }catch (ExcessiveAttemptsException eae){
        logger.info("登陆失败: 错误次数超过三次" + eae.getMessage());
        mav.addObject("msg","登陆失败: 错误次数超过三次，已被锁定，请三分钟后再试！");
        mav.setViewName("login");
    }
    if(subject.hasRole("common")){
        mav.setViewName("index");
        //回到登录前的页面
        SavedRequest savedRequest= WebUtils.getSavedRequest(request);
        if(null!=savedRequest){
            System.out.println("注意登录之前的路径是"+savedRequest.getRequestUrl());
            mav.setViewName("redirect:"+ savedRequest.getRequestUrl().substring(8));
        }
    }
    if(subject.hasRole("manager")){
        mav.setViewName("redirect:manage/index.jsp");
    }

    return mav;
}
@RequestMapping("/registercheck")
@ResponseBody
public String RegisterCheck(@RequestParam("userName")String username) {
    if(userService.usernameCheck(username)) {
        return "success";
    }
    return "error";
}
@RequestMapping(value="/register",method = RequestMethod.POST)
@ResponseBody
public Map<String,Object> Register(User user) throws ServletException, IOException {
    Map<String, Object> map = new HashMap<String, Object>();
    user.setRole("common");
    boolean flag=userService.doRegister(user);
    map.put("flag",flag);
    map.put("msg","注册失败");
    return map;
}
/*用户注册激活*/
@RequestMapping("/active")
public void  Active(@RequestParam("code")String code,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    if (userService.activeUser(code)) {
        request.setAttribute("msg", "激活成功，返回到登录界面");
        request.setAttribute("type", "1");
    } else {
        request.setAttribute("msg", "激活失败，返回到主页面");
        request.setAttribute("type", "2");
    }
    request.getRequestDispatcher("/registerresult.jsp").forward(request, response);
}
    @RequestMapping(value="/restful",produces="text/plain;charset=UTF-8")
    @ResponseBody
    public String info() {
        return "Hello World!";
    }
    /*查询个人信息*/
    @RequestMapping(value="/user/userinfo")
    public ModelAndView UserInfo() {
        ModelAndView mav = new ModelAndView();
        User user1 =(User) SecurityUtils.getSubject().getPrincipal();
        Message message=new Message();
        message.setUserId(user1.getUserId());
        int count = messageService.count(message);
        User user = userService.selectByUserName(user1.getUserName());
        mav.addObject("user",user);
        mav.addObject("count",count);
        mav.setViewName("user/gerenzhongxin");
        return mav;
    }
    /*个人信息修改*/
    @RequestMapping(value = "/user/update",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> update(User user) throws IOException {
        System.out.println(user);
        int flag = userService.updateUser(user);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("flag",flag);
        map.put("success","修改成功");
        map.put("error","修改失败");
        return map;
    }
    /*个人密码修改*/
    @RequestMapping(value = "/user/updatepwd",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> updatePwd(@RequestParam("oldpassword")String oldpassword,@RequestParam("password")String newpassword) throws IOException {
        //System.out.println("======"+oldpassword+newpassword);
        Map<String, Object> map = new HashMap<String, Object>();
        User user1 =(User) SecurityUtils.getSubject().getPrincipal();
        User user = userService.selectByUserName(user1.getUserName());
        String password1 = SaltUtil.getPassword(oldpassword, user.getSalt());
        if(password1.equals(user.getPassword())){
            ByteSource salt = SaltUtil.getSalt(user.getUserName(),
                    newpassword);
            String password2 = SaltUtil.getPassword(newpassword, salt.toString());
            user.setPassword(password2);
            user.setSalt(salt.toString());
            int flag= userService.updateUser(user);
            map.put("flag",flag);
            map.put("success","修改成功");
            map.put("error","修改失败");
        }else{
            map.put("flag",0);
            map.put("error","原密码不对,修改失败");
        }
        return map;
    }

    //后台查用户
    @RequestMapping(value="/manage/user",method = RequestMethod.GET)
    public ModelAndView userList(@RequestParam(required=true,defaultValue="1")Integer page){
        ModelAndView mv=new ModelAndView();
        PageHelper.startPage(page, 5);
        List<User> users=userService.selectUserList();
        PageInfo<User> p=new PageInfo<>(users);
        mv.addObject("page", p);
        mv.addObject("users",users);
        mv.setViewName( "manage/user/userindex");
        return mv;
    }
    /*设置用户状态*/
    @RequestMapping(value = "/manage/user/update",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> update(@RequestParam(value = "id")String id,@RequestParam(value = "type")String type) throws IOException {
        System.out.println("===========================");
        System.out.println(id+type);
        User user = userService.selectByUserName(id);

        System.out.println(user);
        /*根据传来的值判断要把状态设为禁用还是启用*/
        if ("qy".equals(type)){
            user.setStatus("1");
        }else if("jy".equals(type)){
            user.setStatus("2");
        }
        int flag = userService.updateUser(user);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("flag",flag);
        map.put("success","修改成功");
        map.put("error","修改失败");
        return map;
    }
    @RequestMapping(value="/manage/user/userinfo")
    @ResponseBody
    public User UserInfo(@RequestParam("id")String id) {
        User user = userService.selectByUserName(id);
        return user;
    }



    public static String username;
    //react测试用
    @RequestMapping(value = "/bbb",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> querycurrent() throws IOException {

        Map<String, Object> map = new HashMap<String, Object>();

        map.put("name",username);
        map.put("avatar","https://gw.alipayobjects.com/zos/rmsportal/BiazfanxmamNRoxxVxka.png");
        map.put("userid","1111");
        map.put("notifyCount",12);
        return map;
    }
    @RequestMapping(value = "/aaa/register",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> registera(@RequestBody String body )throws IOException {

        Map<String, Object> map = new HashMap<String, Object>();
        ObjectMapper mapper = new ObjectMapper();
        Map map1=mapper.readValue(body, Map.class);
        System.out.println("==============="+map1);
        String username = (String) map1.get("username");
        String password = (String) map1.get("password");
        User user=new User();
        user.setUserName(username);
        user.setPassword(password);
        userService.insertUser(user);
        map.put("status","ok");
        map.put("currentAuthority","user");

        return map;
    }
    //react测试用
    @RequestMapping(value = "/aaa",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> update(@RequestBody String body,HttpServletRequest request) throws IOException {

        Map<String, Object> map = new HashMap<String, Object>();
        ObjectMapper mapper = new ObjectMapper();
        Map map1=mapper.readValue(body, Map.class);
        System.out.println("==============="+map1);
        username =(String )map1.get("userName");
        String password =(String )map1.get("password");
        String type =(String )map1.get("type");
        User user = userService.selectByUserName(username);
        System.out.println("==============="+user);
        HttpSession session = request.getSession();
        session.setAttribute("user",user);
        if(user==null){
            map.put("status","error");
            map.put("type",type);
            map.put("currentAuthority","guest");
        }else if(user!=null&&user.getPassword().equals(password)){
            map.put("status","ok");
            map.put("type",type);
            map.put("currentAuthority","admin");

        }

        return map;
    }
}

