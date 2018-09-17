package cn.com.entity;

import java.util.Date;

public class Order {
    @Override
    public String toString() {
        return "Order{" +
                "orderId='" + orderId + '\'' +
                ", productId=" + productId +
                ", buyerId=" + buyerId +
                ", createTime=" + createTime +
                ", orderState='" + orderState + '\'' +
                '}';
    }

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column order.order_id
     *
     * @mbggenerated Sat Apr 14 12:22:09 CST 2018
     */

    private String orderId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column order.product_id
     *
     * @mbggenerated Sat Apr 14 12:22:09 CST 2018
     */
    private Long productId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column order.buyer_id
     *
     * @mbggenerated Sat Apr 14 12:22:09 CST 2018
     */
    private Integer buyerId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column order.create_time
     *
     * @mbggenerated Sat Apr 14 12:22:09 CST 2018
     */
    private Date createTime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column order.order_state
     *
     * @mbggenerated Sat Apr 14 12:22:09 CST 2018
     */
    private String orderState;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column order.order_id
     *
     * @return the value of order.order_id
     *
     * @mbggenerated Sat Apr 14 12:22:09 CST 2018
     */
    public String getOrderId() {
        return orderId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column order.order_id
     *
     * @param orderId the value for order.order_id
     *
     * @mbggenerated Sat Apr 14 12:22:09 CST 2018
     */
    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column order.product_id
     *
     * @return the value of order.product_id
     *
     * @mbggenerated Sat Apr 14 12:22:09 CST 2018
     */
    public Long getProductId() {
        return productId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column order.product_id
     *
     * @param productId the value for order.product_id
     *
     * @mbggenerated Sat Apr 14 12:22:09 CST 2018
     */
    public void setProductId(Long productId) {
        this.productId = productId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column order.buyer_id
     *
     * @return the value of order.buyer_id
     *
     * @mbggenerated Sat Apr 14 12:22:09 CST 2018
     */
    public Integer getBuyerId() {
        return buyerId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column order.buyer_id
     *
     * @param buyerId the value for order.buyer_id
     *
     * @mbggenerated Sat Apr 14 12:22:09 CST 2018
     */
    public void setBuyerId(Integer buyerId) {
        this.buyerId = buyerId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column order.create_time
     *
     * @return the value of order.create_time
     *
     * @mbggenerated Sat Apr 14 12:22:09 CST 2018
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column order.create_time
     *
     * @param createTime the value for order.create_time
     *
     * @mbggenerated Sat Apr 14 12:22:09 CST 2018
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column order.order_state
     *
     * @return the value of order.order_state
     *
     * @mbggenerated Sat Apr 14 12:22:09 CST 2018
     */
    public String getOrderState() {
        return orderState;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column order.order_state
     *
     * @param orderState the value for order.order_state
     *
     * @mbggenerated Sat Apr 14 12:22:09 CST 2018
     */
    public void setOrderState(String orderState) {
        this.orderState = orderState == null ? null : orderState.trim();
    }
}