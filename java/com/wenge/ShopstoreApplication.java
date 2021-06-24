package com.wenge;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.wenge.dao")
public class ShopstoreApplication {

    public static void main(String[] args) {
        SpringApplication.run(ShopstoreApplication.class, args);
    }

}
