/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class UserAddress {

    private int address_id;
    private int user_id;
    private String customer_name;
    private String detail_address;
    private String city;
    private String district;
    private String ward;
    private String phone_number;
    private boolean default_address;

    public UserAddress() {
    }

    public UserAddress(int address_id, int user_id, String customer_name, String detail_address, String city, String district, String ward, String phone_number, boolean default_address) {
        this.address_id = address_id;
        this.user_id = user_id;
        this.customer_name = customer_name;
        this.detail_address = detail_address;
        this.city = city;
        this.district = district;
        this.ward = ward;
        this.phone_number = phone_number;
        this.default_address = default_address;
    }

    public UserAddress(int address_id, int user_id, String customer_name, String full_address, String phone_number, boolean default_address) {
        this.address_id = address_id;
        this.user_id = user_id;
        this.customer_name = customer_name;
        String[] adds = parseAddress(full_address);
        this.detail_address = adds[0];
        this.ward = adds[1];
        this.district = adds[2];
        this.city = adds[3];
        this.phone_number = phone_number;
        this.default_address = default_address;
    }

    public int getAddress_id() {
        return address_id;
    }

    public String getFullAddress() {
        return detail_address + ", " + ward + ", " + district + ", " + city;
    }

    public void setAddress_id(int address_id) {
        this.address_id = address_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getCustomer_name() {
        return customer_name;
    }

    public void setCustomer_name(String customer_name) {
        this.customer_name = customer_name;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public boolean isDefault_address() {
        return default_address;
    }

    public void setDefault_address(boolean default_address) {
        this.default_address = default_address;
    }

    public String getDetail_address() {
        return detail_address;
    }

    public void setDetail_address(String detail_address) {
        this.detail_address = detail_address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }
    
    private static String[] parseAddress(String fullAdd) {
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

    @Override
    public String toString() {
        return "UserAddress{" + "address_id=" + address_id + ", user_id=" + user_id + ", customer_name=" + customer_name + ", detail_address=" + detail_address + ", city=" + city + ", district=" + district + ", ward=" + ward + ", phone_number=" + phone_number + ", default_address=" + default_address + '}';
    }
    public static void main(String[] args) {
        UserAddress u = new UserAddress(0, 0, "long", "fadf,dfa,,fsadd,Halong", "123456", true);
        System.out.println(u);
        System.out.println(u.getDetail_address());
        System.out.println(u.getCity());
        System.out.println(u.getDetail_address());
    }

}
