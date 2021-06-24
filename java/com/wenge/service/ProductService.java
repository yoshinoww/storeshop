package com.wenge.service;

import com.wenge.entity.Product;

import java.util.LinkedList;
import java.util.Map;

public interface ProductService {
    LinkedList<Product> getAllProducts();

    LinkedList<Product> getsByType(String type, String username);

    LinkedList<Product> getsByFuzzy(String text, String username);

    Map productDetail(Product p);

    int insert(Product p);

    LinkedList<Product> getsByUsername(String username);

    int editProduct(Product p);

    Product get(Product p);

    int delete(Product p);

    LinkedList<Product> getProductsByPage(Integer currentpage);

    LinkedList<Product> getsByTypeByPage(String type, Integer currentpage);

    LinkedList<Product> getsByFuzzyByPage(String text, Integer currentpage);

    Integer getProductsCount();

    Integer getsByTypeCount(String type);

    Integer getsByFuzzyCount(String text);
}
