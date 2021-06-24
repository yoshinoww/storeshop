package com.wenge.controller;

import com.wenge.entity.Product;
import com.wenge.entity.User;
import com.wenge.service.AdminService;
import com.wenge.service.ProductService;
import com.wenge.service.TrolleyService;
import com.wenge.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.LinkedList;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Resource
    AdminService adminService;
    @Resource
    UserService userService;
    @Resource
    ProductService productService;
    @Resource
    TrolleyService trolleyService;
    @ResponseBody
    @RequestMapping("/getusersbypage")
    public LinkedList<User> getusersbypage(Integer currentuserpage) {
        LinkedList<User> usersByPage = adminService.getUsersByPage(currentuserpage);
        if (usersByPage.size() == 0) {
            return null;
        }
        return usersByPage;
    }
    @ResponseBody
    @RequestMapping("/getmerchantsbypage")
    public LinkedList<User> getmerchantsbypage(Integer currentmerchantpage) {
        LinkedList<User> usersByPage = adminService.getMerchantsByPage(currentmerchantpage);
        if (usersByPage.size()==0){
            return null;
        }
        return usersByPage;
    }
    @ResponseBody
    @RequestMapping("/getproductsbypage")
    public LinkedList<Product> getproductsbypage(Integer currentproductpage) {
        LinkedList<Product> l = adminService.getProductsByPage(currentproductpage);
        if (l.size() == 0) {
            return null;
        }
        return l;
    }
    @ResponseBody
    @RequestMapping("/getuserbyname")
    public User getuserbyname(User u){
        return adminService.getUserByState(u,"1","0");
    }
    @ResponseBody
    @RequestMapping("/getmerchantbyname")
    public User getmerchantbyname(User u){
        return adminService.getUserByState(u,"2","00");
    }
    @ResponseBody
    @RequestMapping("/getproductbyname")
    public LinkedList<Product> getproductbyname(String name){
       return    adminService.getsProductByName(name);
    }
    @ResponseBody
    @RequestMapping("/freezeuserstate")
    public String freezestate(User u){
        User user = userService.get(u);
        user.setState(u.getState());
        userService.set(user);
        return "true";
    }
    @ResponseBody
    @RequestMapping("/activeuserstate")
    public String activeuserstate(User u){
        User user = userService.get(u);
        user.setState(u.getState());
        userService.set(user);
        return "true";
    }
    @ResponseBody
    @RequestMapping("/upuserstate")
    public String upuserstate(User u){
        User user = userService.get(u);
        user.setState(u.getState());
        userService.set(user);
        return "true";
    }
    @ResponseBody
    @RequestMapping("/freezemerchantstate")
    public String freezemerchantstate(User u){
        User user = userService.get(u);
        user.setState(u.getState());
        userService.set(user);
        return "true";
    }
    @ResponseBody
    @RequestMapping("/activemerchantstate")
    public String activemerchantstate(User u){
        User user = userService.get(u);
        user.setState(u.getState());
        userService.set(user);
        return "true";
    }
    @ResponseBody
    @RequestMapping("/downmerchantstate")
    public String downmerchantstate(User u){
        User user = userService.get(u);
        user.setState(u.getState());
        userService.set(user);
        return "true";
    }
    @ResponseBody
    @RequestMapping("/freezeproductstate")
    public String freezeproductstate(Product p){
        Product product = productService.get(p);
        product.setState(p.getState());
        productService.editProduct(product);
        return "true";
    }
    @ResponseBody
    @RequestMapping("/activeproductstate")
    public String activeproductstate(Product p){
        Product product = productService.get(p);
        product.setState(p.getState());
        productService.editProduct(p);
        return "true";
    }

}
