package com.wenge.service;

import com.wenge.entity.Product;
import com.wenge.entity.User;

import java.util.LinkedList;

public interface AdminService {
    LinkedList<User> getUsersByPage(Integer currentpage);

    LinkedList<User> getMerchantsByPage(Integer currentpage);

    LinkedList<Product> getProductsByPage(Integer currentpage);

    User getUserByState(User u, String state,String freeze);

    LinkedList<Product> getsProductByName(String name);
}
