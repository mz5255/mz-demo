package com.mz;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Hello world!
 *
 */
@SpringBootApplication
@MapperScan("com.mz.mapper")
public class ShardingJdbcAppLication
{
    public static void main( String[] args )
    {
        SpringApplication.run(ShardingJdbcAppLication.class,args);
        System.out.println( "Hello World!" );
    }
}
