package com.mz.controller;

import java.awt.*;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.hutool.core.date.DateUtil;
import cn.hutool.extra.qrcode.QrCodeUtil;
import cn.hutool.extra.qrcode.QrConfig;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.github.pagehelper.PageInfo;
import com.mz.common.QueryParam;
import com.mz.common.R;
import com.mz.config.ZzyConfig;
import com.mz.domain.User;
import com.mz.service.UserService;
import com.xxl.job.core.handler.annotation.XxlJob;
import com.zhenzi.sms.ZhenziSmsClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.*;
import java.util.stream.Collectors;

@RequestMapping("user")
@RestController
@CrossOrigin
public class UserController {
    @Autowired
    UserService service;
    @Autowired
    JavaMailSender javaMailSender;
    @Autowired
    HttpServletResponse response;

    @GetMapping("userList")
    public List<User> getUsers(){
        return service.list();
    }

    @PostMapping("list")
    public R getListUsers(@RequestBody QueryParam param){
        if (param.getPageNum() == null){
            return R.fail("当前页不能为空");
        }
        if (param.getPageSize() == null){
            return R.fail("分页大小不能为空");
        }
        PageInfo<User> info =service.selectUserList(param);
        return R.success(info);
    }

    @PostMapping("addUser")
    public R addUser(@RequestBody User user){
        if (user.getUserName()==null || user.getUserName().trim().equals("")){
            return R.fail("用户名不能为空");
        }
        if (user.getNickName()==null || user.getNickName().equals("")){
            return R.fail("昵称不能为空");
        }
        if (user.getSex() == null || user.getSex().equals("")){
            return  R.fail("性别不能为空");
        }
        return R.success(service.save(user));
    }

    @DeleteMapping("deleteUser")
    public R deleteUser(@RequestParam("userId") Long userId){
        User userDB = service.getById(userId);
        if (userDB.getDelFlag().equals("0")){
            return R.fail("当前用户已被删除，请勿重复操作");
        }
        service.deleteUser(userId);
        return R.success();
    }

    @PutMapping("updateUser")
    public R updateUser(@RequestBody User user){
        if (user.getUserId() == null){
            return R.fail("请选择要修改的的用户");
        }
        if (user.getUserName().trim() == null || user.getUserName().trim().equals("")){
            return R.fail("新的用户名不能为空");
        }
        if (user.getNickName().trim()==null || user.getNickName().trim().equals("")){
            return R.fail("新的昵称不能为空");
        }
        if (user.getSex().equals("") || user.getSex()==null){
            return R.fail("性别不能为空");
        }
        return R.success(service.updateById(user));
    }

    @GetMapping("bar")
    public R bar(){
        List<User> list = service.list();

        Map<String, Long> bar = list.stream().collect(Collectors.groupingBy(User::getSex, Collectors.counting()));

        Map<String,Object> result = new HashMap<>();

        List<String> x = new ArrayList<>();

        List<Long> y = new ArrayList<>();

        bar.forEach((sex,count)-> {
            if (sex.equals("0")){
                x.add("男");
                y.add(count);
            }else {
                x.add("女");
                y.add(count);
            }
        });

        result.put("x",x);
        result.put("y",y);
        return R.success(result);
    }

    @GetMapping("line")
    public R line(){
        List<User> list = service.list();

        Map<String,Object> result = new HashMap<>();

        List<Integer> x = new ArrayList<>();
        List<Long> y = new ArrayList<>();

        Map<Integer, Long> line = list.stream()
                .collect(Collectors.groupingBy(user -> DateUtil.year(user.getCreateTime()), Collectors.counting()));

        line.forEach((year,count)->{
            x.add(year);
            y.add(count);
        });

        result.put("x",x);
        result.put("y",y);
        return R.success(result);
    }

    @XxlJob("handlerJob")
//    @Scheduled(cron = "0 0 8 * * ?")
    public void schedule(){
        ZhenziSmsClient client = new ZhenziSmsClient(ZzyConfig.APIURL,ZzyConfig.APPID,ZzyConfig.APPSECRET);

        service.list().forEach((user)->{
            try {
                String date = DateUtil.format(user.getCreateTime(), "MM:dd");
                if (date.equals(DateUtil.format(new Date(),"MM:dd"))){
                    Map<String, Object> params = new HashMap<String, Object>();
                    params.put("number", user.getPhonenumber());
                    params.put("templateId", "12490");
                    String result = client.send(params);

                    JSONObject jsonObject = JSON.parseObject(result);
                    if (jsonObject.get("code").toString().equals("0")){
                        System.err.println("短信发送成功");
                    }

                    SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
                    simpleMailMessage.setText("今天是您的生日，小哥在此祝您生日快乐！");
                    simpleMailMessage.setFrom("2086285354@qq.com");
                    simpleMailMessage.setTo(user.getEmail());
                    simpleMailMessage.setSubject("Happy Birthday!");
                    javaMailSender.send(simpleMailMessage);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
    }

    public String urlencode(Map<String, ?> data) {
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

    public String doGet(String httpUrl, String queryParams) {
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
     * 根据手机号获取手机号归属地
     * @param tel
     * @return
     */
    @GetMapping("queryForm")
    public R queryForm(String tel){
        tel = tel.trim();
        Map<String, Object> params = new HashMap<>();//组合参数
        params.put("phone", tel);
        params.put("key", "d2c0aa3f20858055aaed285bc112f4cb");
        String queryParams = urlencode(params);

        String response = doGet("http://apis.juhe.cn/mobile/get", queryParams);
        try {
            JSONObject jsonObject = JSON.parseObject(response);
            int error_code = jsonObject.getIntValue("error_code");
            if (error_code == 0) {
                System.out.println("调用接口成功");

                JSONObject result = jsonObject.getJSONObject("result");

                //返回的参数
                return R.success(result);

            } else {
                return R.fail("调用接口失败：" + jsonObject.getString("reason"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return R.success();
    }

    /**
     * 根据地区获取当地天气
     * @param city
     * @return
     */
    @GetMapping("getWeather")
    public R getWeather(String city){
        Map<String, Object> params = new HashMap<>();//组合参数
        params.put("city", city);
        params.put("key", "7f3673399239ebefb59900270d6a0e91");
        String queryParams = urlencode(params);

        String response = doGet("http://apis.juhe.cn/simpleWeather/query", queryParams);
        try {
            JSONObject jsonObject = JSON.parseObject(response);
            int error_code = jsonObject.getIntValue("error_code");
            if (error_code == 0) {
                System.out.println("调用接口成功");

                JSONObject result = jsonObject.getJSONObject("result");
                JSONObject realtime = result.getJSONObject("realtime");

                System.out.printf("城市：%s%n", result.getString("city"));

                System.out.printf("天气：%s%n", realtime.getString("info"));
                System.out.printf("温度：%s%n", realtime.getString("temperature"));
                System.out.printf("湿度：%s%n", realtime.getString("humidity"));
                System.out.printf("风向：%s%n", realtime.getString("direct"));
                System.out.printf("风力：%s%n", realtime.getString("power"));
                System.out.printf("空气质量：%s%n", realtime.getString("aqi"));
                return R.success(realtime);
            } else {
                return R.fail("调用接口失败：" + jsonObject.getString("reason"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return R.success();
    }

    @GetMapping("getTwoCode")
    public void getTwoCode(String content) throws IOException {
        QrConfig config = new QrConfig(300, 300);
        config.setMargin(3);
        config.setForeColor(Color.CYAN.getRGB());
        config.setBackColor(Color.GRAY.getRGB());

        QrCodeUtil.generate(content==null?"https://pic3.zhimg.com/v2-2ee6c3530ee59861e683cae436fa27c5_r.jpg?source=1940ef5c":content,config,"png", response.getOutputStream());
    }
}
