package com.wenge.dao;

import com.wenge.entity.User;

public interface UserDao {
    User  get(User u);
    User  getByEmail(User u);
    int insert(User u);
    int set(User u);
    User  login(User u);


}
