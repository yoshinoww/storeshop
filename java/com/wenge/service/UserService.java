package com.wenge.service;

import com.wenge.entity.User;

public interface UserService {
    User login(User u);

    User checkUsernameIsExist(User u);

    User checkEmailIsExist(User u);

    User regiser(User u);

    void set(User u);

    User get(User u);
}
