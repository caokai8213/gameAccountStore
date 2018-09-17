package cn.com.entity;

public class OrderState {
    private String orderStateId;
    private String orderStateName;

    public String getOrderStateId() {
        return orderStateId;
    }

    public void setOrderStateId(String orderStateId) {
        this.orderStateId = orderStateId;
    }

    public String getOrderStateName() {
        return orderStateName;
    }

    public void setOrderStateName(String orderStateName) {
        this.orderStateName = orderStateName;
    }

    @Override
    public String toString() {
        return "OrderState{" +
                "orderStateId='" + orderStateId + '\'' +
                ", orderStateName='" + orderStateName + '\'' +
                '}';
    }
}
