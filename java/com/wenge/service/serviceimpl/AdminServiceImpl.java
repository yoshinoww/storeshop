package com.wenge.service.serviceimpl;

import com.wenge.config.SystemConfig;
import com.wenge.dao.AdminDao;
import com.wenge.dao.ProductDao;
import com.wenge.dao.TrolleyDao;
import com.wenge.dao.UserDao;
import com.wenge.entity.Product;
import com.wenge.entity.User;
import com.wenge.service.AdminService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.LinkedList;

@Service
public class AdminServiceImpl implements AdminService {


    @Resource
    TrolleyDao trolleyDao;

    @Resource
    UserDao userDao;

    @Resource
    ProductDao productDao;

    @Resource
    AdminDao adminDao;

    @Override
    public LinkedList<User> getUsersByPage(Integer currentpage) {
      LinkedList<User> l= adminDao.getUsersByPage((currentpage-1)* SystemConfig.ADMINEUSERPAGECOUNT,SystemConfig.ADMINEUSERPAGECOUNT);
      return  l;
    }

    @Override
    public LinkedList<Product> getsProductByName(String name) {
       return   adminDao.getsProductByName(name);
    }

    @Override
    public User getUserByState(User u, String state,String freeze) {
        return  adminDao.getByState(u,state,freeze);
    }

    @Override
    public LinkedList<User> getMerchantsByPage(Integer currentpage) {
        LinkedList<User> l= adminDao.getMerchantsByPage((currentpage-1)* SystemConfig.ADMINEUSERPAGECOUNT,SystemConfig.ADMINEUSERPAGECOUNT);
        return  l;
    }

    @Override
    public LinkedList<Product> getProductsByPage(Integer currentpage) {
        LinkedList<Product> l= adminDao.getProductsByPage((currentpage-1)* SystemConfig.ADMINEPRODUCTPAGECOUNT,SystemConfig.ADMINEPRODUCTPAGECOUNT);
        return  l;
    }






}
