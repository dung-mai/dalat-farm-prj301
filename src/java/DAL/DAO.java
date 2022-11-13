/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.math.RoundingMode;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cart;
import model.Item;
import model.Order;
import model.OrderDetail;
import model.Product;
import model.ProductCategory;
import model.ProductReview;
import model.Supplier;
import model.User;
import model.UserAddress;

/**
 *
 * @author Admin
 */
public class DAO {

    private String status;
    private Connection con;

    public DAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error connection" + e.getMessage();
        }
    }

    public DAO(String user, String pass) {
        try {
            con = new DBContext(user, pass).getConnection();
        } catch (Exception e) {
            status = "Error connection" + e.getMessage();
        }
    }

    /**
     *
     * @return
     */
    public ArrayList<Product> getProducts() {
        ArrayList<Product> products = new ArrayList<Product>();
        String sql = "SELECT * FROM Products_HE163263 WHERE status = 1";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProduct_id(rs.getInt("product_id"));
                p.setName(rs.getString("name"));
                p.setStatus(rs.getBoolean("status"));
                p.setQuantity(rs.getInt("quantity"));
                p.setUnit(rs.getString("unit"));
                p.setUnitprice(rs.getInt("unitprice"));
                p.setPromotion_price(rs.getInt("promotion_price"));
                p.setThumbnail(rs.getString("thumbnail"));
                p.setDetail(rs.getString("detail"));
                p.setRating(rs.getInt("rating"));
                p.setTags(rs.getString("tags"));
                p.setViewcount(rs.getInt("viewcount"));
                p.setHot(rs.getDate("hot"));
                p.setCate_id(rs.getInt("cate_id"));
                p.setSupplier_id(rs.getInt("supplier_id"));
                p.setCreated_at(rs.getDate("created_at"));
                p.setCreated_by(rs.getInt("created_by"));
                p.setUpdated_at(rs.getDate("updated_at"));
                p.setUpdated_by(rs.getInt("updated_by"));
                products.add(p);
            }
        } catch (SQLException e) {
            status = "Error connection" + e.getMessage();
        }
        return products;
    }

    public ArrayList<Product> getProducts(int pageindex, int pagesize) {
        ArrayList<Product> products = new ArrayList<Product>();
        String sql = "SELECT * FROM \n"
                + "(SELECT *, ROW_NUMBER() OVER (ORDER BY product_id ASC) as row_index FROM Products_HE163263) tb\n"
                + "WHERE row_index >= (?-1)*?+1 and row_index <= ?*? AND status = 1";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, pageindex);
            ps.setInt(2, pagesize);
            ps.setInt(3, pageindex);
            ps.setInt(4, pagesize);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProduct_id(rs.getInt("product_id"));
                p.setName(rs.getString("name"));
                p.setStatus(rs.getBoolean("status"));
                p.setQuantity(rs.getInt("quantity"));
                p.setUnit(rs.getString("unit"));
                p.setUnitprice(rs.getInt("unitprice"));
                p.setPromotion_price(rs.getInt("promotion_price"));
                p.setThumbnail(rs.getString("thumbnail"));
                p.setDetail(rs.getString("detail"));
                p.setRating(rs.getInt("rating"));
                p.setTags(rs.getString("tags"));
                p.setViewcount(rs.getInt("viewcount"));
                p.setHot(rs.getDate("hot"));
                p.setCate_id(rs.getInt("cate_id"));
                p.setSupplier_id(rs.getInt("supplier_id"));
                p.setCreated_at(rs.getDate("created_at"));
                p.setCreated_by(rs.getInt("created_by"));
                p.setUpdated_at(rs.getDate("updated_at"));
                p.setUpdated_by(rs.getInt("updated_by"));
                products.add(p);
            }
        } catch (SQLException e) {
            status = "Error connection" + e.getMessage();
        }
        return products;
    }

    public Product getProductById(int pid) {
        String sql = "SELECT * FROM Products_HE163263 WHERE product_id=? AND status = 1";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Product p = new Product();
                p.setProduct_id(rs.getInt("product_id"));
                p.setName(rs.getString("name"));
                p.setStatus(rs.getBoolean("status"));
                p.setQuantity(rs.getInt("quantity"));
                p.setUnit(rs.getString("unit"));
                p.setUnitprice(rs.getInt("unitprice"));
                p.setPromotion_price(rs.getInt("promotion_price"));
                p.setThumbnail(rs.getString("thumbnail"));
                p.setDetail(rs.getString("detail"));
                p.setRating(rs.getFloat("rating"));
                p.setTags(rs.getString("tags"));
                p.setViewcount(rs.getInt("viewcount"));
                p.setHot(rs.getDate("hot"));
                p.setCate_id(rs.getInt("cate_id"));
                p.setSupplier_id(rs.getInt("supplier_id"));
                p.setCreated_at(rs.getDate("created_at"));
                p.setCreated_by(rs.getInt("created_by"));
                p.setUpdated_at(rs.getDate("updated_at"));
                p.setUpdated_by(rs.getInt("updated_by"));
                return p;
            }
        } catch (SQLException e) {
            status = "Error connection" + e.getMessage();
        }
        return null;
    }

    public ArrayList<Product> getProductsByCate(int cate_id) {
        ArrayList<Product> products = new ArrayList<Product>();
        String sql = "SELECT * from Products_HE163263 WHERE status = 1";
        if (cate_id > 0) {
            sql += "AND cate_id = ?";
        }
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            if (cate_id > 0) {
                ps.setInt(1, cate_id);
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProduct_id(rs.getInt("product_id"));
                p.setName(rs.getString("name"));
                p.setStatus(rs.getBoolean("status"));
                p.setQuantity(rs.getInt("quantity"));
                p.setUnit(rs.getString("unit"));
                p.setUnitprice(rs.getInt("unitprice"));
                p.setPromotion_price(rs.getInt("promotion_price"));
                p.setThumbnail(rs.getString("thumbnail"));
                p.setDetail(rs.getString("detail"));
                p.setRating(rs.getInt("rating"));
                p.setTags(rs.getString("tags"));
                p.setViewcount(rs.getInt("viewcount"));
                p.setHot(rs.getDate("hot"));
                p.setCate_id(rs.getInt("cate_id"));
                p.setSupplier_id(rs.getInt("supplier_id"));
                p.setCreated_at(rs.getDate("created_at"));
                p.setCreated_by(rs.getInt("created_by"));
                p.setUpdated_at(rs.getDate("updated_at"));
                p.setUpdated_by(rs.getInt("updated_by"));
                products.add(p);
            }
        } catch (SQLException e) {
            status = "Error connection" + e.getMessage();
        }
        return products;
    }

    public ArrayList<Product> getProductsByAllFilter(int cate_id, int min, int max, String qtext) {
        ArrayList<Product> products = new ArrayList<Product>();
        String sql = "SELECT * from Products_HE163263 WHERE status = 1 AND "
                + "(promotion_price between ? AND ?) AND name LIKE ? ";
        if (cate_id > 0) {
            sql += "AND cate_id = ?";
        }
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, min);
            ps.setInt(2, max);
            ps.setString(3, "%" + qtext + "%");
            if (cate_id > 0) {
                ps.setInt(4, cate_id);
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProduct_id(rs.getInt("product_id"));
                p.setName(rs.getString("name"));
                p.setStatus(rs.getBoolean("status"));
                p.setQuantity(rs.getInt("quantity"));
                p.setUnit(rs.getString("unit"));
                p.setUnitprice(rs.getInt("unitprice"));
                p.setPromotion_price(rs.getInt("promotion_price"));
                p.setThumbnail(rs.getString("thumbnail"));
                p.setDetail(rs.getString("detail"));
                p.setRating(rs.getInt("rating"));
                p.setTags(rs.getString("tags"));
                p.setViewcount(rs.getInt("viewcount"));
                p.setHot(rs.getDate("hot"));
                p.setCate_id(rs.getInt("cate_id"));
                p.setSupplier_id(rs.getInt("supplier_id"));
                p.setCreated_at(rs.getDate("created_at"));
                p.setCreated_by(rs.getInt("created_by"));
                p.setUpdated_at(rs.getDate("updated_at"));
                p.setUpdated_by(rs.getInt("updated_by"));
                products.add(p);
            }
        } catch (SQLException e) {
            status = "Error connection" + e.getMessage();
        }
        return products;
    }

    public ArrayList<Product> getProductsByCate(int cate_id, int pageindex, int pagesize, String orderBy) {
        ArrayList<Product> products = new ArrayList<Product>();
        String sql = "SELECT * FROM \n"
                + "(SELECT *, ROW_NUMBER() OVER (ORDER BY " + orderBy + ") as row_index FROM Products_HE163263 WHERE status = 1";
        if (cate_id > 0) {
            sql += " AND cate_id = ?";
        }
        sql += ") tb WHERE row_index >= (?-1)*?+1 and row_index <= ?*? ";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            if (cate_id > 0) {
                ps.setInt(1, cate_id);
                ps.setInt(2, pageindex);
                ps.setInt(3, pagesize);
                ps.setInt(4, pageindex);
                ps.setInt(5, pagesize);
            } else {
                ps.setInt(1, pageindex);
                ps.setInt(2, pagesize);
                ps.setInt(3, pageindex);
                ps.setInt(4, pagesize);
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProduct_id(rs.getInt("product_id"));
                p.setName(rs.getString("name"));
                p.setStatus(rs.getBoolean("status"));
                p.setQuantity(rs.getInt("quantity"));
                p.setUnit(rs.getString("unit"));
                p.setUnitprice(rs.getInt("unitprice"));
                p.setPromotion_price(rs.getInt("promotion_price"));
                p.setThumbnail(rs.getString("thumbnail"));
                p.setDetail(rs.getString("detail"));
                p.setRating(rs.getInt("rating"));
                p.setTags(rs.getString("tags"));
                p.setViewcount(rs.getInt("viewcount"));
                p.setHot(rs.getDate("hot"));
                p.setCate_id(rs.getInt("cate_id"));
                p.setSupplier_id(rs.getInt("supplier_id"));
                p.setCreated_at(rs.getDate("created_at"));
                p.setCreated_by(rs.getInt("created_by"));
                p.setUpdated_at(rs.getDate("updated_at"));
                p.setUpdated_by(rs.getInt("updated_by"));
                products.add(p);
            }
        } catch (SQLException e) {
            status = "Error connection" + e.getMessage();
        }
        return products;
    }

    public ArrayList<Product> getProductsByCate(int cate_id, int pageindex, int pagesize, String orderBy, int min, int max, String qtext) {
        ArrayList<Product> products = new ArrayList<Product>();
        String sql = "SELECT * FROM \n"
                + "(SELECT *, ROW_NUMBER() OVER (ORDER BY " + orderBy + ") as row_index FROM Products_HE163263 WHERE status = 1"
                + " AND (promotion_price between ? AND ?)  AND name LIKE ? ";
        if (cate_id > 0) {
            sql += " AND cate_id = ?";
        }
        sql += ") tb WHERE row_index >= (?-1)*?+1 and row_index <= ?*? ";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            if (cate_id > 0) {
                ps.setInt(1, min);
                ps.setInt(2, max);
                ps.setString(3, "%" + qtext + "%");
                ps.setInt(4, cate_id);
                ps.setInt(5, pageindex);
                ps.setInt(6, pagesize);
                ps.setInt(7, pageindex);
                ps.setInt(8, pagesize);
            } else {
                ps.setInt(1, min);
                ps.setInt(2, max);
                ps.setString(3, "%" + qtext + "%");
                ps.setInt(4, pageindex);
                ps.setInt(5, pagesize);
                ps.setInt(6, pageindex);
                ps.setInt(7, pagesize);
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProduct_id(rs.getInt("product_id"));
                p.setName(rs.getString("name"));
                p.setStatus(rs.getBoolean("status"));
                p.setQuantity(rs.getInt("quantity"));
                p.setUnit(rs.getString("unit"));
                p.setUnitprice(rs.getInt("unitprice"));
                p.setPromotion_price(rs.getInt("promotion_price"));
                p.setThumbnail(rs.getString("thumbnail"));
                p.setDetail(rs.getString("detail"));
                p.setRating(rs.getInt("rating"));
                p.setTags(rs.getString("tags"));
                p.setViewcount(rs.getInt("viewcount"));
                p.setHot(rs.getDate("hot"));
                p.setCate_id(rs.getInt("cate_id"));
                p.setSupplier_id(rs.getInt("supplier_id"));
                p.setCreated_at(rs.getDate("created_at"));
                p.setCreated_by(rs.getInt("created_by"));
                p.setUpdated_at(rs.getDate("updated_at"));
                p.setUpdated_by(rs.getInt("updated_by"));
                products.add(p);
            }
        } catch (SQLException e) {
            status = "Error connection" + e.getMessage();
        }
        return products;
    }
//    GET CATEGORY

    public ArrayList<ProductCategory> getProductCategories() {
        ArrayList<ProductCategory> productcategorys = new ArrayList<ProductCategory>();
        String sql = "SELECt * from ProductCategory_HE163263";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductCategory p = new ProductCategory();
                p.setCate_id(rs.getInt("cate_id"));
                p.setName(rs.getString("name"));
                p.setStatus(rs.getBoolean("status"));
                p.setCreated_at(rs.getDate("created_at"));
                p.setCreated_by(rs.getInt("created_by"));
                p.setUpdated_at(rs.getDate("updated_at"));
                p.setUpdated_by(rs.getInt("updated_by"));
                productcategorys.add(p);
            }
        } catch (SQLException e) {
            status = "Error connection" + e.getMessage();
        }
        return productcategorys;
    }

//    GET SUPPLIER
    public HashMap<Integer, Supplier> getSuppliers() {
        HashMap<Integer, Supplier> suppliers = new HashMap<>();

        String sql = "SELECT [supplier_id]\n"
                + "      ,[name]\n"
                + "      ,[email]\n"
                + "      ,[phone]\n"
                + "      ,[address]\n"
                + "  FROM [PRJ301_SE1625].[dbo].[Suppliers_HE163263]";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Supplier s = new Supplier();
                s.setSupplier_id(rs.getInt("supplier_id"));
                s.setName(rs.getString("name"));
                s.setPhone(rs.getString("phone"));
                s.setEmail(rs.getString("email"));
                s.setAddress(rs.getString("address"));
                suppliers.put(s.getSupplier_id(), s);
            }
        } catch (SQLException e) {
            status = "Error connection" + e.getMessage();
        }
        return suppliers;
    }

    public ProductCategory getPCategoryById(int id) {
        ProductCategory category = new ProductCategory();
        String sql = "SELECt * from ProductCategory_HE163263 where cate_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                category.setCate_id(rs.getInt("cate_id"));
                category.setName(rs.getString("name"));
                category.setStatus(rs.getBoolean("status"));
                category.setCreated_at(rs.getDate("created_at"));
                category.setCreated_by(rs.getInt("created_by"));
                category.setUpdated_at(rs.getDate("updated_at"));
                category.setUpdated_by(rs.getInt("updated_by"));
                return category;
            }
        } catch (SQLException e) {
            status = "Error connection" + e.getMessage();
        }
        return null;
    }

    public ArrayList<Product> getProductsByName(String qtext) {
        ArrayList<Product> products = new ArrayList<Product>();
        String sql = "SELECT * from Products_HE163263 WHERE [name] like ? AND status = 1";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + qtext + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProduct_id(rs.getInt("product_id"));
                p.setName(rs.getString("name"));
                p.setStatus(rs.getBoolean("status"));
                p.setQuantity(rs.getInt("quantity"));
                p.setUnit(rs.getString("unit"));
                p.setUnitprice(rs.getInt("unitprice"));
                p.setPromotion_price(rs.getInt("promotion_price"));
                p.setThumbnail(rs.getString("thumbnail"));
                p.setDetail(rs.getString("detail"));
                p.setRating(rs.getInt("rating"));
                p.setTags(rs.getString("tags"));
                p.setViewcount(rs.getInt("viewcount"));
                p.setHot(rs.getDate("hot"));
                p.setCate_id(rs.getInt("cate_id"));
                p.setSupplier_id(rs.getInt("supplier_id"));
                p.setCreated_at(rs.getDate("created_at"));
                p.setCreated_by(rs.getInt("created_by"));
                p.setUpdated_at(rs.getDate("updated_at"));
                p.setUpdated_by(rs.getInt("updated_by"));
                products.add(p);
            }
        } catch (SQLException e) {
            status = "Error connection" + e.getMessage();
        }
        return products;
    }

    public boolean insertProduct(String name, int quantity, String unit, int unitprice, int promotion_price, String thumbnail, String detail, String tags, String hot, int cate_id, int supplier_id) {
        String sql = "INSERT INTO Products_HE163263([name], quantity, unit, unitprice, promotion_price, thumbnail, detail,tags , hot, cate_id, supplier_id)\n"
                + "VALUES (?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setInt(2, quantity);
            ps.setString(3, unit);
            ps.setInt(4, unitprice);
            ps.setInt(5, promotion_price);
            ps.setString(6, thumbnail);
            ps.setString(7, detail);
            ps.setString(8, tags);
            ps.setString(9, hot);
            ps.setInt(10, cate_id);
            ps.setInt(11, supplier_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            status = "Error connection" + e.getMessage();
            return false;
        }
        return true;
    }

    public boolean updateProduct(int product_id, String name, int quantity, String unit, int unitprice, int promotion_price, String thumbnail, String detail, String tags, String hot, int cate_id, int supplier_id) {
        String sql = "UPDATE Products_HE163263\n"
                + "SET [name] = ?,\n"
                + "quantity = ?,\n"
                + "unit = ?,\n"
                + "unitprice = ?,\n"
                + "promotion_price = ?,\n"
                + "thumbnail = ?,\n"
                + "detail = ?,\n"
                + "tags = ?,\n"
                + "hot = ?,\n"
                + "cate_id = ?,\n"
                + "supplier_id = ?\n"
                + "WHERE product_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setInt(2, quantity);
            ps.setString(3, unit);
            ps.setInt(4, unitprice);
            ps.setInt(5, promotion_price);
            ps.setString(6, thumbnail);
            ps.setString(7, detail);
            ps.setString(8, tags);
            ps.setString(9, hot);
            ps.setInt(10, cate_id);
            ps.setInt(11, supplier_id);
            ps.setInt(12, product_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            status = "Error connection" + e.getMessage();
            return false;
        }
        return true;
    }

    public void softDeleteProduct(int pid) {
        String sql = "UPDATE Products_HE163263\n"
                + "SET [status] = 0\n"
                + "WHERE product_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, pid);
            ps.executeUpdate();
        } catch (SQLException e) {
            status = "Error connection" + e.getMessage();
        }
    }

    public void addOrder(String order_code, String email, UserAddress user_add, Cart cart, String payment) {
        String sql = "INSERT INTO Orders_HE163263(order_code, user_id, fullname, email, phone_number, [address], payment_method, total)\n"
                + "VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, order_code);
            ps.setInt(2, (user_add != null ? user_add.getUser_id() : -1));
            ps.setString(3, user_add.getCustomer_name());
            ps.setString(4, email);
            ps.setString(5, user_add.getPhone_number());
            ps.setString(6, user_add.getFullAddress());
            ps.setString(7, payment);
            ps.setInt(8, cart.getTotalMoney());
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
            ArrayList<Order> orderList = new ArrayList<>();
            String sql = "SELECT * FROM Orders_HE163263 WHERE user_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, user_id);
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
                order.setStatus(rs.getInt("status"));
                order.setPhone_number(rs.getString("phone_number"));
                order.setAddress(rs.getString("address"));
                order.setPayment_method(rs.getString("payment_method"));

                order.setOrderList(getOrderDetail(order.getOrder_id()));
                orderList.add(order);
            }
            return orderList;

        } catch (SQLException sQLException) {
            status = "Error connection" + sQLException.getMessage();
            return null;
        }
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
                item.setProduct(getProductById(item.getProduct_id()));
                list.add(item);
            }
            return list;
        } catch (SQLException sQLException) {
            status = "Error connection" + sQLException.getMessage();
            return null;
        }
    }

    public void addProductReview(User user, int product_id, int star, String detail) {
        try {
            String sql = "INSERT INTO ProductReview_HE163263(user_id, product_id, [name], email, detail, rating)\n"
                    + "VALUES(?,?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, user.getUser_id());
            ps.setInt(2, product_id);
            ps.setString(3, user.getFirst_name() + " " + user.getLast_name());
            ps.setString(4, user.getEmail());
            ps.setString(5, detail);
            ps.setInt(6, star);
            ps.executeUpdate();

        } catch (SQLException sQLException) {
            status = "Error connection" + sQLException.getMessage();
        }
    }

    public void updateProductReview(int review_id, int star, String detail) {
        try {
            String sql = "UPDATE ProductReview_HE163263 SET rating = ?, detail = ?\n"
                    + " WHERE review_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, star);
            ps.setString(2, detail);
            ps.setInt(3, review_id);
            ps.executeUpdate();

        } catch (SQLException sQLException) {
            status = "Error connection" + sQLException.getMessage();
        }
    }

    public void deleteProductReview(int review_id) {
        try {
            String sql = "DELETE ProductReview_HE163263"
                    + " WHERE review_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, review_id);
            ps.executeUpdate();
        } catch (SQLException sQLException) {
            status = "Error connection" + sQLException.getMessage();
        }
    }

    public boolean checkUserReviewPemission(int product_id, int user_id) {
        try {
            String sql = "SELECT COUNT(*) AS numberOfBuyTime FROM Orders_HE163263 o\n"
                    + "INNER JOIN OrderDetail_HE163263 od ON od.order_id = o.order_id\n"
                    + "WHERE product_id = ? AND user_id = ? AND status = 3";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, product_id);
            ps.setInt(2, user_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("numberOfBuyTime") >= 1;
            }
        } catch (SQLException sQLException) {
            status = "Error connection" + sQLException.getMessage();
        }
        return false;
    }

    public boolean hasUserReviewProduct(int product_id, int user_id) {
        try {
            String sql = "select COUNT(*) AS numberOfReview from ProductReview_HE163263 WHERE product_id = ? AND user_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, product_id);
            ps.setInt(2, user_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("numberOfReview") >= 1;
            }
        } catch (SQLException sQLException) {
            status = "Error connection" + sQLException.getMessage();
        }
        return false;

    }

    public ArrayList<ProductReview> getReviewByProduct(int product_id) {
        try {
            ArrayList<ProductReview> reviews = new ArrayList<>();
            String sql = "select * from ProductReview_HE163263 WHERE product_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, product_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductReview review = new ProductReview();
                review.setReview_id(rs.getInt("review_id"));
                review.setProduct_id(rs.getInt("product_id"));
                review.setUser_id(rs.getInt("user_id"));
                review.setRating(rs.getInt("rating"));
                review.setName(rs.getString("name"));
                review.setEmail(rs.getString("email"));
                review.setDetail(rs.getString("detail"));
                review.setCreated_at(rs.getTimestamp("created_at"));
                reviews.add(review);
            }
            return reviews;
        } catch (SQLException sQLException) {
            status = "Error connection" + sQLException.getMessage();
            return null;
        }
    }

    public ArrayList<ProductReview> getAllProductReview() {
        try {
            ArrayList<ProductReview> reviews = new ArrayList<>();
            String sql = "select * from ProductReview_HE163263 ORDER BY created_at DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductReview review = new ProductReview();
                review.setReview_id(rs.getInt("review_id"));
                review.setProduct_id(rs.getInt("product_id"));
                review.setUser_id(rs.getInt("user_id"));
                review.setRating(rs.getInt("rating"));
                review.setName(rs.getString("name"));
                review.setEmail(rs.getString("email"));
                review.setDetail(rs.getString("detail"));
                review.setCreated_at(rs.getTimestamp("created_at"));
                reviews.add(review);
            }
            return reviews;
        } catch (SQLException sQLException) {
            status = "Error connection" + sQLException.getMessage();
            return null;
        }
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
//        ArrayList<ProductReview> re = dao.getReviewByProduct(6
//        for (ProductReview o : re) {
//            System.out.println(o);

//        System.out.println(dao.getProductById(6));
//        dao.deleteProductReview(3);
    }

}
