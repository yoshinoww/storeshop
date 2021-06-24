package com.wenge.controller;

import com.wenge.entity.User;
import com.wenge.entity.VerifyCode;
import com.wenge.service.serviceimpl.SimpleCharVerifyCodeGenImpl;
import com.wenge.service.UserService;
import com.wenge.util.EmailUtil;
import com.wenge.util.ImageSaveUtil;
import com.wenge.util.RandomUtils;
import com.wenge.util.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.misc.BASE64Encoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @Resource
    UserService userService;

    @ResponseBody
    @RequestMapping("/login")
    public String login(User u, String code,String uuid, HttpServletRequest request) {
        User user = userService.login(u);
        String s = stringRedisTemplate.opsForValue().get(uuid);
        if (s==null)
        {
            return "code-failed";
        }
        if (!code.toUpperCase().equals( s.toUpperCase())){
            return "error-code";
        }
        if (user == null) {
            return "false";
        }
        if(user.getState().equals("0")||user.getState().equals("00")){
            return "error-freeze";
        }
            request.getSession().setAttribute("user", user);
            return "true";
    }
    @ResponseBody
    @RequestMapping("/checkusernameisexist")
    public String checkUsernameIsExist(User u) {
        User user = userService.checkUsernameIsExist(u);
        if (user == null) {
            return "false";
        } else {
            return "true";
        }
    }
    @ResponseBody
    @RequestMapping("/checkemailisexist")
    public String checkEmailIsExist(User u) {
        User user = userService.checkEmailIsExist(u);
        if (user == null) {
            return "false";
        } else {
            return "true";
        }
    }
    @ResponseBody
    @RequestMapping("/register")
    public String register(User u, String code,String codeid,  HttpServletRequest request) {
        String redisCode = stringRedisTemplate.opsForValue().get(codeid);
        if(!code.equals(redisCode)){
            return "code-error";
        }
        User user = userService.regiser(u);
        if (user == null) {
            return "false";
        } else {
            return "true";
        }
    }
    @ResponseBody
    @RequestMapping("/changeuserprofile")
    public String changeuserprofile(String imgBase64, HttpSession session) throws Exception {
        if (imgBase64 == null) {
            return "更改失败!";
        }
        imgBase64 = imgBase64.split(",")[1];
        String username = ((User) session.getAttribute("user")).getUsername();
        String savePath = "D:\\IDEA\\springboot\\shopstore\\shopstore\\src\\main\\resources\\static\\profileimage\\" + username + ".jpg";
        ImageSaveUtil.save(imgBase64, savePath);
        ImageSaveUtil.save(imgBase64,"D:\\IDEA\\springboot\\shopstore\\shopstore\\target\\classes\\static\\profileimage\\"+username+".jpg");
        User user = (User) session.getAttribute("user");
        user.setProfilepath("/web/profileimage/" + username + ".jpg");
        userService.set(user);
        //session.setAttribute("user", user);
        return "/web/profileimage/" + username + ".jpg";
    }
    @ResponseBody
    @RequestMapping("/changebackground")
    public String changebackground(String imgBase64, HttpSession session) throws Exception {
        if (imgBase64 == null) {
            return "更改失败!";
        }
        imgBase64 = imgBase64.split(",")[1];
        String username = ((User) session.getAttribute("user")).getUsername();
        String savePath = "D:\\IDEA\\springboot\\shopstore\\shopstore\\src\\main\\resources\\static\\backgroundimage\\" + username + ".jpg";
        ImageSaveUtil.save(imgBase64, savePath);
        ImageSaveUtil.save(imgBase64,"D:\\IDEA\\springboot\\shopstore\\shopstore\\target\\classes\\static\\backgroundimage\\"+username+".jpg");

        User user = (User) session.getAttribute("user");
        user.setBackgroundpath("/web/backgroundimage/" + username + ".jpg");
        userService.set(user);
        //session.setAttribute("user", user);
        return "/web/backgroundimage/" + username + ".jpg";
    }
    @ResponseBody
    @RequestMapping("/edituserinfo")
    public String editUserInfo(User u,HttpSession session){
        System.out.println(u);
        if (u.getGender().equals("")){
            u.setGender(null);
        }
        User user = (User) session.getAttribute("user");
        user.setGender(u.getGender());
        user.setSignature(u.getSignature());
        userService.set(user);
        return "true";
    }
    @RequestMapping("/exit")
    public  String  exit(HttpSession session){
        session.invalidate();
        return "redirect:/index.jsp";
    }

    @ResponseBody
    @GetMapping("/verifycode")
    public Map verifyCode(HttpServletRequest request, HttpServletResponse response) {
        SimpleCharVerifyCodeGenImpl iVerifyCodeGen = new SimpleCharVerifyCodeGenImpl();
            //设置长宽
            VerifyCode verifyCode = iVerifyCodeGen.generate(80, 28);
            String code = verifyCode.getCode();
            //设置响应头
            response.setHeader("Pragma", "no-cache");
            //设置响应头
            response.setHeader("Cache-Control", "no-cache");
            //在代理服务器端防止缓冲
            response.setDateHeader("Expires", 0);
            //设置响应内容类型
            BASE64Encoder encoder=new BASE64Encoder();
            String encode = encoder.encode(verifyCode.getImgBytes());
            Map m=new HashMap();
            m.put("base64",encode);
            String uuid= UUIDUtil.getUUID();
            stringRedisTemplate.opsForValue().set(uuid,code,300,TimeUnit.SECONDS);
            m.put("uuid",uuid);
            return m;
    }
    @ResponseBody
    @RequestMapping("/sendemailcode")
    public  String sendEmailCode(String email) throws Exception {
        String code = RandomUtils.randomString(6);
        String uuid=UUIDUtil.getUUID();
        stringRedisTemplate.opsForValue().set(uuid,code,400,TimeUnit.SECONDS);
        EmailUtil.sendMail(email,"文哥网站用户注册","您好，您的注册码为:<strong>"+code+"</strong>请不要泄露给其他人");
        return uuid;
    }
}
