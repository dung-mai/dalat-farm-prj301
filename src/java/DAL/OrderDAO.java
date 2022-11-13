/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import model.Cart;
import model.Item;
import model.Order;
import model.OrderDetail;
import model.UserAddress;

/**
 *
 * @author Admin
 */
public class OrderDAO {

    private String status;
    private Connection con;
    ArrayList<Order> orderList;

    public OrderDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error connection" + e.getMessage();
        }
    }

    public OrderDAO(String user, String pass) {
        try {
            con = new DBContext(user, pass).getConnection();
        } catch (Exception e) {
            status = "Error connection" + e.getMessage();
        }
    }

    public void loadOrder() {
        orderList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Orders_HE163263";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrder_id(rs.getInt("order_id"));
                order.setUser_id(rs.getInt("user_id"));
                order.setOrder_code(rs.getString("order_code"));
                order.setOrder_date(rs.getTimestamp("order_date"));
                order.setDeliveryDate(rs.getTimestamp("deliveryDate"));
                order.setFullname(rs.getString("fullname"));
                order.setEmail(rs.getString("email"));
                order.setPhone_number(rs.getString("phone_number"));
                order.setAddress(rs.getString("address"));
                order.setPayment_method(rs.getString("payment_method"));

                order.setOrderList(getOrderDetail(order.getOrder_id()));
                orderList.add(order);
            }

        } catch (SQLException sQLException) {
            status = "Error connection" + sQLException.getMessage();
        }
    }

    public ArrayList<Order> getAllOrder() {
        ArrayList<Order> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Orders_HE163263";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrder_id(rs.getInt("order_id"));
                order.setUser_id(rs.getInt("user_id"));
                order.setStatus(rs.getInt("status"));
                order.setOrder_code(rs.getString("order_code"));
                order.setOrder_date(rs.getTimestamp("order_date"));
                order.setDeliveryDate(rs.getTimestamp("deliveryDate"));
                order.setFullname(rs.getString("fullname"));
                order.setEmail(rs.getString("email"));
                order.setPhone_number(rs.getString("phone_number"));
                order.setAddress(rs.getString("address"));
                order.setPayment_method(rs.getString("payment_method"));

                order.setOrderList(getOrderDetail(order.getOrder_id()));
                list.add(order);
            }

        } catch (SQLException sQLException) {
            status = "Error connection" + sQLException.getMessage();
        }
        return list;
    }

    public ArrayList<Order> getOrderOfUser(int user_id) {
        ArrayList<Order> list = new ArrayList<>();
        for (Order o : orderList) {
            if (o.getUser_id() == user_id) {
                list.add(o);
            }
        }
        return list;
    }

    public void addOrder(String order_code, String email, UserAddress user_add, Cart cart, String payment) {
        String sql = "INSERT INTO Orders_HE163263(order_code, user_id, fullname, email, phone_number, [address], payment_method)\n"
                + "VALUES(?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, order_code);
            ps.setInt(2, (user_add != null ? user_add.getUser_id() : -1));
            ps.setString(3, user_add.getCustomer_name());
            ps.setString(4, email);
            ps.setString(5, user_add.getPhone_number());
            ps.setString(6, user_add.getFullAddress());
            ps.setString(7, payment);
            ps.executeUpdate();

            //Add vao order detail
            String sql_1 = "SELECT TOP 1 order_id FROM Orders_HE163263 ORDER BY order_date desc";
            PreparedStatement st_1 = con.prepareStatement(sql_1);
            ResultSet rs = st_1.executeQuery();
            if (rs.next()) {
                int order_id = rs.getInt("order_id");
                for (Item i : cart.getCart()) {
                    insertOrderDetail(i, order_id);
                }
            }

            //Cap nhap so luoong san pham
            String sql_3 = "UPDATE Products_HE163263 SET quantity = quantity - ? WHERE product_id = ?";
            PreparedStatement st_3 = con.prepareStatement(sql_3);
            for (Item i : cart.getCart()) {
                st_3.setInt(1, i.getQuantity());
                st_3.setInt(2, i.getProduct().getProduct_id());
                st_3.executeUpdate();
            }

        } catch (SQLException e) {
            status = "Error connection" + e.getMessage();
        }

    }

    public void insertOrderDetail(Item i, int order_id) {
        try {
            String sql_2 = "INSERT INTO OrderDetail_HE163263(order_id, product_id, product_name, price, quantity)\n"
                    + "VALUES(?,?, ?, ?, ?)";
            PreparedStatement st_2 = con.prepareStatement(sql_2);
            st_2.setInt(1, order_id);
            st_2.setInt(2, i.getProduct().getProduct_id());
            st_2.setString(3, i.getProduct().getName());
            st_2.setInt(4, i.getProduct().getPromotion_price());
            st_2.setInt(5, i.getQuantity());
            st_2.executeUpdate();
        } catch (SQLException sQLException) {
            status = "Error connection" + sQLException.getMessage();
        }

    }

    public ArrayList<Order> getOrderByUser(int user_id) {
        try {
            ArrayList<Order> list = new ArrayList<>();
            String sql = "SELECT * FROM Orders_HE163263 WHERE user_id = ? ORDER BY order_date DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, user_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrder_id(rs.getInt("order_id"));
                order.setUser_id(rs.getInt("user_id"));
                order.setStatus(rs.getInt("status"));
                order.setOrder_code(rs.getString("order_code"));
                order.setOrder_date(rs.getTimestamp("order_date"));
                order.setDeliveryDate(rs.getTimestamp("deliveryDate"));
                order.setFullname(rs.getString("fullname"));
                order.setEmail(rs.getString("email"));
                order.setPhone_number(rs.getString("phone_number"));
                order.setAddress(rs.getString("address"));
                order.setPayment_method(rs.getString("payment_method"));

                order.setOrderList(getOrderDetail(order.getOrder_id()));
                list.add(order);
            }
            return list;

        } catch (SQLException sQLException) {
            status = "Error connection" + sQLException.getMessage();
            return null;
        }
    }

    public Order getOrderById(int order_id) {
        try {
            String sql = "SELECT * FROM Orders_HE163263 WHERE order_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, order_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Order order = new Order();
                order.setOrder_id(rs.getInt("order_id"));
                order.setUser_id(rs.getInt("user_id"));
                order.setStatus(rs.getInt("status"));
                order.setOrder_code(rs.getString("order_code"));
                order.setOrder_date(rs.getTimestamp("order_date"));
                order.setDeliveryDate(rs.getTimestamp("deliveryDate"));
                order.setFullname(rs.getString("fullname"));
                order.setEmail(rs.getString("email"));
                order.setPhone_number(rs.getString("phone_number"));
                order.setAddress(rs.getString("address"));
                order.setPayment_method(rs.getString("payment_method"));

                order.setOrderList(getOrderDetail(order.getOrder_id()));
                return order;
            }
        } catch (SQLException sQLException) {
            status = "Error connection" + sQLException.getMessage();
        }
        return null;
    }

    public ArrayList<OrderDetail> getOrderDetail(int order_id) {
        try {
            ArrayList<OrderDetail> list = new ArrayList<>();
            String sql1 = "SELECT * FROM OrderDetail_HE163263 WHERE order_id= ?";
            PreparedStatement ps1 = con.prepareStatement(sql1);
            ps1.setInt(1, order_id);
            ResultSet rs_1 = ps1.executeQuery();
            while (rs_1.next()) {
                OrderDetail item = new OrderDetail();
                item.setProduct_id(rs_1.getInt("product_id"));
                item.setOrder_id(rs_1.getInt("order_id"));
                item.setPrice(rs_1.getInt("price"));
                item.setQuantity(rs_1.getInt("quantity"));
                item.setProduct(new DAO().getProductById(item.getProduct_id()));
                list.add(item);
            }
            return list;
        } catch (SQLException sQLException) {
            status = "Error connection" + sQLException.getMessage();
            return null;
        }
    }

    public ArrayList<Order> getOrderFilter(int o_status, String id, String name, String contact) {
        String sql = "SELECT * FROM Orders_HE163263\n"
                + "WHERE order_code LIKE ? AND fullname LIKE ? AND (phone_number LIKE ? OR email LIKE ?)";
        if (o_status > 0) {
            sql += " AND status = ?";
        }
        try {
            ArrayList<Order> list = new ArrayList<>();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + id + "%");
            ps.setString(2, "%" + name + "%");
            ps.setString(3, "%" + contact + "%");
            ps.setString(4, "%" + contact + "%");
            if (o_status > 0) {
                ps.setInt(5, o_status);
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrder_id(rs.getInt("order_id"));
                order.setUser_id(rs.getInt("user_id"));
                order.setOrder_code(rs.getString("order_code"));
                order.setStatus(rs.getInt("status"));
                order.setOrder_date(rs.getTimestamp("order_date"));
                order.setDeliveryDate(rs.getTimestamp("deliveryDate"));
                order.setFullname(rs.getString("fullname"));
                order.setEmail(rs.getString("email"));
                order.setPhone_number(rs.getString("phone_number"));
                order.setAddress(rs.getString("address"));
                order.setPayment_method(rs.getString("payment_method"));

                order.setOrderList(getOrderDetail(order.getOrder_id()));
                list.add(order);
            }
            return list;

        } catch (SQLException sQLException) {
            status = "Error connection" + sQLException.getMessage();
            return null;
        }
    }

    public int countOrderByStatus(int o_status, ArrayList<Order> list) {
        int count = 0;
        for (Order o : list) {
            if (o.getStatus() == o_status) {
                count++;
            }
        }
        return count;
    }

    public int countOrderByDay(ArrayList<Order> list, Timestamp begin, Timestamp end) {
        int count = 0;
        for (Order o : list) {
            if (o.getOrder_date().after(begin) && o.getOrder_date().before(end)) {
                count++;
            }
        }
        return count;
    }

    public long getTotalMoneyByDate(ArrayList<Order> list, Timestamp begin, Timestamp end) {
        long count = 0;
        for (Order o : list) {
            if (o.getStatus() == 3) {
                if (o.getOrder_date().after(begin) && o.getOrder_date().before(end)) {
                    count += o.getTotalMoney();
                }
            }
        }
        return count;
    }

    public ArrayList<Order> getOrderFilter(int o_status, int pageindex, int pagesize, String orderBy, String id, String name, String contact) {
        String sql = "SELECT * FROM \n"
                + "(SELECT *, ROW_NUMBER() OVER (ORDER BY " + orderBy + ") as row_index FROM Orders_HE163263\n"
                + "WHERE order_code LIKE ? AND fullname LIKE ? AND (phone_number LIKE ? OR email LIKE ?)";
        if (o_status > 0) {
            sql += " AND status = ?";
        }
        sql += ") tb WHERE row_index >= (?-1)*?+1 and row_index <= ?*? ";
        try {
            ArrayList<Order> list = new ArrayList<>();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + id + "%");
            ps.setString(2, "%" + name + "%");
            ps.setString(3, "%" + contact + "%");
            ps.setString(4, "%" + contact + "%");
            if (o_status > 0) {
                ps.setInt(5, o_status);
                ps.setInt(6, pageindex);
                ps.setInt(7, pagesize);
                ps.setInt(8, pageindex);
                ps.setInt(9, pagesize);
            } else {
                ps.setInt(5, pageindex);
                ps.setInt(6, pagesize);
                ps.setInt(7, pageindex);
                ps.setInt(8, pagesize);
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrder_id(rs.getInt("order_id"));
                order.setUser_id(rs.getInt("user_id"));
                order.setOrder_code(rs.getString("order_code"));
                order.setStatus(rs.getInt("status"));
                order.setOrder_date(rs.getTimestamp("order_date"));
                order.setDeliveryDate(rs.getTimestamp("deliveryDate"));
                order.setFullname(rs.getString("fullname"));
                order.setEmail(rs.getString("email"));
                order.setPhone_number(rs.getString("phone_number"));
                order.setAddress(rs.getString("address"));
                order.setPayment_method(rs.getString("payment_method"));

                order.setOrderList(getOrderDetail(order.getOrder_id()));
                list.add(order);
            }
            return list;

        } catch (SQLException sQLException) {
            status = "Error connection" + sQLException.getMessage();
            return null;
        }
    }

    public void updateOrderInfo(int order_id, int order_status) {
        try {
            String sql_2 = "UPDATE Orders_HE163263\n"
                    + "SET [status] = ?\n"
                    + "WHERE order_id = ?";
            PreparedStatement st_2 = con.prepareStatement(sql_2);
            st_2.setInt(1, order_status);
            st_2.setInt(2, order_id);
            st_2.executeUpdate();
            if(order_status == 4){ // Nếu hủy đơn hàng , cập nhận lại số lượng trong kho
                Order order = getOrderById(order_id);
                for(int i = 0; i < order.getOrderList().size(); i++){
                    updateProductQuantity(order.getOrderList().get(i).getProduct_id(), order.getOrderList().get(i).getQuantity());
                }
            }
        } catch (SQLException sQLException) {
            status = "Error connection" + sQLException.getMessage();
        }
    }

    private void updateProductQuantity(int pid, int buy_quantity){
        try {
            String sql_2 = "UPDATE Products_HE163263\n"
                    + "SET quantity = quantity + ?\n"
                    + "WHERE product_id = ?";
            PreparedStatement st_2 = con.prepareStatement(sql_2);
            st_2.setInt(1, buy_quantity);
            st_2.setInt(1, pid);
            st_2.executeUpdate();
        } catch (SQLException sQLException) {
            status = "Error connection" + sQLException.getMessage();
        }
    }
    
    public void updateOrderInfo(int order_id, int order_status, String customer_name, String phone_number, String email, String address, String paymentMethod) {
        try {
            String sql_2 = "UPDATE Orders_HE163263\n"
                    + "SET [status] = ?,\n"
                    + "fullname = ?,\n"
                    + "phone_number = ?,\n"
                    + "email = ?,\n"
                    + "[address] = ?,\n"
                    + "payment_method = ?\n"
                    + "WHERE order_id = ?";
            PreparedStatement st_2 = con.prepareStatement(sql_2);
            st_2.setInt(1, order_status);
            st_2.setString(2, customer_name);
            st_2.setString(3, phone_number);
            st_2.setString(4, email);
            st_2.setString(5, address);
            st_2.setString(6, paymentMethod);
            st_2.setInt(7, order_id);
            st_2.executeUpdate();
        } catch (SQLException sQLException) {
            status = "Error connection" + sQLException.getMessage();
        }
    }

    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        for (Order o : dao.getOrderByUser(10)) {
            System.out.println(o);
        }

    }

}
