package com.wenge.controller;

import com.wenge.config.SystemConfig;
import com.wenge.entity.Product;
import com.wenge.entity.Trolley;
import com.wenge.entity.User;
import com.wenge.service.ProductService;
import com.wenge.service.TrolleyService;
import com.wenge.util.ImageDeleteUtils;
import com.wenge.util.ImageSaveUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Resource
    ProductService productService;

    @Resource
    TrolleyService trolleyService;

    @ResponseBody
    @RequestMapping("/getallproducts")
    public LinkedList<Product>  getallproducts(){
        LinkedList<Product> l= productService.getAllProducts();
        return  l;
    }
    @ResponseBody
    @RequestMapping("/getallproductsbypage")
    public    HashMap  getallproductsbypage(Integer currentpage){
        LinkedList<Product> l= productService.getProductsByPage(currentpage);
        if (l.size()==0){
            return null;
        }
        Integer count=productService.getProductsCount();
        Integer c=count/ SystemConfig.EVERYPAGECOUNT;
        if(count%SystemConfig.EVERYPAGECOUNT!=0){
            c++;
        }
        HashMap map=new HashMap();
        map.put("products",l);
        map.put("count",c);
        return  map;

    }
    @ResponseBody
    @RequestMapping("/searchbyselect")
    public LinkedList<Product>  searchbyselect(HttpSession session,String type){
        if (("全部商品").equals(type)){
            User user = (User) session.getAttribute("user");
            LinkedList<Product>  lp= productService.getsByUsername(user.getUsername());
            return lp;
        }
        User user = (User) session.getAttribute("user");
        String username = user.getUsername();
        LinkedList<Product> ps= productService.getsByType(type,username);
        return  ps;
    }
    @ResponseBody
    @RequestMapping("/searchbyselectbypage")
    public HashMap  searchbyselectbypage(String type,Integer currentpage){
        HashMap map=new HashMap();

        if (type.equals("全部商品")||type.equals("")){
            LinkedList<Product> products = productService.getProductsByPage(currentpage);
            if (products.size()==0){
                return null;
            }
            Integer count=productService.getProductsCount();
            Integer c=count/SystemConfig.EVERYPAGECOUNT;
            if(count%SystemConfig.EVERYPAGECOUNT!=0){
                c++;
            }
            map.put("products",products);
            map.put("count",c);
            System.out.println(c);
            return  map;
        }
        LinkedList<Product> ps= productService.getsByTypeByPage(type,currentpage);
        if (ps.size()==0){
            return null;
        }
        Integer count=productService.getsByTypeCount(type);
        Integer c=count/ SystemConfig.EVERYPAGECOUNT;
        if(count%SystemConfig.EVERYPAGECOUNT!=0){
            c++;
        }
        map.put("products",ps);
        map.put("count",c);
        return  map;
    }
    @ResponseBody
    @RequestMapping("/searchbyinput")
    public LinkedList<Product>  searchbyinput(HttpSession session,String text){
        User user = (User) session.getAttribute("user");
        String username = user.getUsername();
        LinkedList<Product> ps= productService.getsByFuzzy(text,username);
        return  ps;
    }
    @ResponseBody
    @RequestMapping("/searchbyinputbypage")
    public HashMap  searchbyinputbypage(String text,Integer currentpage){
        LinkedList<Product> ps= productService.getsByFuzzyByPage(text,currentpage);
        if (ps.size()==0){
            return null;
        }
        Integer count= productService.getsByFuzzyCount(text);
        Integer c=count/ SystemConfig.EVERYPAGECOUNT;
        if(count%SystemConfig.EVERYPAGECOUNT!=0){
            c++;
        }
        HashMap map=new HashMap();
        map.put("count",c);
        map.put("products",ps);
        return  map;
    }
    @ResponseBody
    @RequestMapping("/productdetail")
    public Map productDetail(Product p){
        Map m= productService.productDetail(p);
        return  m;
    }
    @ResponseBody
    @RequestMapping("/getbyusername")
    public LinkedList<Product> getbyusername(HttpSession session){
        User user = (User) session.getAttribute("user");
        LinkedList<Product>  lp= productService.getsByUsername(user.getUsername());
        return lp;
    }
    @ResponseBody
    @RequestMapping("/addproduct")
    public String addProduct(Product p,HttpSession session){
        User u=(User) session.getAttribute("user");
        String username = u.getUsername();
        p.setUsername(username);
        p.setState("1");
        System.out.println(p);
        int insert = productService.insert(p);
        if (insert==0){
            return "false";
        }else {
            return "true";
        }
    }
    @ResponseBody
    @RequestMapping("/editproduct")
    public String editProduct(Product p){
        int insert = productService.editProduct(p);
        if (insert==0){
            return "false";
        }else {
            return "true";
        }
    }
    @ResponseBody
    @RequestMapping("/getproduct")
    public Product getProduct(String  id){
        Product p=new Product();
        p.setId(id);
       Product product=  productService.get(p);
       return  product;
    }
    @ResponseBody
    @RequestMapping("/deleteproduct")
    public String deleteProduct(String  id) throws IOException {
        Product p=new Product();
        p.setId(id);
        int count=  productService.delete(p);
        Integer i= trolleyService.deleteById(id);
        ImageDeleteUtils.delete("D:\\IDEA\\springboot\\shopstore\\shopstore\\target\\classes\\static\\productimage\\"+id+".jpg");
        ImageDeleteUtils.delete("D:\\IDEA\\springboot\\shopstore\\shopstore\\src\\main\\resources\\static\\productimage\\" + id + ".jpg");
        if (count==0){
            return "false";
        }else {
            return "true";
        }

    }
    @ResponseBody
    @RequestMapping("/changeproductimage")
    public String changeProductImage(String imgBase64, String id) throws Exception {
        System.out.println(imgBase64);
        if (imgBase64 == null) {
            return "更改失败!";
        }
        imgBase64 = imgBase64.split(",")[1];
        String savePath = "D:\\IDEA\\springboot\\shopstore\\shopstore\\src\\main\\resources\\static\\productimage\\" + id + ".jpg";
        Product p=new Product();
        p.setId(id);
        p.setImagepath("/web/productimage/"+id+".jpg");
        productService.editProduct(p);
        ImageSaveUtil.save(imgBase64, savePath);
        ImageSaveUtil.save(imgBase64,"D:\\IDEA\\springboot\\shopstore\\shopstore\\target\\classes\\static\\productimage\\"+id+".jpg");
        return "success!";
    }




}
