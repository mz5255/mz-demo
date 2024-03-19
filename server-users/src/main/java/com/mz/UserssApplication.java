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
public class UserssApplication
{
    public static void main( String[] args )
    {
        SpringApplication.run(UserssApplication.class,args);
        System.out.println( "Hello World!" );
    }
}
