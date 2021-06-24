package com.wenge.service.serviceimpl;

import com.wenge.config.SystemConfig;
import com.wenge.dao.ProductDao;
import com.wenge.dao.TrolleyDao;
import com.wenge.dao.UserDao;
import com.wenge.entity.Product;
import com.wenge.entity.User;
import com.wenge.service.ProductService;
import com.wenge.util.UUIDUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

@Service
public class ProductServiceImpl implements ProductService {
    @Resource
    ProductDao productDao;

    @Resource
    TrolleyDao trolleyDao;

    @Resource
    UserDao userDao;

    @Override
    public LinkedList<Product> getsByFuzzy(String text, String username) {
        LinkedList<Product> ps = productDao.getsByFuzzy(text,username);
        return ps;
    }

    @Override
    public LinkedList<Product> getsByType(String type, String username) {
        LinkedList<Product> ps = productDao.getsByType(type,username);
        return ps;
    }

    @Override
    public Integer getProductsCount() {
      return   productDao.getProductsCount();
    }

    @Override
    public LinkedList<Product> getsByUsername(String username) {
        LinkedList<Product> p = productDao.getsByUsername(username);
        return p;
    }

    @Override
    public int delete(Product p) {
        trolleyDao.deleteByProductId(p.getId());
        return productDao.delete(p) ;
    }

    @Override
    public Product get(Product p) {
        return productDao.get(p);
    }

    @Override
    public int editProduct(Product p) {
        int set = productDao.set(p);
        return set;
    }

    @Override
    public int insert(Product p) {
        p.setImagepath("/web/productimage/default.jpg");
        p.setId(UUIDUtil.getUUID());
        int insert = productDao.insert(p);
        return insert;
    }

    @Override
    public LinkedList<Product> getsByTypeByPage(String type, Integer currentpage) {
        LinkedList<Product> ps = productDao.getsByTypeByPage(type,(currentpage-1)*SystemConfig.EVERYPAGECOUNT, SystemConfig.EVERYPAGECOUNT);
        return ps;
    }

    @Override
    public LinkedList<Product> getProductsByPage(Integer currentpage) {
        return productDao.getsByPage((currentpage-1)*SystemConfig.EVERYPAGECOUNT, SystemConfig.EVERYPAGECOUNT);
    }

    @Override
    public LinkedList<Product> getsByFuzzyByPage(String text, Integer currentpage) {
        LinkedList<Product> ps = productDao.getsByFuzzyByPage(text,(currentpage-1)*SystemConfig.EVERYPAGECOUNT, SystemConfig.EVERYPAGECOUNT);
        return ps;
    }

    @Override
    public Map productDetail(Product p) {
        Map m = new HashMap();
        Product product = productDao.get(p);
        User u = new User();
        u.setUsername(product.getUsername());
        User user = userDao.get(u);
        m.put("user", user);
        m.put("product", product);
        return m;
    }

    @Override
    public Integer getsByFuzzyCount(String text) {
        return  productDao.getsByFuzzyCount(text);
    }

    @Override
    public Integer getsByTypeCount(String type) {
        return productDao.getsByTypeCount(type);
    }

    @Override
    public LinkedList<Product> getAllProducts() {
        return productDao.gets();
    }
}
