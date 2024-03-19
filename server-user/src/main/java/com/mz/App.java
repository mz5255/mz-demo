package com.mz;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * Hello world!
 *
 */
@SpringBootApplication
@EnableScheduling
@MapperScan("com.mz.mapper")
public class App
{
    public static void main( String[] args )
    {
        SpringApplication.run(App.class,args);
    }
//    @Bean
//    @Primary
//    public RedisTemplate<Object, Object> redisTemplate(RedisConnectionFactory redisConnectionFactory) {
//        RedisTemplate<Object, Object> template = new RedisTemplate();
//        Jackson2JsonRedisSerializer j = new Jackson2JsonRedisSerializer(Object.class);
//
//        template.setConnectionFactory(redisConnectionFactory);
//        template.setKeySerializer(j);
//        template.setValueSerializer(j);
//        return template;
//    }
}
