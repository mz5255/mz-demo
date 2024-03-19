package com.mz.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.mz.common.R;
import com.mz.config.IdUtil;
import com.mz.domain.SysStu;
import com.mz.domain.SysStuSub;
import com.mz.domain.SysSub;
import com.mz.domain.vo.StuVo;
import com.mz.service.SysStuService;
import com.mz.service.SysStuSubService;
import com.mz.service.SysSubService;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

@RestController
@RequestMapping("stu")
@CrossOrigin
public class StuController {
    @Autowired
    SysStuService stuService;
    @Autowired
    SysStuSubService stuSubService;
    @Autowired
    RedisTemplate redisTemplate;
    @Autowired
    SysSubService subService;
    @Autowired
    RedissonClient redissonClient;

    /**
     * 列表
     * @return
     */
    @PostMapping("list")
    public R list(){
        List<SysStu> list = stuService.selectStus();
        return R.success(list);
    }

    /**
     * 添加
     * @param stuVo
     * @return
     */
    @PostMapping("addStu")
    public R addStu(@RequestBody StuVo stuVo){
        RLock lock = redissonClient.getLock("addStu");

        try {
            boolean b = lock.tryLock(2, TimeUnit.SECONDS);

            if (b){
                if (stuVo.getStuName() == null || stuVo.getStuName().trim().equals("")){
                    return R.fail("请输入姓名");
                }
                if (stuVo.getGender() == null || stuVo.getGender().equals("")){
                    return R.fail("请选择性别");
                }
                if (stuVo.getInDate() == null){
                    return R.fail("请选择入学日期");
                }
                if (stuVo.getIds() == null || stuVo.getIds().size()<1){
                    return R.fail("请至少选择一门学科");
                }

                stuVo.setStuId(IdUtil.getId(redisTemplate.opsForValue().increment("stu:id")));

                stuVo.setCreateTime(new Date());

                List<SysStuSub> list = new ArrayList<>();

                for (SysSub id : stuVo.getIds()) {
                    QueryWrapper wrapper = new QueryWrapper();
                    wrapper.eq("sub_id",id.getSubId());
                    List<SysSub> max = stuSubService.list(wrapper);

                    if (max.size()>=id.getMax()){
                        return R.fail(id.getSubName()+"科目人数已达最大选课人数，请换一个试试吧");
                    }

                    SysStuSub stuSub = new SysStuSub();
                    stuSub.setStuId(stuVo.getStuId());
                    stuSub.setSubId(id.getSubId());
                    list.add(stuSub);
                }

                stuService.save(stuVo);
                stuSubService.saveBatch(list);

                return R.success();
            }else {
                return R.fail("系统开小差了，请重试一下吧");
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
            return R.fail(e.getMessage());
        }finally {
            if (lock.isLocked() && lock.isHeldByCurrentThread()){
                lock.unlock();
            }
        }
    }

    /**
     * 修改
     * @param stuVo
     * @return
     */
    @PutMapping("updStu")
    public R updStu(@RequestBody StuVo stuVo){
        if (stuVo.getStuName() == null || stuVo.getStuName().trim().equals("")){
            return R.fail("请输入姓名");
        }
        if (stuVo.getGender() == null || stuVo.getGender().equals("")){
            return R.fail("请选择性别");
        }
        if (stuVo.getInDate() == null){
            return R.fail("请选择入学日期");
        }
        if (stuVo.getIds() == null || stuVo.getIds().size()<1){
            return R.fail("请至少选择一门学科");
        }

        //查询到此学生的学科
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("stu_id",stuVo.getStuId());
        List<SysStuSub> removeBy = stuSubService.list(wrapper);
        //移除此学生之前所选择的学科
        stuSubService.removeBatchByIds(removeBy);

        //将此次选择的学科重新添加入库
        List<SysStuSub> list = new ArrayList<>();
        for (SysSub id : stuVo.getIds()) {
            SysStuSub stuSub = new SysStuSub();
            stuSub.setStuId(stuVo.getStuId());
            stuSub.setSubId(id.getSubId());
            list.add(stuSub);
        }
        stuSubService.saveBatch(list);

        //修改学生信息
        QueryWrapper queryWrapper =new QueryWrapper();
        queryWrapper.eq("stu_id",stuVo.getStuId());
        stuService.update(stuVo,queryWrapper);
        return R.success();
    }

    /**
     * 删除
     * @param stuId
     * @return
     */
    @DeleteMapping("delStu")
    public R delStu( String stuId) {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("stu_id", stuId);

        stuSubService.remove(wrapper);

        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("stu_id",stuId);
        stuService.remove(queryWrapper);
        return R.success();
    }

    /**
     * 修改回显
     * @param stuId
     * @return
     */
    @GetMapping("getStuVo")
    public R updStu(String stuId){
        SysStu stu = stuService.selectGetById(stuId);
        StuVo stuVo = StuVo.getStuVo(stu);
        QueryWrapper w = new QueryWrapper();
        w.eq("stu_id",stuVo.getStuId());

        List<SysStuSub> list = stuSubService.list(w);
        List<Integer> collect = list.stream().map(SysStuSub::getSubId).collect(Collectors.toList());

        List<SysSub> subs = subService.listByIds(collect);

        stuVo.setIds(subs);
        return R.success(stuVo);
    }
}
