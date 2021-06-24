package com.wenge.service.serviceimpl;

import com.wenge.dao.UserDao;
import com.wenge.entity.User;
import com.wenge.service.UserService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    UserDao userDao;

    @Override
    public void set(User u) {
        int set = userDao.set(u);
    }

    @Override
    public User get(User u) {
        return userDao.get(u);
    }

    @Override
    public User regiser(User u) {
        u.setProfilepath("/web/image/default.jpg");
        u.setState("1");
        int insert = userDao.insert(u);
        if(insert==0){
            return null;
        }else {
            return  userDao.get(u);
        }
    }

    @Override
    public User checkUsernameIsExist(User u) {
        User user = userDao.get(u);
        return user;
    }

    @Override
    public User checkEmailIsExist(User u) {
        User user = userDao.getByEmail(u);
        return user;
    }

    @Override
    public User login(User u) {
        User user = userDao.login(u);
        return user;
    }
}
