package com.wenge.util;

import sun.misc.BASE64Decoder;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class ImageDeleteUtils {
    public  static  String   delete(String  path) throws IOException {
        File file = new File(path);
        file.delete();
        return "true";
    }
}
