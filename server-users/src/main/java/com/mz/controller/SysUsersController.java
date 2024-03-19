package com.mz.controller;

import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mz.api.domain.SysUsers;
import com.mz.config.QueryPage;
import com.mz.config.R;
import com.mz.service.SysUsersService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 用户信息Controller
 *
 * @author ruoyi
 * @date 2024-03-10
 */
@RestController
@RequestMapping("/user")
public class SysUsersController
{
    @Autowired
    private SysUsersService sysUsersService;
    @Autowired
    private ThreadPoolTaskExecutor threadPoolTaskExecutor;








    @GetMapping("/eCharsList")
    public Map<String,Object> eCharsList(){
        HashMap<String, Object> map = new HashMap<>();


        List<SysUsers> sysUsers = sysUsersService.list();
        List<SysUsers> x = sysUsers.stream().filter(item -> item.getSex().equals("0")).collect(Collectors.toList());
        List<SysUsers> y = sysUsers.stream().filter(item -> item.getSex().equals("1")).collect(Collectors.toList());
        ArrayList<Integer> arr = new ArrayList<>();
        arr.add(x.size());
        arr.add(y.size());

        ArrayList<Integer> xYear = new ArrayList<>();
        ArrayList<Long> yYear = new ArrayList<>();
        // 使用Stream API和Collectors类按安装年份进行分类统计
        // 使用Stream API和Collectors类按安装年份进行分类统计
        Map<Integer, Long> collect = sysUsers.stream()
                .collect(Collectors.groupingBy(r -> DateUtil.year(r.getCreateTime()), Collectors.counting()));
        collect.forEach((key,value) -> {
            xYear.add(key);
            yYear.add(value);
        });

        map.put("data",arr);
        map.put("xYear",xYear);
        map.put("yYear",yYear);
        return map;
    }



    /**
     * 查询用户信息列表
     */
    @GetMapping("/list")
    public R list(SysUsers sysUsers, QueryPage queryPage)
    {
        PageHelper.startPage(queryPage.getPageNum(),queryPage.getPageSize());
        List<SysUsers> list = sysUsersService.selectSysUsersList(sysUsers);
        PageInfo<SysUsers> sysUsersPageInfo = new PageInfo<>(list);
        return R.success(sysUsersPageInfo);
    }



    /**
     * 获取用户信息详细信息
     */
    @GetMapping(value = "/{userId}")
    public R getInfo(@PathVariable("userId") Long userId)
    {
        QueryWrapper queryWrapper =new QueryWrapper();
        queryWrapper.eq("userId", userId);
        List list = sysUsersService.list(queryWrapper);
        return R.success(list);
    }

    /**
     * 新增用户信息
     */
    @PostMapping("add")
    public R add(@RequestBody SysUsers sysUsers)
    {
        return R.success(sysUsersService.insertSysUsers(sysUsers));
    }

    /**
     * 修改用户信息
     */
    @PutMapping("edit")
    public R edit(@RequestBody SysUsers sysUsers)
    {
        return R.success(sysUsersService.updateSysUsers(sysUsers));
    }

    /**
     * 删除用户信息
     */
	@DeleteMapping("remove/{userIds}")
    public R remove(@PathVariable Long[] userIds)
    {
        return R.success(sysUsersService.deleteSysUsersByUserIds(userIds));
    }
}
