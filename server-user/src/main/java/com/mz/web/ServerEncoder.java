package com.mz.web;

import com.alibaba.fastjson.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;
import java.util.HashMap;

/**
 * @desc: WebSocket编码器
 * @author: LiuCh
 * @since: 2021/8/18
 */
public class ServerEncoder implements Encoder.Text<HashMap<String,Object>> {
    private static final Logger log = LoggerFactory.getLogger(ServerEncoder.class);

    /**
     * 这里的参数 hashMap 要和  Encoder.Text<T>保持一致
     * @param hashMap
     * @return
     * @throws EncodeException
     */
    @Override
    public String encode(HashMap hashMap) throws EncodeException {
        /*
         * 这里是重点，只需要返回Object序列化后的json字符串就行
         * 你也可以使用gosn，fastJson来序列化。
         * 这里我使用fastjson
         */
        try {
            return JSONObject.toJSONString(hashMap);
        }catch (Exception e){
            log.error("",e);
        }
        return null;
    }

    @Override
    public void init(EndpointConfig endpointConfig) {
        //可忽略
    }

    @Override
    public void destroy() {
        //可忽略
    }
//
//    @Override
//    public String encode(XyVo xyVo) throws EncodeException {
//         /*
//        * 这里是重点，只需要返回Object序列化后的json字符串就行
//        * 你也可以使用gosn，fastJson来序列化。
//       * 这里我使用fastjson        */
//        try {
//           return JSONObject.toJSONString(xyVo);
//       }catch (Exception e){
//            log.error("",e);
//        }
//       return null;
//   }

}


