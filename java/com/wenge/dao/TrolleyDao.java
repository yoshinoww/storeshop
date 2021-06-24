package com.wenge.dao;

import com.wenge.entity.Product;
import com.wenge.entity.Trolley;
import org.apache.ibatis.annotations.Param;

import java.util.LinkedList;

public interface TrolleyDao {
    int insert(Trolley up);

    LinkedList<Trolley> getsByUsername(String username);

    int delete(String id);

     int deleteByProductId(String productid);

    Trolley get(String id);

    Integer set(Trolley t);
}
