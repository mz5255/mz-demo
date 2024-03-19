package com.mz.config;

import java.text.SimpleDateFormat;
import java.util.Date;

public class IdUtil {
    public static String getId(Long id){
        return "MT-"+new SimpleDateFormat("yyyyMMdd").format(new Date())+"-"+id;
    }
}
