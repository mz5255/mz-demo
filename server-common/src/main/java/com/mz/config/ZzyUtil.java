package com.mz.config;

import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.zhenzi.sms.ZhenziSmsClient;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

/**
 * @author 马震
 * @version 1.0
 * @date 2024/3/13 11:26
 */
@Component
public class ZzyUtil {


    String apiUrl="https://sms_developer.zhenzikj.com";
    String appId="113607";
    String appSecret="NTg2YThkZTAtYTNlYS00MjdmLThlMzYtZTZjMDFiMzYwYmQ1";
    String templateid="12424";//支付成功提示
    String a ="12437";//提醒支付
    String a1 ="12490";//申请成功

    /**
     *
     * @param phone
     * @param
     * @return
     */
    public boolean zzy(String phone) {
        try {
            ZhenziSmsClient zhenziSmsClient = new ZhenziSmsClient(apiUrl, appId, appSecret);

            Map<String, Object> params = new HashMap<>();
            params.put("number", phone);
            params.put("templateId", a1);
            String result = zhenziSmsClient.send(params);
            JSONObject parse = JSONUtil.parseObj(result);
            Integer code = parse.getInt("code");
            if(code == 0){
                return true;
            }else{
                return false;
            }

        } catch (Exception e) {
            // 可以记录日志或者抛出自定义异常
            e.printStackTrace();
            return false;
        }
    };
}
