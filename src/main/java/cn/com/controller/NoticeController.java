package cn.com.controller;

import cn.com.entity.*;
import cn.com.service.GameService;
import cn.com.service.NoticeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.aspectj.weaver.ast.Not;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class NoticeController {
    @Autowired
    private NoticeService noticeService;
    /*查询公告列表*/
    @RequestMapping(value="/manage/notice",method = RequestMethod.GET)
    public String list(@RequestParam(required=true,defaultValue="1")Integer page, Model model){
        PageHelper.startPage(page, 5);
        List<Notice> notices = noticeService.selectAllNotice();

        PageInfo<Notice> p=new PageInfo<>(notices);
        model.addAttribute("page", p);
        model.addAttribute("notices",notices);
        return "/manage/notice/noticeindex";
    }
    /*新增公告*/
    @RequestMapping(value = "/manage/notice/add",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> insert(Notice notice){
           Map<String, Object> map = new HashMap<String, Object>();
           int flag = noticeService.insert(notice);
           map.put("flag",flag);
           map.put("msg","添加失败");
           return map;
    }
    /*首页显示公告*/
    @RequestMapping(value="/index/notice",method = RequestMethod.GET)
    @ResponseBody
    public Map<Long , Object> queryNotice(){
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1");
        Map<Long, Object> map =new HashMap<>();

        List<Notice> notices = noticeService.selectNoticeBytime();
        if(notices.size()<=5){
            for (int i=0;i<notices.size();i++){
                map.put(notices.get(i).getNoticeId(),notices.get(i));
            }
        }else {
            for (int i=0;i<5;i++){
                map.put(notices.get(i).getNoticeId(),notices.get(i));
            }
        }
        return map;
    }
    //根据id查notice详情页面
    @RequestMapping(value="/notice/{id}",method = RequestMethod.GET)
    public ModelAndView notice(@PathVariable("id")String id) {
        ModelAndView mv = new ModelAndView();
        System.out.println("=============");
        Notice notice = noticeService.selectNoticeBynoticeId(id);
        mv.addObject("notice", notice);
        mv.setViewName("notice");
        return mv;
    }
    /*首页更多*/
    @RequestMapping(value="/notice",method = RequestMethod.GET)
    public String noticelist(@RequestParam(required=true,defaultValue="1")Integer page, Model model){
        PageHelper.startPage(page, 5);
        List<Notice> notices = noticeService.selectNoticeBytime();
        PageInfo<Notice> p=new PageInfo<>(notices);
        model.addAttribute("page", p);
        model.addAttribute("notices",notices);
        return "/noticelist";
    }
    /*删除notice*/
    @RequestMapping(value = "/manage/notice/delete",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> deleteArea(@RequestParam(value = "id")String id) throws IOException {
        int flag = noticeService.deleteNotice(id);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("flag",flag);
        map.put("success","删除成功");
        map.put("error","删除失败");
        return map;
    }
    /*查询notice*/
    @RequestMapping(value = "/manage/notice/query",method = RequestMethod.GET)
    public ModelAndView queryNotice(@RequestParam(value = "id",required = false)String id,@RequestParam(value = "page")String page) throws IOException {
        ModelAndView mav = new ModelAndView();
        Notice notice = noticeService.selectNoticeBynoticeId(id);
        mav.addObject("notice",notice);
        mav.addObject("pagenum",page);
        mav.setViewName("manage/notice/update");
        return mav;
    }
    @RequestMapping(value = "/manage/notice/update",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> update(Notice notice){
        Map<String, Object> map = new HashMap<String, Object>();
        int flag = noticeService.update(notice);
        map.put("flag",flag);
        map.put("msg","修改失败");
        return map;
    }
    //根据id查notice详情页面
    @RequestMapping(value="/manage/notice/{id}",method = RequestMethod.GET)
    public ModelAndView notice1(@PathVariable("id")String id) {
        ModelAndView mv = new ModelAndView();
        System.out.println("=============");
        Notice notice = noticeService.selectNoticeBynoticeId(id);
        mv.addObject("notice", notice);
        mv.setViewName("manage/notice/notice");
        return mv;
    }
}
