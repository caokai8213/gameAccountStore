package cn.com.service;
import cn.com.entity.ReportData;
import cn.com.entity.User;

import java.util.List;

public interface ReportService
{
  //一个月内每日新增用户
  List<ReportData> dayuseradd();
  List<ReportData> gamepercent();
  List<ReportData> dayorderMoney();
  List<ReportData> dayorder();
  List<ReportData> gameMoney();
  int todayCount(String tableName);
  int todayMoney();
}
