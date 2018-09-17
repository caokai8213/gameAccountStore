package cn.com.service;

import cn.com.entity.Order;
import cn.com.entity.OrderState;
import cn.com.entity.OrderVo;
import cn.com.util.UUIDUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.text.SimpleDateFormat;
import java.util.*;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/applicationContext-*.xml")
public class OrderServiceTest {
    @Autowired
    private OrderService orderService;
    @Test
    public void add() throws Exception {
        Order order =new Order();
        String orderNo = "" ;
        UUID uuid = UUID.randomUUID();
        String sdf = new SimpleDateFormat("yyyyMMdd").format(new Date());
        orderNo = uuid.toString().substring(0, 3);
        orderNo =  "X"+sdf +orderNo ;
        System.out.println(orderNo);
        order.setOrderId(orderNo);
        Date date=new Date(System.currentTimeMillis());
        order.setCreateTime(date);
        order.setOrderState("1");
        order.setBuyerId(Integer.parseInt("9"));
        order.setProductId(Long.parseLong("118"));
        System.out.println(order);

        orderService.add(order);
    }
    @Test
    public void select() throws Exception {
        Order order=new Order();
        order.setBuyerId(Integer.parseInt("9"));
        order.setOrderState("1");
        Map<String,Object> map =new HashMap<>();
        map.put("gameName","封神榜贰");
        List<OrderVo> orderVos = orderService.selectOrderBuyerByState(order,map);
        for(OrderVo s:orderVos){
            System.out.println("=============="+s.toString());
        }
    }
    @Test
    public void selectbyseller() throws Exception {
        Order order=new Order();
        order.setOrderState("2");
        Map<String,Object> map =new HashMap<>();
        map.put("producerId",10);
        List<OrderVo> orderVos = orderService.selectOrderSellerByState(order,map);
        for(OrderVo s:orderVos){
            System.out.println("=============="+s.toString());
        }
    }
    @Test
    public void selectall() throws Exception {
        List<OrderState> orderStates = orderService.selectAll();

        for(OrderState s:orderStates){
            System.out.println("=============="+s.toString());
        }
    }

}