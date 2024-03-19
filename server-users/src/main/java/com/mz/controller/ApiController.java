package com.mz.controller;

import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

/**
 * @author 马震
 * @version 1.0
 * @date 2024/3/13 13:46
 */
@RestController
@RequestMapping("api")
public class ApiController {


    // 手机归属地查询接口地址
    public static String API_URL = "http://apis.juhe.cn/mobile/get";
    // 接口请求Key
    public static String API_KEY = "141274809390f1809d2fc3297d8e2fcb";





    @GetMapping("getCity")
    public Map<String,Object> getTel(String mobile) {
        Map<String, Object> params = new HashMap<>();//组合参数
        Map<String,Object> map =new HashMap<>();
        params.put("phone", mobile);
        params.put("key", API_KEY);
        String queryParams = urlencode(params);

        String response = doGet(API_URL, queryParams);
        try {
            JSONObject jsonObject = JSONUtil.parseObj(response);
            int error_code = jsonObject.getInt("error_code");
            if (error_code == 0) {
                System.out.println("调用接口成功");

                JSONObject result = jsonObject.getJSONObject("result");


                map.put("province",result.getStr("province"));
                map.put("city",result.getStr("city"));
                map.put("areacode",result.getStr("areacode"));
                map.put("zip",result.getStr("zip"));
                map.put("company",result.getStr("company"));

            } else {
                System.out.println("调用接口失败：" + jsonObject.getStr("reason"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return map;

    }
    /**
     * get方式的http请求
     *
     * @param httpUrl 请求地址
     * @return 返回结果
     */
    public static String doGet(String httpUrl, String queryParams) {
        HttpURLConnection connection = null;
        InputStream inputStream = null;
        BufferedReader bufferedReader = null;
        String result = null;// 返回结果字符串
        try {
            // 创建远程url连接对象
            URL url = new URL(new StringBuffer(httpUrl).append("?").append(queryParams).toString());
            // 通过远程url连接对象打开一个连接，强转成httpURLConnection类
            connection = (HttpURLConnection) url.openConnection();
            // 设置连接方式：get
            connection.setRequestMethod("GET");
            // 设置连接主机服务器的超时时间：15000毫秒
            connection.setConnectTimeout(5000);
            // 设置读取远程返回的数据时间：60000毫秒
            connection.setReadTimeout(6000);
            // 发送请求
            connection.connect();
            // 通过connection连接，获取输入流
            if (connection.getResponseCode() == 200) {
                inputStream = connection.getInputStream();
                // 封装输入流，并指定字符集
                bufferedReader = new BufferedReader(new InputStreamReader(inputStream, StandardCharsets.UTF_8));
                // 存放数据
                StringBuilder sbf = new StringBuilder();
                String temp;
                while ((temp = bufferedReader.readLine()) != null) {
                    sbf.append(temp);
                    sbf.append(System.getProperty("line.separator"));
                }
                result = sbf.toString();
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // 关闭资源
            if (null != bufferedReader) {
                try {
                    bufferedReader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (null != inputStream) {
                try {
                    inputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                connection.disconnect();// 关闭远程连接
            }
        }
        return result;
    }

    /**
     * 将map型转为请求参数型
     *
     * @param data
     * @return
     */
    public static String urlencode(Map<String, ?> data) {
        StringBuilder sb = new StringBuilder();
        for (Map.Entry<String, ?> i : data.entrySet()) {
            try {
                sb.append(i.getKey()).append("=").append(URLEncoder.encode(i.getValue() + "", "UTF-8")).append("&");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        String result = sb.toString();
        result = result.substring(0, result.lastIndexOf("&"));
        return result;
    }
}
