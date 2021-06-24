package com.wenge.dao;

import com.wenge.entity.Product;
import com.wenge.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.LinkedList;

public interface AdminDao {
    LinkedList<User> getUsersByPage(@Param("page")Integer currentpage, @Param("count") Integer everypagecount);

    LinkedList<User> getMerchantsByPage(@Param("page")Integer currentpage, @Param("count") Integer everypagecount);

    LinkedList<Product> getProductsByPage(@Param("page")Integer currentpage, @Param("count") Integer everypagecount);

    User getByState(@Param("user") User u, @Param("state") String state,@Param("freeze") String freeze);

    LinkedList<Product> getsProductByName(String name);
}
