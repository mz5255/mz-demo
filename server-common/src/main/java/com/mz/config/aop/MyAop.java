package com.mz.config.aop;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

/**
 * @author 马震
 * @version 1.0
 * @date 2024/3/8 10:07
 */
@Aspect
@Slf4j
@Component
public class MyAop {

    @Around("execution(* com.ruoyi.system.controller.*.*(..))")
    public Object around(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {


        long l = System.currentTimeMillis();
        Object proceed = proceedingJoinPoint.proceed();
        long l1 = System.currentTimeMillis();
        long l2=l1-l;
        System.out.println("方法执行时间"+l2+"s");
        return proceed;
    }
}
