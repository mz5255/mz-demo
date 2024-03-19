package com.mz.service.impl;

import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mz.domain.Dept;
import com.mz.service.DeptService;
import com.mz.mapper.DeptMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author 86132
 * @description 针对表【sys_dept】的数据库操作Service实现
 * @createDate 2024-03-14 09:41:58
 */
@Service
public class DeptServiceImpl extends ServiceImpl<DeptMapper, Dept>
        implements DeptService {


    @Resource
    DeptMapper deptMapper;
    @Autowired
    DeptService deptService;

    /**
     * 递归
     *
     * @param list
     * @param parentId
     * @return
     */
    public List<Dept> deptListToTree(List<Dept> list, Integer parentId) {
        //一级目录
        List<Dept> parentList = list.stream().filter(dept -> dept.getParentId().equals(parentId)).collect(Collectors.toList());
        //遍历一级
        parentList = parentList.stream().map(dept -> {
            List<Dept> depts = deptListToTree(list, dept.getId());
            if (depts != null) {
                dept.setChildren(depts);
            }
            return dept;
        }).collect(Collectors.toList());
        return parentList;
    }


    /**
     * @return
     */
    @Override
    public List<Dept> selectDeptTrees(Integer parentId) {
        List<Dept> list = baseMapper.selectList();
        List<Dept> depts = deptListToTree(list, 0);
        return depts;
    }


    /**
     * 新增
     *
     * @param dept
     */
    @Override
    @Transactional
    public void mySave(Dept dept) {

        Dept dbDept = deptMapper.myListByParentId(dept.getParentId());
        dept.setCreateTime(new Date());
        dept.setParentId(dbDept.getId());
        dept.setLevel(dbDept.getLevel() + 1);

        if (dept.getParentId() == 0) {
            dept.setPath(dept.getDeptName());
        } else {
            Dept dept1 = deptMapper.select(dept.getParentId());
            dept.setPath(dept1.getPath() + "/" + dept.getDeptName());
        }
        deptService.save(dept);
    }


    /**
     * 修改
     *
     * @param dept
     */
    @Override
    @Transactional
    public void exit(Dept dept) {

        if(dept.getId() == dept.getParentId()){
            throw new RuntimeException("不可以把自己修改到自身下面");
        }

        if (dept.getParentId() == 0) {
            dept.setLevel(1);
            dept.setPath(dept.getDeptName());
        }else{
            Dept dept1 = deptMapper.select(dept.getId());//查出自己
            Dept deptParent = deptMapper.myListByParentId(dept.getParentId());//查出自己的父亲
            dept.setLevel(deptParent.getLevel()+1);
            dept.setPath(deptParent.getPath()+"/"+dept1.getDeptName());
        }

        //不可以把自身定义在自己的子部门中
        List<Dept> list = deptMapper.myListById(dept.getId());
        for (Dept son : list) {
            if(son.getId() == dept.getParentId()){
                if(dept.getId() == son.getParentId()){
                    throw new RuntimeException("不可以把自身定义在自己的子部门中");
                }
            }
        }

        extracted(dept);//递归
        baseMapper.updateById(dept);//修改第一层
    }

    private void extracted(Dept dept) {
        List<Dept> list = deptMapper.myListById(dept.getId());

        if (list.size() > 0 && list != null) { //如果没有下一层就结束递归
            for (Dept son : list) {
                son.setLevel(dept.getLevel() + 1);//修改每一层
                son.setPath(dept.getPath() + "/" + son.getDeptName());
                baseMapper.updateById(son);//修改每个下面的
                extracted(son);
            }
        }
    }



    @Override
    public List getThreeListByParentId(Integer parentId) {
        List<Dept> depts = deptMapper.selectDeptTrees(parentId);
        return depts;
    }






    /**
     * 删除
     */
    @Override
    @Transactional
    public void myDelete(Integer id) {
        extracted(id);//递归
        baseMapper.deleteById(id);//删除当前对象

    }

    /**
     * 递归删除
     *
     * @param id 父iD
     */
    private void extracted(Integer id) {

        List<Dept> son = deptMapper.myListById(id); //查出儿子集合
        if (son != null && son.size() > 0) { //判定条件 看看有没有下一层
            for (Dept child : son) {
                baseMapper.deleteById(child.getId());//查出每个儿子删掉
                extracted(child.getId());//递归
            }
        }
    }



}




