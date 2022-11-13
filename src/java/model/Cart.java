/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import controller.base.Utility;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public final class Cart {

    private ArrayList<Item> cart;

    public Cart() {
        cart = new ArrayList<>();
    }

    public Cart(ArrayList<Item> cart) {
        this.cart = cart;
    }

    /**
     * Constructor to create Cart form String cookie (product-list)
     *
     * @param txt
     * @param list
     */
    public Cart(String txt, ArrayList<Product> list) {
        cart = new ArrayList<Item>();
        if (txt != null && txt.length() != 0) {
            String[] raw_ItemList = txt.split("-");
            for (String raw_item : raw_ItemList) {
                String[] item = raw_item.split(":");

                // check các sub string từ cart có hợp lệ (2 field ) thì mới tiếp tục xử lí
                if (item.length == 2) {
                    //try catch number format exception -- validate string cookie if changed - not valid
                    try {
                        int id = Integer.parseInt(item[0]);
                        int quantity = Integer.parseInt(item[1]);
                        if (quantity > 0) {
                            Product p = getProductById(id, list);
                            Item i = new Item(p, quantity);
                            addItem(i);
                        }
                    } catch (NumberFormatException numberFormatException) {

                    }
                }
            }
        }

    }

    public ArrayList<Item> getCart() {
        return cart;
    }

    public void setCart(ArrayList<Item> cart) {
        this.cart = cart;
    }

    private Item getItemById(int id) {
        for (Item i : cart) {
            if (i.getProduct().getProduct_id() == id) {
                return i;
            }
        }
        return null;
    }

    public int getQuantityById(int id) {
        return getItemById(id).getQuantity();
    }

    /**
     * *
     * Add item - (check if item exist -> update quantity OR create new)
     *
     * @param i
     */
    public final void addItem(Item i) {
        if (i.getQuantity() != 0) { //check if Item has quantity #0
            if (getItemById(i.getProduct().getProduct_id()) != null) {  // IF ITEM HAS EXIST
                Item existItem = getItemById(i.getProduct().getProduct_id());
                existItem.setQuantity(existItem.getQuantity() + i.getQuantity());
                if (existItem.getQuantity() <= 0) {
                    cart.remove(i);
                }
            } else {  // IF ITEM NOT EXIST
                if (i.getQuantity() > 0) {  // IF QUANTYTY > 0
                    cart.add(i);
                }
            }
        }
    }

    public void removeItem(int id) {
        if (getItemById(id) != null) {
            cart.remove(getItemById(id));
        }
    }

    /**
     * *
     * Remove item from cart after order
     *
     * @param buy_list
     */
    public void removeBuyedItem(Cart buy_list) {
        for (int i = 0; i < buy_list.getCart().size(); i++) {
            removeItem(buy_list.getCart().get(i).getProduct().getProduct_id());
        }
    }

    /**
     * *
     * Get total Money of current list product
     *
     * @return
     */
    public int getTotalMoney() {
        int total = 0;
        for (Item i : cart) {
            if (i.getProduct().getQuantity() > 0) {
                total += i.getQuantity() * i.getProduct().getPromotion_price();
            }
        }
        return total;
    }

    public Product getProductById(int id, ArrayList<Product> list) {
        for (Product p : list) {
            if (p.getProduct_id() == id) {
                return p;
            }
        }
        return null;
    }

    public Cart getBuyListFromCart(String[] raw_itemIdList) {
        Cart purchase_cart = new Cart();
        int[] itemIdList = Utility.stringArrToIntArr(raw_itemIdList);
        for (int i : itemIdList) {
            Item item = getItemById(i);
            if (item.getProduct().getQuantity() > 0) {
                purchase_cart.addItem(item);
            }
        }
        return purchase_cart;
    }

    public String cartToStringCookie() {
        String raw_cart = "";
        if (!cart.isEmpty()) {
            raw_cart = cart.get(0).getProduct().getProduct_id() + ":"
                    + cart.get(0).getQuantity();
            for (int i = 1; i < cart.size(); i++) {
                if (cart.get(i).getQuantity() > 0) {
                    raw_cart += "-" + cart.get(i).getProduct().getProduct_id() + ":" + cart.get(i).getQuantity();
                }
            }
        }
        return raw_cart;
    }
}
