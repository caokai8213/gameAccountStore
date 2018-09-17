package cn.com.service;

import cn.com.entity.Order;
import cn.com.entity.OrderState;
import cn.com.entity.OrderVo;
import org.aspectj.weaver.ast.Or;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

public interface OrderService {
    int add(Order order);
    List<OrderVo> selectOrderBuyerByState(Order order, Map<String,Object> map);
    List<OrderVo> selectOrderSellerByState(Order order, Map<String,Object> map);
    int update(Order order);
    Order selectByid(String id);
    int deleteOrder(String id);
    List<OrderVo> selectVo(Map<String,Object> map);
    List<OrderState> selectAll();
}
