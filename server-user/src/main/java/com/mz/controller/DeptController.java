package com.mz.controller;

import cn.hutool.core.util.RandomUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.mz.common.R;
import com.mz.domain.Dept;
import com.mz.service.DeptService;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.concurrent.TimeUnit;


@RestController
@RequestMapping("dept")
public class DeptController {
    @Autowired
    DeptService service;
    @Autowired
    RedisTemplate redisTemplate;
    @Autowired
    RedissonClient redissonClient;


    @GetMapping("getList")
    public R getList(){
        Integer parentId = 0 ;
      List  list =  service.getThreeListByParentId(parentId);
      return R.success(list);
    }


    @DeleteMapping("delete")
    public R deleteDept(Integer id){

        try {
            service.myDelete(id);
            redisTemplate.delete("deptList");
        }catch (Exception e){
            e.printStackTrace();
            return R.fail(e.getMessage());
        }
        return R.success();
    }


    @PutMapping("exit")
    public R exitDept(@RequestBody Dept dept){
        try {
            service.exit(dept);
            redisTemplate.delete("deptList");
        }catch (Exception e){
            e.printStackTrace();
            return R.fail(e.getMessage());
        }
        return R.success(null);
    }


    @PostMapping("save")
    public R saveDept(@RequestBody Dept dept){
        try {


            service.mySave(dept);
            redisTemplate.delete("deptList");
        }catch (Exception e){
            e.printStackTrace();
            return R.fail(e.getMessage());
        }
        return R.success(null);
    }


    /**
     * 列表
     * @return
     */
    @PostMapping("list")
    public R deptList(){
        List<Dept> list = null;
        if (redisTemplate.hasKey("deptList")){
            list = redisTemplate.opsForList().range("deptList",0,-1);
        }else {
            RLock lock = redissonClient.getLock("lock:deptList");
            try {
                boolean flag = lock.tryLock();
                if (flag) {
                    System.err.println("访问数据库");
                    Integer parentId = 0;
                    list = service.selectDeptTrees(parentId);
                    redisTemplate.opsForList().rightPushAll("deptList",list);
                    redisTemplate.expire("deptList", RandomUtil.randomInt(1,5), TimeUnit.HOURS);
                }else {
                    return R.fail("当前人流量过多，请稍后再试");
                }
            } catch (Exception e) {
                e.printStackTrace();
                return R.fail(e.getMessage());
            }finally {
                if (lock.isLocked() && lock.isHeldByCurrentThread()){
                    lock.unlock();
                }
            }
        }
        return R.success(list);
    }
}
