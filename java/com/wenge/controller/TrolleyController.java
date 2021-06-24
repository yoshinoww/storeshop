package com.wenge.controller;

import com.wenge.entity.User;
import com.wenge.entity.Trolley;
import com.wenge.service.TrolleyService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("/trolley")
public class TrolleyController {

    @Resource
    TrolleyService trolleyService;

    @ResponseBody
    @RequestMapping("/addinshoptrollry")
    public  String addinshoptrollry(Trolley up, HttpSession session){
        System.out.println(up);
        User user = (User) session.getAttribute("user");
        up.setUsername(user.getUsername());
        int count=  trolleyService.addInTrollry(up);
        if(count==0){
            return "false";
        }else {
            return "true";
        }
    }

    @ResponseBody
    @RequestMapping("/getallshoppings")
    public Map getallproducts(HttpSession session){
        String username = ((User) session.getAttribute("user")).getUsername();
        Map m= trolleyService.getAllProducts(username);
        return m;
    }

    @ResponseBody
    @RequestMapping("/getshoppingsbytype")
    public Map getShoppingsByType(HttpSession session,String  type){
        String username = ((User) session.getAttribute("user")).getUsername();
        Map m= trolleyService.getsByType(type,username);
        return m;
    }


    @ResponseBody
    @RequestMapping("/getshoppingsfuzzy")
    public Map getShoppingsFuzzy(HttpSession session,String  text){
        String username = ((User) session.getAttribute("user")).getUsername();

        Map m= trolleyService.getsByFuzzy(text,username);
        return m;
    }


    @ResponseBody
    @RequestMapping("/deleteshoptrollry")
    public  String deleteshoptrollry(String  id){
        String flag= trolleyService.deleteShopTrollry(id);
        return flag;
    }

    @ResponseBody
    @RequestMapping("/savetrolleycount")
    public  String saveproductcount(Integer count,String id){
        Trolley t=trolleyService.get(id);
        t.setCount(count);
        Integer c= trolleyService.set(t);
        return "true";
    }
}
