package ra.edu.session2.Bai3.model;
import java.util.Date;

public class Order {
    private String orderId;
    private String productName;
    private double totalPrice;
    private Date orderDate;

    public Order() {

    }

    public Order(String orderId, String productName, double totalPrice, Date orderDate) {
        this.orderId = orderId;
        this.productName = productName;
        this.totalPrice = totalPrice;
        this.orderDate = orderDate;
    }

    public String getOrderId() {
        return orderId;
    }
    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getProductName() {
        return productName;
    }
    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getTotalPrice() {
        return totalPrice;
    }
    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Date getOrderDate() {
        return orderDate;
    }
    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }
}
