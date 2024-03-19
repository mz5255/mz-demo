package com.mz.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

/**
 * @author 马震
 * @version 1.0
 * @date 2024/3/7 21:49
 */
//@Configuration
public class MyConfig {

    /**
     * 线程池
     * @return
     */
    @Bean
    public ThreadPoolTaskExecutor threadPoolTaskExecutor(){
        ThreadPoolTaskExecutor threadPoolTaskExecutor = new ThreadPoolTaskExecutor();
        threadPoolTaskExecutor.setCorePoolSize(5);
        threadPoolTaskExecutor.setMaxPoolSize(10);
        threadPoolTaskExecutor.setThreadNamePrefix("MZ");
        threadPoolTaskExecutor.setKeepAliveSeconds(60);
        threadPoolTaskExecutor.initialize();
        return threadPoolTaskExecutor;
    }
}
