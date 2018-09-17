package cn.com.entity;

import java.util.Date;

public class EmailCaptcha {
    private int id;				//验证码id
    private int userId;         //用户id
    private String email;		//用户邮箱
    private String captcha;		//验证码
    private Date createTime;	//创建时间
}
