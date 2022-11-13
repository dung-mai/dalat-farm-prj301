/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.RoundingMode;
import java.sql.Date;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class Product {

    private int product_id;
    private String name;
    private boolean status;
    private int quantity;
    private String unit;
    private int unitprice;
    private int promotion_price;
    private String thumbnail;
    private ArrayList<String> images;
    private String detail;
    private float rating;
    private String tags;
    private int viewcount;
    private Date hot;
    private int cate_id;
    private int supplier_id;
    private Date created_at;
    private int created_by;
    private Date updated_at;
    private int updated_by;

    public Product(int product_id, String name, boolean status, int quantity, String unit, int unitprice, int promotion_price, String thumbnail, ArrayList<String> images, String detail, float rating, String tags, int viewcount, Date hot, int cate_id, int supplier_id, Date created_at, int created_by, Date updated_at, int updated_by) {
        this.product_id = product_id;
        this.name = name;
        this.status = status;
        this.quantity = quantity;
        this.unit = unit;
        this.unitprice = unitprice;
        this.promotion_price = promotion_price;
        this.thumbnail = thumbnail;
        this.images = images;
        this.detail = detail;
        this.rating = rating;
        this.tags = tags;
        this.viewcount = viewcount;
        this.hot = hot;
        this.cate_id = cate_id;
        this.supplier_id = supplier_id;
        this.created_at = created_at;
        this.created_by = created_by;
        this.updated_at = updated_at;
        this.updated_by = updated_by;
    }

    public Product(int product_id, String name, int quantity, int promotion_price) {
        this.product_id = product_id;
        this.name = name;
        this.quantity = quantity;
        this.promotion_price = promotion_price;

    }

    public Product(String name, int quantity, String unit, int unitprice, int promotion_price, String thumbnail, String detail, String tags, Date hot, int cate_id, int supplier_id) {
        this.name = name;
        this.quantity = quantity;
        this.unit = unit;
        this.unitprice = unitprice;
        this.promotion_price = promotion_price;
        this.thumbnail = thumbnail;
        this.detail = detail;
        this.tags = tags;
        this.hot = hot;
        this.cate_id = cate_id;
        this.supplier_id = supplier_id;
    }

    public Product() {
        images = new ArrayList<>();
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public int getUnitprice() {
        return unitprice;
    }

    public void setUnitprice(int unitprice) {
        this.unitprice = unitprice;
    }

    public int getPromotion_price() {
        return promotion_price;
    }

    public void setPromotion_price(int promotion_price) {
        this.promotion_price = promotion_price;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        DecimalFormat df = new DecimalFormat("0.0");
        df.setRoundingMode(RoundingMode.UP);
        this.rating = Float.parseFloat(df.format(rating));
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public int getViewcount() {
        return viewcount;
    }

    public void setViewcount(int viewcount) {
        this.viewcount = viewcount;
    }

    public Date getHot() {
        return hot;
    }

    public void setHot(Date hot) {
        this.hot = hot;
    }

    public int getCate_id() {
        return cate_id;
    }

    public void setCate_id(int cate_id) {
        this.cate_id = cate_id;
    }

    public int getSupplier_id() {
        return supplier_id;
    }

    public void setSupplier_id(int supplier_id) {
        this.supplier_id = supplier_id;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public int getCreated_by() {
        return created_by;
    }

    public void setCreated_by(int created_by) {
        this.created_by = created_by;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at;
    }

    public int getUpdated_by() {
        return updated_by;
    }

    public void setUpdated_by(int updated_by) {
        this.updated_by = updated_by;
    }

    public List<String> getImages() {
        return images;
    }

    public void setImages(ArrayList<String> images) {
        this.images = images;
    }

    public void getImagesFromDescription() {
        if (thumbnail != null) {
            images.add(thumbnail);
        }
        String start = "src=\"";
        int index = detail.indexOf(start);
        int endindex;
        while (index >= 0) {
            if (!detail.substring(index).contains(start)) {
                break;
            }
            endindex = detail.indexOf("\"", index + 5);
            images.add(detail.substring(index + 5, endindex));
            index = detail.indexOf(start, endindex + 1);
        }
    }

    @Override
    public String toString() {
        return "Product{" + "product_id=" + product_id + ", name=" + name + ", unitprice=" + unitprice + ", promotion_price=" + promotion_price + ", hot=" + hot + '}' + rating;
    }

}
