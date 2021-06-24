package com.wenge.service;

import com.wenge.entity.Product;
import com.wenge.entity.Trolley;

import java.util.LinkedList;
import java.util.Map;

public interface TrolleyService {
    int addInTrollry(Trolley up);

    Map getAllProducts(String username);

    String deleteShopTrollry(String id);

    Map getsByType(String type,String username);

    Map getsByFuzzy(String text,String username);

    Trolley get(String id);

    Integer set(Trolley t);

    Integer deleteById(String id);
}
