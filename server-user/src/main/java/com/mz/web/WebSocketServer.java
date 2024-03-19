package com.mz.web;

import cn.hutool.json.JSON;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

/**
 * websocket的处理类。
 * 作用相当于HTTP请求
 * 中的controller
 */
@Component
@Slf4j
@ServerEndpoint(value = "/api/pushMessage/{userId}",encoders = {ServerEncoder.class})
public class WebSocketServer {

    /**静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。*/
    private static int onlineCount = 0;
    /**concurrent包的线程安全Set，用来存放每个客户端对应的WebSocket对象。*/
    private static ConcurrentHashMap<String,WebSocketServer> webSocketMap = new ConcurrentHashMap<>();
    /**与某个客户端的连接会话，需要通过它来给客户端发送数据*/
    private Session session;
    private Map<String,Object> map;
    /**接收userId*/
    private String userId = "";



    /**
     * 连接建立成
     * 功调用的方法
     */
    @OnOpen
    public void onOpen(Session session,@PathParam("userId") String userId) {
        this.session = session;
        this.userId=userId;
        if(webSocketMap.containsKey(userId)){
            webSocketMap.remove(userId);
            //加入set中
            webSocketMap.put(userId,this);
        }else{
            //加入set中
            webSocketMap.put(userId,this);
            //在线数加1
            addOnlineCount();
        }
        log.info("用户连接:"+userId+",当前在线人数为:" + getOnlineCount());
        sendMessage("连接成功");
    }

    /**
     * 连接关闭
     * 调用的方法
     */
    @OnClose
    public void onClose() {
        if(webSocketMap.containsKey(userId)){
            webSocketMap.remove(userId);
            //从set中删除
            subOnlineCount();
        }
        log.info("用户退出:"+userId+",当前在线人数为:" + getOnlineCount());
    }

    /**
     * 收到客户端消
     * 息后调用的方法
     * @param message
     * 客户端发送过来的消息
     **/
    @OnMessage
    public void onMessage(String message, Session session) {
        log.info("用户消息:"+userId+",报文:"+message);
        //可以群发消息
        //消息保存到数据库、redis
        if(StringUtils.isNotBlank(message)){
            try {
                //解析发送的报文
                JSONObject jsonObject = JSONUtil.parseObj(message);
                //追加发送人(防止串改)
                jsonObject.put("fromUserId",this.userId);
                String toUserId=jsonObject.getStr("toUserId");
                //传送给对应toUserId用户的websocket
                if(StringUtils.isNotBlank(toUserId)&&webSocketMap.containsKey(toUserId)){
                    //发送消息到前端
                    webSocketMap.get(toUserId).sendMessage(message);
                }else{
                    //否则不在这个服务器上，发送到mysql或者redis
                    log.error("请求的userId:"+toUserId+"不在该服务器上");
                }
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    }


    /**
     * @param session
     * @param error
     */
    @OnError
    public void onError(Session session, Throwable error) {

        log.error("用户错误:"+this.userId+",原因:"+error.getMessage());
        error.printStackTrace();
    }

    /**
     * 实现服务
     * 器主动推送
     */
    public void sendMessage(String message) {
        try {
            this.session.getBasicRemote().sendText(message);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 连接数据
     * @param map
     */
    public void sendMessagee(HashMap<String, Object> map ) {
        try {


            this.session.getBasicRemote().sendObject(map);//发送前端
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     *发送自定
     *义消息
     **/
    public static void sendInfo(String message, String userId) {
        log.info("发送消息到:"+userId+"，报文:"+message);
        if(StringUtils.isNotBlank(userId) && webSocketMap.containsKey(userId)){
            webSocketMap.get(userId).sendMessage(message);
        }else{
            log.error("用户"+userId+",不在线！");
        }
    }

    /**
     * 自己写的
     * @param map
     * @param userId
     */

    public static void sendInfoo( HashMap<String, Object> map, String userId) {
        log.info("发送消息到:"+userId+"，报文:"+map);
        if(StringUtils.isNotBlank(userId) && webSocketMap.containsKey(userId)){
            webSocketMap.get(userId).sendMessagee(map);
        }else{
            log.error("用户"+userId+",不在线！");
        }
    }

    /**
     * 获得此时的
     * 在线人数
     * @return
     */
    public static synchronized int getOnlineCount() {
        return onlineCount;
    }

    /**
     * 在线人
     * 数加1
     */
    public static synchronized void addOnlineCount() {
        WebSocketServer.onlineCount++;
    }

    /**
     * 在线人
     * 数减1
     */
    public static synchronized void subOnlineCount() {
        WebSocketServer.onlineCount--;
    }

}

