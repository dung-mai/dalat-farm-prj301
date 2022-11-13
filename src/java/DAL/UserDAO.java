/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Logger;
import model.*;
import model.User;
import model.UserGoogle;

/**
 *
 * @author Admin
 */
public class UserDAO {

    private String status;
    private Connection con;

    public UserDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error connection" + e.getMessage();
        }
    }

    public UserDAO(String user, String pass) {
        try {
            con = new DBContext(user, pass).getConnection();
        } catch (Exception e) {
            status = "Error connection" + e.getMessage();
        }
    }

    public User getUser(String email, String password) {
        try {
            String sql = "SELECT * FROM User_HE163263 WHERE email = ? AND [password] = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUser_id(rs.getInt("user_id"));
                user.setFirst_name(rs.getString("first_name"));
                user.setLast_name(rs.getString("last_name"));
                user.setEmail(rs.getString("email"));
                user.setPhone_number(rs.getString("phone_number"));
                user.setAddress(rs.getString("address"));
                user.setPassword(rs.getString("password"));
                user.setAvatar(rs.getString("avatar"));
                user.setExternal_login(rs.getBoolean("external_login"));
                user.setExternal_id(rs.getString("external_id"));
                user.setCreated_at(rs.getDate("created_at"));
                user.setUpdated_at(rs.getDate("updated_at"));
                user.setVerified(rs.getBoolean("verified"));
                user.setActive(rs.getBoolean("active"));
                return user;
            }
        } catch (SQLException ex) {
            status = "Error connection" + ex.getMessage();
        }
        return null;
    }

    public User getUserById(int id) {
        try {
            String sql = "SELECT * FROM User_HE163263 WHERE user_id = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUser_id(rs.getInt("user_id"));
                user.setFirst_name(rs.getString("first_name"));
                user.setLast_name(rs.getString("last_name"));
                user.setEmail(rs.getString("email"));
                user.setPhone_number(rs.getString("phone_number"));
                user.setAddress(rs.getString("address"));
                user.setPassword(rs.getString("password"));
                user.setAvatar(rs.getString("avatar"));
                user.setExternal_login(rs.getBoolean("external_login"));
                user.setExternal_id(rs.getString("external_id"));
                user.setCreated_at(rs.getDate("created_at"));
                user.setUpdated_at(rs.getDate("updated_at"));
                user.setVerified(rs.getBoolean("verified"));
                user.setActive(rs.getBoolean("active"));
                return user;
            }
        } catch (SQLException ex) {
            status = "Error connection" + ex.getMessage();
        }
        return null;
    }

    public ArrayList<User> getAllUser() {
        try {
            ArrayList<User> list = new ArrayList<>();
            String sql = "SELECT * FROM User_HE163263 WHERE user_id > 1";
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUser_id(rs.getInt("user_id"));
                user.setFirst_name(rs.getString("first_name"));
                user.setLast_name(rs.getString("last_name"));
                user.setEmail(rs.getString("email"));
                user.setPhone_number(rs.getString("phone_number"));
                user.setAddress(rs.getString("address"));
                user.setPassword(rs.getString("password"));
                user.setAvatar(rs.getString("avatar"));
                user.setExternal_login(rs.getBoolean("external_login"));
                user.setExternal_id(rs.getString("external_id"));
                user.setCreated_at(rs.getDate("created_at"));
                user.setUpdated_at(rs.getDate("updated_at"));
                user.setVerified(rs.getBoolean("verified"));
                user.setActive(rs.getBoolean("active"));
                list.add(user);
            }
            return list;
        } catch (SQLException ex) {
            status = "Error connection" + ex.getMessage();
        }
        return null;
    }
    
    public String[] getAllUserEmail() {
        try {
           ArrayList<String> list = new ArrayList<>();
            String sql = "SELECT email FROM User_HE163263 WHERE user_id > 1";
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                list.add(rs.getString("email"));
            }
            String[] s = new String[list.size()];
            for(int i = 0; i< list.size(); i++){
                s[i] = list.get(i);
            }
            return s;
        } catch (SQLException ex) {
            status = "Error connection" + ex.getMessage();
        }
        return null;
    }

    public ArrayList<User> getAllUser(String search, int u_status) {
        try {
            ArrayList<User> list = new ArrayList<>();
            String sql = "SELECT * FROM User_HE163263 WHERE user_id > 1  AND (last_name LIKE ? OR email LIKE ?)";
            if (u_status > 0) {
                switch (u_status) {
                    case 1:
                        sql += " AND active = 1 AND verified = 1";
                        break;
                    case 2:
                        sql += " AND active = 0";
                        break;
                    default:
                        sql += " AND verified = 0";
                        break;
                }
            }
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, "%" + search + "%");
            stm.setString(2, "%" + search + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUser_id(rs.getInt("user_id"));
                user.setFirst_name(rs.getString("first_name"));
                user.setLast_name(rs.getString("last_name"));
                user.setEmail(rs.getString("email"));
                user.setPhone_number(rs.getString("phone_number"));
                user.setAddress(rs.getString("address"));
                user.setPassword(rs.getString("password"));
                user.setAvatar(rs.getString("avatar"));
                user.setExternal_login(rs.getBoolean("external_login"));
                user.setExternal_id(rs.getString("external_id"));
                user.setCreated_at(rs.getDate("created_at"));
                user.setUpdated_at(rs.getDate("updated_at"));
                user.setVerified(rs.getBoolean("verified"));
                user.setActive(rs.getBoolean("active"));
                list.add(user);
            }
            return list;
        } catch (SQLException ex) {
            status = "Error connection" + ex.getMessage();
        }
        return null;
    }

    public ArrayList<User> getAllUser(int pageindex, int pagesize, String search, int u_status) {
        ArrayList<User> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM \n"
                    + "(SELECT *, ROW_NUMBER() OVER (ORDER BY user_id) as row_index FROM User_HE163263\n"
                    + "WHERE user_id > 1 AND (last_name LIKE ? OR email LIKE ?)";
            if (u_status > 0) {
                switch (u_status) {
                    case 1:
                        sql += " AND active = 1 AND verified = 1";
                        break;
                    case 2:
                        sql += " AND active = 0";
                        break;
                    default:
                        sql += " AND verified = 0";
                        break;
                }
            }
            sql += ") tb WHERE row_index >= (?-1)*?+1 and row_index <= ?*? ";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            ps.setString(2, "%" + search + "%");
            ps.setInt(3, pageindex);
            ps.setInt(4, pagesize);
            ps.setInt(5, pageindex);
            ps.setInt(6, pagesize);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUser_id(rs.getInt("user_id"));
                user.setFirst_name(rs.getString("first_name"));
                user.setLast_name(rs.getString("last_name"));
                user.setEmail(rs.getString("email"));
                user.setPhone_number(rs.getString("phone_number"));
                user.setAddress(rs.getString("address"));
                user.setPassword(rs.getString("password"));
                user.setAvatar(rs.getString("avatar"));
                user.setExternal_login(rs.getBoolean("external_login"));
                user.setExternal_id(rs.getString("external_id"));
                user.setCreated_at(rs.getDate("created_at"));
                user.setUpdated_at(rs.getDate("updated_at"));
                user.setVerified(rs.getBoolean("verified"));
                user.setActive(rs.getBoolean("active"));
                list.add(user);
            }
            return list;
        } catch (SQLException ex) {
            status = "Error connection" + ex.getMessage();
        }
        return null;
    }

    public void registration(String email, String password, String firstname, String lastname, String phone) {
        try {
            String sql = "INSERT INTO User_HE163263(email, first_name, last_name, [password],phone_number)\n"
                    + "VALUES(?,?,?,?,?)";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, firstname);
            stm.setString(3, lastname);
            stm.setString(4, password);
            stm.setString(5, phone);
            stm.executeUpdate();

        } catch (SQLException ex) {
            status = "Error connection" + ex.getMessage();
        }
    }

    public void registrationGoogle(UserGoogle user) {
        try {
            String sql = "INSERT INTO User_HE163263(email, first_name, last_name, external_login ,external_id, avatar, verified)\n"
                    + "VALUES(?,?,?,?,?,?, ?)";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, user.getEmail());
            stm.setString(2, user.getGiven_name());
            stm.setString(3, user.getFamily_name());
            stm.setBoolean(4, true);
            stm.setString(5, user.getId());
            stm.setString(6, user.getPicture());
            stm.setBoolean(7, true);   // default google accout is verified 
            stm.executeUpdate();
        } catch (SQLException ex) {
            status = "Error connection" + ex.getMessage();
        }
    }

    public boolean isAdmin(String u_email) {
        try {
            String sql = "SELECT COUNT(*) AS numOfRow FROM User_HE163263 u\n"
                    + "INNER JOIN User_Role_HE163263 ur ON ur.user_id = u.user_id\n"
                    + "INNER JOIN Role_HE163263 r ON r.role_id = ur.role_id\n"
                    + "WHERE email = ?\n"
                    + "AND r.role_id = 1";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, u_email);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("numOfRow") >= 1;
            }
        } catch (SQLException ex) {
            status = "Error connection" + ex.getMessage();
        }
        return false;
    }

    public boolean checkExistAccount(String u_email) {
        try {
            String sql = "SELECT COUNT(*) AS numOfRow FROM User_HE163263\n"
                    + "WHERE email = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, u_email);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("numOfRow") >= 1;
            }
        } catch (SQLException ex) {
            status = "Error connection" + ex.getMessage();
        }
        return false;
    }

    public User getUserByEmail(String email) {
        try {
            String sql = "SELECT * FROM User_HE163263 WHERE email = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUser_id(rs.getInt("user_id"));
                user.setFirst_name(rs.getString("first_name"));
                user.setLast_name(rs.getString("last_name"));
                user.setEmail(rs.getString("email"));
                user.setPhone_number(rs.getString("phone_number"));
                user.setAddress(rs.getString("address"));
                user.setPassword(rs.getString("password"));
                user.setAvatar(rs.getString("avatar"));
                user.setExternal_login(rs.getBoolean("external_login"));
                user.setExternal_id(rs.getString("external_id"));
                user.setCreated_at(rs.getDate("created_at"));
                user.setUpdated_at(rs.getDate("updated_at"));
                user.setVerified(rs.getBoolean("verified"));
                user.setActive(rs.getBoolean("active"));
                return user;
            }
        } catch (SQLException ex) {
            status = "Error connection" + ex.getMessage();
        }
        return null;
    }

    public boolean updateUserInfor(String firstname, String lastname, String phone, String address, String email) {
        try {
            String sql = "UPDATE User_HE163263\n"
                    + "SET first_name = ?,\n"
                    + "last_name = ?,\n"
                    + "phone_number = ?,\n"
                    + "[address] = ?\n"
                    + "WHERE email = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, firstname);
            stm.setString(2, lastname);
            stm.setString(3, phone);
            stm.setString(4, address);
            stm.setString(5, email);
            stm.executeUpdate();
        } catch (SQLException ex) {
            status = "Error connection" + ex.getMessage();
            return false;
        }
        return true;
    }

    public boolean updateUserInfor(String firstname, String lastname, String phone, String address, String avatar, String email) {
        try {
            String sql = "UPDATE User_HE163263\n"
                    + "SET first_name = ?,\n"
                    + "last_name = ?,\n"
                    + "phone_number = ?,\n"
                    + "[address] = ?,\n"
                    + "avatar = ?\n"
                    + "WHERE email = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, firstname);
            stm.setString(2, lastname);
            stm.setString(3, phone);
            stm.setString(4, address);
            stm.setString(5, avatar);
            stm.setString(6, email);
            stm.executeUpdate();
        } catch (SQLException ex) {
            status = "Error connection" + ex.getMessage();
            return false;
        }
        return true;
    }

    public boolean updateUserStatus(int u_status, int user_id) {
        try {
            String sql = "UPDATE User_HE163263\n"
                    + "SET active = ?,\n"
                    + "verified = ?\n"
                    + "WHERE user_id = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            switch (u_status) {
                case 1:
                    stm.setInt(1, 1);
                    stm.setInt(2, 1);
                    break;
                case 2:
                    stm.setInt(1, 0);
                    stm.setInt(2, 1);
                    break;
                case 3:
                    stm.setInt(1, 1);
                    stm.setInt(2, 0);
                    break;
                default:
                    break;
            }
            stm.setInt(3, user_id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            status = "Error connection" + ex.getMessage();
            return false;
        }
        return true;
    }
    
    public boolean checkPassword(String email, String password) {
        try {
            String sql = "SELECT COUNT(*) AS numOfRow FROM User_HE163263\n"
                    + "WHERE email = ? AND [password] = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("numOfRow") >= 1;
            }
        } catch (SQLException ex) {
            status = "Error connection" + ex.getMessage();
            return false;
        }
        return false;
    }

    public boolean changePassword(String email, String newpassword) {
        try {
            String sql = "UPDATE User_HE163263\n"
                    + "SET [password] = ?\n"
                    + "WHERE email = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, newpassword);
            stm.setString(2, email);
            stm.executeUpdate();
        } catch (SQLException ex) {
            status = "Error connection" + ex.getMessage();
            return false;
        }
        return true;
    }

    public ArrayList<UserAddress> getAddressByUser(int user_id) {
        ArrayList<UserAddress> addresses = new ArrayList<>();
        try {
            String sql = "SELECT * FROM User_Address_HE163263 WHERE user_id = ? ORDER BY [default] DESC";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, user_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                UserAddress userAdd = new UserAddress();
                userAdd.setAddress_id(rs.getInt("address_id"));
                userAdd.setUser_id(rs.getInt("user_id"));
                userAdd.setCustomer_name(rs.getString("customer_name"));
                userAdd.setPhone_number(rs.getString("phone_number"));
                userAdd.setDefault_address(rs.getBoolean("default"));
                String fullAddress = rs.getString("address");
                String[] adds = parseAddress(fullAddress);
                userAdd.setDetail_address(adds[0]);
                userAdd.setWard(adds[1]);
                userAdd.setDistrict(adds[2]);
                userAdd.setCity(adds[3]);
                addresses.add(userAdd);
            }
        } catch (SQLException ex) {
            status = "Error connection" + ex.getMessage();
        }
        return addresses;
    }

    public UserAddress getDefaultAddress(int user_id) {
        try {
            String sql = "SELECT * FROM User_Address_HE163263 WHERE user_id = ? AND [default] = 1";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, user_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                UserAddress userAdd = new UserAddress();
                userAdd.setAddress_id(rs.getInt("address_id"));
                userAdd.setUser_id(rs.getInt("user_id"));
                userAdd.setCustomer_name(rs.getString("customer_name"));
                userAdd.setPhone_number(rs.getString("phone_number"));
                userAdd.setDefault_address(rs.getBoolean("default"));
                String fullAddress = rs.getString("address");
                String[] adds = parseAddress(fullAddress);
                userAdd.setDetail_address(adds[0]);
                userAdd.setWard(adds[1]);
                userAdd.setDistrict(adds[2]);
                userAdd.setCity(adds[3]);
                return userAdd;
            }
        } catch (SQLException ex) {
            status = "Error connection" + ex.getMessage();
        }
        return null;
    }

    public boolean addAddress(int user_id, String fullName, String detail_address, String phone_number, boolean default_address) {
        try {
            String sql = "INSERT INTO User_Address_HE163263(user_id, customer_name, [address], phone_number, [default])\n"
                    + "VALUES(?,?,?,?,?)";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, user_id);
            stm.setString(2, fullName);
            stm.setString(3, detail_address);
            stm.setString(4, phone_number);
            stm.setBoolean(5, default_address);
            stm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            status = "Error connection" + ex.getMessage();
            return false;
        }
    }

    public UserAddress getAddressById(int address_id) {
        try {
            String sql = "SELECT * FROM User_Address_HE163263 WHERE address_id = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, address_id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                UserAddress userAdd = new UserAddress();
                userAdd.setAddress_id(rs.getInt("address_id"));
                userAdd.setUser_id(rs.getInt("user_id"));
                userAdd.setCustomer_name(rs.getString("customer_name"));
                userAdd.setPhone_number(rs.getString("phone_number"));
                userAdd.setDefault_address(rs.getBoolean("default"));
                String fullAddress = rs.getString("address");
                String[] adds = parseAddress(fullAddress);
                userAdd.setDetail_address(adds[0]);
                userAdd.setWard(adds[1]);
                userAdd.setDistrict(adds[2]);
                userAdd.setCity(adds[3]);
                return userAdd;
            }
        } catch (SQLException ex) {
            status = "Error connection" + ex.getMessage();
        }
        return null;
    }

    public boolean updateAddress(int address_id, String fullName, String detail_address, String phone_number, boolean default_address) {
        try {
            String sql = "UPDATE User_Address_HE163263\n"
                    + "SET customer_name = ?,\n"
                    + "[address] = ?,\n"
                    + "phone_number = ?,\n"
                    + "[default] = ?\n"
                    + "WHERE address_id = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, fullName);
            stm.setString(2, detail_address);
            stm.setString(3, phone_number);
            stm.setBoolean(4, default_address);
            stm.setInt(5, address_id);
            stm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            status = "Error connection" + ex.getMessage();
            return false;
        }
    }

    public void resetDefaultAddress(int user_id) {
        try {
            String sql = "UPDATE User_Address_HE163263\n"
                    + "SET [default] = 0\n"
                    + "WHERE [default] = 1 and user_id = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, user_id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            status = "Error connection" + ex.getMessage();
        }
    }

    public void deleteAddress(int address_id) {
        try {
            String sql = "DELETE User_Address_HE163263 WHERE address_id = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, address_id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            status = "Error connection" + ex.getMessage();
        }
    }

    private String[] parseAddress(String fullAdd) {
        String[] adds = fullAdd.split(",");
        String detail_add = "";
        String city = "";
        String district = "";
        String ward = "";
        try {
            for (int i = 0; i < adds.length - 3; i++) {
                detail_add += adds[i];
            }
            city = adds[adds.length - 1].trim();
            district = adds[adds.length - 2].trim();
            ward = adds[adds.length - 3].trim();
        } catch (Exception e) {
        }
        return new String[]{detail_add, ward, district, city};
    }

    public Token getTokenByEmail(String email) {
        String sql = "SELECT token_id, ut.user_id,token_string, created_date FROM User_Token_HE163263 ut\n"
                + "INNER JOIN User_HE163263 u ON u.user_id = ut.user_id\n"
                + "WHERE email = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Token token = new Token();
                token.setToken_id(rs.getInt("token_id"));
                token.setUser_id(rs.getInt("user_id"));
                token.setToken_string(rs.getString("token_string"));
                token.setCreated_date(rs.getTimestamp("created_date"));
                return token;
            }
        } catch (SQLException ex) {
            status = "Error connection" + ex.getMessage();
        }
        return null;
    }

    public void updateToken(Token token) {
        String sql = "UPDATE User_Token_HE163263\n"
                + "SET token_string = ?,\n"
                + "created_date = GETDATE()\n"
                + "WHERE token_id = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setTimestamp(1, token.getCreated_date());
            stm.setInt(2, token.getToken_id());
            stm.executeUpdate();
        } catch (SQLException ex) {
            status = "Error connection" + ex.getMessage();
        }
    }

    public void createToken(String email, String token) {
        String sql = "INSERT INTO User_Token_HE163263(user_id, token_string, created_date)\n"
                + "VALUES((SELECT TOP 1 USER_ID from User_HE163263 WHERE email = ?), ? , GETDATE())";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, token);
            stm.executeUpdate();
        } catch (SQLException ex) {
            status = "Error connection" + ex.getMessage();
        }
    }

    public void updateVerified(String email) {
        String sql = "UPDATE User_HE163263\n"
                + "SET verified = 1\n"
                + "WHERE email = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, email);
            stm.executeUpdate();
        } catch (SQLException ex) {
            status = "Error connection" + ex.getMessage();
        }
    }

    public void addEmailTemplate(String name, String title, String mess) {
        String sql = "INSERT INTO SendEmail_HE163263([name], title, [message])\n"
                + "VALUES (?,?,?)";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, title);
            stm.setString(3, mess);
            stm.executeUpdate();
        } catch (SQLException ex) {
            status = "Error connection" + ex.getMessage();
        }
    }

    public ArrayList<Mail> getListEmail() {
        ArrayList<Mail> mailList = new ArrayList<>();
        String sql = "SELECT * FROM SendEmail_HE163263";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Mail e = new Mail();
                e.setE_id(rs.getInt("e_id"));
                e.setName(rs.getString("name"));
                e.setTitle(rs.getString("title"));
                e.setMessage(rs.getString("message"));
                e.setCreated_at(rs.getTimestamp("created_at"));
                mailList.add(e);
            }
            return mailList;
        } catch (SQLException ex) {
            status = "Error connection" + ex.getMessage();
        }
        return null;
    }

    public Mail getTemplateByIds(int e_id) {
        String sql = "SELECT * FROM SendEmail_HE163263 WHERE e_id = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, e_id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Mail e = new Mail();
                e.setE_id(rs.getInt("e_id"));
                e.setName(rs.getString("name"));
                e.setTitle(rs.getString("title"));
                e.setMessage(rs.getString("message"));
                e.setCreated_at(rs.getTimestamp("created_at"));
                return e;
            }
        } catch (SQLException ex) {
            status = "Error connection" + ex.getMessage();
        }
        return null;
    }


    public void updateMail(String name, String title, String mess, int e_id) {
        String sql = "UPDATE SendEmail_HE163263\n"
                + "SET [name] = ?, title = ?, message = ? WHERE e_id =?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, title);
            stm.setString(3, mess);
            stm.setInt(4, e_id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            status = "Error connection" + ex.getMessage();
        }
    }
    
    public void deleteMailTemplate(int e_id) {
        String sql = "DELETE SendEmail_HE163263\n"
                + "WHERE e_id =?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, e_id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            status = "Error connection" + ex.getMessage();
        }
    }

    
    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();
//        Timestamp t = new Timestamp(System.currentTimeMillis());
//        System.out.println(userDAO.getTokenByEmail("maivandung1@gmail.com").getCreated_date());
        System.out.println(userDAO.getAddressByUser(10));
//        userDAO.updateUserStatus(1, 3);

    }
}
