package cn.com.service.impl;

import cn.com.dao.OrderMapper;
import cn.com.dao.OrderStateMapper;
import cn.com.entity.Order;
import cn.com.entity.OrderExample;
import cn.com.entity.OrderState;
import cn.com.entity.OrderVo;
import cn.com.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl implements OrderService
{
     @Autowired
     private OrderMapper orderMapper;
    @Autowired
    private OrderStateMapper orderStateMapper;
    @Override
    public int add(Order order) {
        return orderMapper.insert(order);
    }

    @Override
    public List<OrderVo> selectOrderBuyerByState(Order order,Map<String,Object> map) {
        return orderMapper.selectOrderVoByBuyer(order,map);
    }

    @Override
    public List<OrderVo> selectOrderSellerByState(Order order, Map<String, Object> map) {
        return orderMapper.selectOrderVoBySeller(order,map);
    }

    @Override
    public int update(Order order) {
        return orderMapper.updateByPrimaryKey(order);
    }

    @Override
    public Order selectByid(String id) {
        return orderMapper.selectByPrimaryKey(id);
    }

    @Override
    public int deleteOrder(String id) {
        return orderMapper.deleteByPrimaryKey(id);
    }

    @Override
    public List<OrderVo> selectVo(Map<String, Object> map) {
        return orderMapper.selectOrderVo(map);
    }

    @Override
    public List<OrderState> selectAll() {
        return orderStateMapper.selectAll();
    }

}
