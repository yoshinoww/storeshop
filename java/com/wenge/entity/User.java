package com.wenge.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    String    username;//用户名称
    String    password;//用户密码
    String    email;//用户邮箱
    String    signature;//用户简介
    String    gender;//用户性别
    String    profilepath;//用户头像存放路径
    String   backgroundpath;//用户背景图片存放路径
    String    state;//用户状态

    public User(String username, String password, String email) {
        this.username = username;
        this.password = password;
        this.email = email;
    }
}
