package cn.com.service.impl;


import cn.com.dao.ReportMapper;
import cn.com.dao.UserMapper;
import cn.com.entity.ReportData;
import cn.com.entity.User;
import cn.com.service.ReportService;
import cn.com.service.UserService;
import cn.com.util.MailUtil;
import cn.com.util.SaltUtil;
import cn.com.util.UUIDUtils;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

@Service
public class ReportServiceImpl implements ReportService
{
    @Autowired
    private ReportMapper reportMapper;


    @Override
    public List<ReportData> dayuseradd() {
        return reportMapper.dayuseradd();
    }

    @Override
    public List<ReportData> gamepercent() {
        return reportMapper.gamepercent();
    }

    @Override
    public List<ReportData> dayorderMoney() {
        return reportMapper.dayorderMoney();
    }

    @Override
    public List<ReportData> dayorder() {
        return reportMapper.dayorder();
    }

    @Override
    public List<ReportData> gameMoney() {
        return reportMapper.gameMoney();
    }

    @Override
    public int todayCount(String tableName) {
        return reportMapper.todayCount(tableName);
    }

    @Override
    public int todayMoney() {
        return reportMapper.todayMoney();
    }


}
