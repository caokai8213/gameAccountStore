package cn.com.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailUtil implements Runnable
{
    private String email;// 收件人邮箱

    private String code;// 激活码

    private String userName;
    public MailUtil(String userName,String email, String code)
    {
        this.userName=userName;
        this.email = email;
        this.code = code;
    }

    public void run()
    {
        // 1.创建连接对象javax.mail.Session
        // 2.创建邮件对象 javax.mail.Message
        // 3.发送一封激活邮件
        // String from = "@qq.com";// 发件人电子邮箱
        // String host = "smtp.qq.com"; //
        // 指定发送邮件的主机smtp.qq.com(QQ)|smtp.163.com(网易)
        String host = "smtp.163.com";
        String from = "17625318213@163.com";// 发件人的email
        String pwd = "caokai58734366";// 发件人密码
        Properties properties = System.getProperties();// 获取系统属性
        properties.setProperty("mail.smtp.host", host);// 设置邮件服务器
        properties.setProperty("mail.smtp.auth", "true");// 打开认证
        try
        {

            // 1.获取默认session对象
            Session session = Session.getDefaultInstance(properties,
                    new Authenticator()
                    {
                        public PasswordAuthentication getPasswordAuthentication()
                        {
                            return new PasswordAuthentication(from, pwd); // 发件人邮箱账号、授权码
                        }
                    });

            // 2.创建邮件对象
            Message message = new MimeMessage(session);
            // 2.1设置发件人
            message.setFrom(new InternetAddress("17625318213@163.com"));
            // 2.2设置接收人
            message.addRecipient(Message.RecipientType.TO,
                    new InternetAddress(email));
            // 2.3设置邮件主题
            message.setSubject("飞天猫账号注册激活");
            // 2.4设置邮件内容
            //String url="www.lingjunz.cn/gameweb/active?code="+code;
            String url="http://localhost:8080/gameweb/active?code="+code;
            String content="<!DOCTYPE html>\n" +
                    "<html>\n" +
                    " <head> \n" +
                    "  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" /> \n" +
                    "  <title></title> \n" +
                    "  <meta charset=\"utf-8\" /> \n" +
                    " </head> \n" +
                    " <body> \n" +
                    "  <div id=\"contentDiv\" onmouseover=\"getTop().stopPropagation(event);\" onclick=\"getTop().preSwapLink(event, 'html', 'ZC0528-GZ9DdUJb6H3GKjZsN03vR83');\" style=\"position:relative;font-size:14px;height:auto;padding:15px 15px 10px 15px;z-index:1;zoom:1;line-height:1.7;\" class=\"body\"> \n" +
                    "   <div id=\"qm_con_body\">\n" +
                    "    <div id=\"mailContentContainer\" class=\"qmbox qm_con_body_content qqmail_webmail_only\" style=\"\">\n" +
                    "     <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"740\" align=\"center\" style=\"\">\n" +
                    "      <tbody>\n" +
                    "       <tr></tr>\n" +
                    "       <tr>\n" +
                    "        <td width=\"30\" height=\"60\"></td>\n" +
                    "        <td width=\"680\" height=\"60\">\n" +
                    "         <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"680\">\n" +
                    "          <tbody>\n" +
                    "           <tr>\n" +
                    "            <td width=\"330\" align=\"left\"></td>\n" +
                    "            <td width=\"350\" align=\"right\" style=\"vertical-align: bottom;\"></td>\n" +
                    "           </tr>\n" +
                    "          </tbody>\n" +
                    "         </table></td>\n" +
                    "        <td width=\"30\" height=\"60\"></td>\n" +
                    "       </tr>\n" +
                    "       <tr>\n" +
                    "        <td></td>\n" +
                    "        <td>\n" +
                    "         <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"680\" align=\"center\" style=\"background:#edf4ff; border-radius: 8px; box-shadow: 0 3px 4px rgba(0,0,0,.1); font-family:'宋体'\">\n" +
                    "          <tbody>\n" +
                    "           <tr>\n" +
                    "            <td width=\"65\" height=\"45\"><h3 style=\"color: red\">飞天猫</h3></td>\n" +
                    "            <td width=\"590\" height=\"45\">欢迎您</td>\n" +
                    "           \n" +
                    "           </tr>\n" +
                    "           <tr>\n" +
                    "            <td width=\"45\"></td>\n" +
                    "            <td width=\"590\" style=\"word-break:break-all; font-size:14px; color:#333;line-height: 26px;\"><h2 style=\"margin: 0 0;font-size:16px; color:#333;\"><span style=\"border-bottom:1px dashed #ccc;z-index:1\" t=\"7\" onclick=\"return false;\" data=\"479541126\">"+userName+"</span>：</h2>\n" +
                    "             <div style=\"height:2px;\"></div><p style=\"margin:0\">您申请将<font color=\"red\"><a href=\"#\" target=\"_blank\">"+email+"</a></font>设置为登录邮箱，要完成该操作，请<font color=\"red\">点击</font>以下按钮：</p>\n" +
                    "             <div style=\"height:25px;\"></div><a href='"+url+"' style=\"display:block; width:270px; height:70px; text-align:center; line-height:70px; color:#fff; font-size:20px; font-family:'microsoft yahei'; text-decoration: none; border-radius:8px; background:#6ac13e; background:#6ac13e -webkit-gradient(linear, 50% 90%, 50% 5%, from(#51ac45), to(#6dc43d)); box-shadow: 0 1px 3px rgba(196,225,186,.7)\" target=\"_blank\"><span style=\"margin:25px 0; vertical-align: baseline;\">验证邮箱</span></a>\n" +
                    "             <div style=\"height:25px\"></div><p style=\"margin:0;\">若按钮无法点击，请点击该链接或将链接复制到浏览器地址栏进行访问</p>\n" +
                    "             <div style=\"height:20px\"></div><p style=\"margin:0;\"><a href='"+url+"' style=\"color:#0081fa;\" target=\"_blank\">"+url+"</a></p>\n" +
                    "             <div style=\"height:20px\"></div><p style=\"margin:0;\">如果您点击上述链接，提示,请重新发起密保邮箱的设置申请，感谢您的配合与支持！<br />（如非本人操作，请忽略此邮件）</p>\n" +
                    "             <div style=\"height:20px\"></div><p style=\"margin:0;\">FTM用户中心</p></td>\n" +
                    "            <td width=\"45\"></td>\n" +
                    "           </tr>\n" +
                    "           <tr>\n" +
                    "            <td height=\"45\"></td>\n" +
                    "            <td height=\"45\"></td>\n" +
                    "            <td height=\"45\"></td>\n" +
                    "           </tr>\n" +
                    "          </tbody>\n" +
                    "         </table></td>\n" +
                    "        <td></td>\n" +
                    "       </tr>\n" +
                    "       <tr>\n" +
                    "        <td height=\"\"></td>\n" +
                    "        <td></td>\n" +
                    "        <td></td>\n" +
                    "       </tr>\n" +
                    "       <tr>\n" +
                    "        <td height=\"167\"></td>\n" +
                    "        <td height=\"167\" style=\"vertical-align:top\"></td>\n" +
                    "        <td height=\"167\"></td>\n" +
                    "       </tr>\n" +
                    "      </tbody>\n" +
                    "     </table> \n" +
                    "     <style type=\"text/css\">.qmbox style, .qmbox script, .qmbox head, .qmbox link, .qmbox meta {display: none !important;}</style>\n" +
                    "    </div>\n" +
                    "   </div>\n" +
                    "   <!-- -->\n" +
                    "   <style>#mailContentContainer .txt {height:auto;}</style> \n" +
                    "  </div>  \n" +
                    " </body>\n" +
                    "</html>";
            message.setContent(content, "text/html;charset=UTF-8");
            // 3.发送邮件
            Transport.send(message);
            System.out.println("邮件成功发送!");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}