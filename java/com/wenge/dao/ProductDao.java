package com.wenge.dao;

import com.wenge.entity.Product;
import org.apache.ibatis.annotations.Param;

import javax.annotation.security.PermitAll;
import java.util.LinkedList;

public interface ProductDao {

    Product get(Product p);

    int insert(Product p);

    int set(Product p);

    int  delete(Product p) ;

    LinkedList<Product> gets();

    LinkedList<Product> getsByType(@Param("type") String type,@Param("username") String username);

    LinkedList<Product> getsByFuzzy(@Param("text") String text,@Param("username") String username);

    LinkedList<Product> getsByUsername(String username);

    LinkedList<Product> getsByPage(@Param("page") Integer currentpage,@Param("count") Integer everypagecount);

    LinkedList<Product> getsByTypeByPage(@Param("type") String type, @Param("page")Integer currentpage,@Param("count") Integer everypagecount);

    LinkedList<Product> getsByFuzzyByPage(@Param("text")String text, @Param("page")Integer currentpage, @Param("count")Integer everypagecount);

    Integer getProductsCount();

    Integer getsByTypeCount(String type);

    Integer getsByFuzzyCount(String text);
}
