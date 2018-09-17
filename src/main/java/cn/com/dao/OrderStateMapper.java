package cn.com.dao;

import cn.com.entity.OrderState;
import cn.com.entity.ReportData;

import java.util.List;

public interface OrderStateMapper {
    List<OrderState> selectAll();
}
