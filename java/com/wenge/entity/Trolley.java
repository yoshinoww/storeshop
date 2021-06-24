package com.wenge.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Trolley {
    private String  username;//购物商家名称
    private  String  productid;//商品id
    private  Integer  count;//购物商品数量
    private  String  id;//购物商品id
}