package com.wenge.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
    String   name;//商品名称
    String   type;//商品类型
    Integer  price;//商品价格
    Double  discount;//商品折扣
    String   imagepath;//商品图片存放路径
    String   username;//商家名称
    String   brief;//商品简介
    String   id;//商品id
    String  state;//商品状态

    public boolean like(String text){
        if(text.equals(""))return  true;
        if (name.indexOf(text)>=0){
            return  true;
        }
        if(type.indexOf(text)>=0){
            return true;
        }
        if(username.indexOf(text)>=0){
            return  true;
        }
        return false;
    }
}
