package cn.com.controller;

import cn.com.dao.ReportMapper;
import cn.com.entity.ReportData;
import cn.com.service.ReportService;
import cn.com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/report")
public class ReportController {
    @Autowired
    private ReportService reportService;
    @RequestMapping(value = "/dayuser",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> dayuser(){
        List<ReportData> dayuseradd = reportService.dayuseradd();
        return common(dayuseradd);
    }
    @RequestMapping(value = "/dayorder",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> dayorder(){
        List<ReportData> gamepercent = reportService.gamepercent();
        Map<String, Object> common = common(gamepercent);
        common.put("source",gamepercent);
        return common;
    }
    @RequestMapping(value = "/gamepercent",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> gamepercent(){
        List<ReportData> gamepercent = reportService.gamepercent();
        Map<String, Object> common = common(gamepercent);
        common.put("source",gamepercent);
        return common;
    }
    @RequestMapping(value="/index",method = RequestMethod.GET)
    @ResponseBody
    public Map<String , Object> manageindex(){
        Map<String, Object> map =new HashMap<>();
        int todayUser = reportService.todayCount("user");
        int todayOrder=reportService.todayCount("t_order");
        int todayProduct=reportService.todayCount("product");
        int todayMoney=reportService.todayMoney();
        map.put("todayuser",todayUser);
        map.put("todayorder",todayOrder);
        map.put("todayproduct",todayProduct);
        map.put("todaymoney",todayMoney);
        return map;
    }
    @RequestMapping(value = "/orderMoney",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> orderMoney(){
        List<ReportData> order=reportService.dayorder();
        List<ReportData> dayorderMoney=reportService.dayorderMoney();
        Map<String, Object> common = common(order);
        Map<String, Object> common2 = common(dayorderMoney);
        Map map=new HashMap();
        map.put("common",common);
        map.put("common2",common2);
        return map;
    }
    @RequestMapping(value = "/gameMoney",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> gameMoney(){
        List<ReportData> gameMoney=reportService.gameMoney();
        Map<String, Object> common = common(gameMoney);
        common.put("source",gameMoney);
        return common;
    }
    public Map<String,Object> common(List<ReportData> list){
        Map<String,Object> map=new HashMap<>();
        List<String> name=new LinkedList<>();
        List<Integer> value=new LinkedList<>();
        for(ReportData a:list){
            name.add(a.getName());
            value.add(a.getValue());
        }
        map.put("name",name);
        map.put("value",value);
        return map;
    }
}
