package cn.com.dao;


import cn.com.entity.ReportData;
import cn.com.entity.User;

import java.util.List;


public interface UserMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbggenerated Fri Feb 09 16:09:36 CST 2018
     */
    int deleteByPrimaryKey(Integer userId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbggenerated Fri Feb 09 16:09:36 CST 2018
     */
    int insert(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbggenerated Fri Feb 09 16:09:36 CST 2018
     */
    int insertSelective(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbggenerated Fri Feb 09 16:09:36 CST 2018
     */
    User selectByUserName(String userName);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbggenerated Fri Feb 09 16:09:36 CST 2018
     */
    int updateByPrimaryKeySelective(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbggenerated Fri Feb 09 16:09:36 CST 2018
     */
    int updateByPrimaryKey(User record);
    
    User selectByMail(String mail);

    int updateByCode(String code);

    List<User> selectUserList();
}