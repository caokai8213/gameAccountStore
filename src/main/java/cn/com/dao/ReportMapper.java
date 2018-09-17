package cn.com.dao;


import cn.com.entity.ReportData;
import cn.com.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface ReportMapper {
    List<ReportData> dayuseradd();
    List<ReportData> gamepercent();
    List<ReportData> dayorderMoney();
    List<ReportData> dayorder();
    List<ReportData> gameMoney();
    //查每日新增用户，新增商品，新增订单每次都要写，很繁琐 看到sql大致相同，只改了表名，由此产生
    int todayCount(@Param("tableName") String tableName);
    int todayMoney();
}