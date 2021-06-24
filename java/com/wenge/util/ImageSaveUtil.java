package com.wenge.util;

import sun.misc.BASE64Decoder;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class ImageSaveUtil {
    public  static  String   save(String imgBase64,String  savePath) throws IOException {
        BASE64Decoder decoder = new BASE64Decoder();
        //Base64解码
        byte[] b = decoder.decodeBuffer(imgBase64);
        for (int i = 0; i < b.length; ++i) {
            if (b[i] < 0) {//调整异常数据
                b[i] += 256;
            }
        }
        OutputStream out = new FileOutputStream(savePath);
        out.write(b);
        out.flush();
        out.close();
        return "头像修改成功";
    }
}
