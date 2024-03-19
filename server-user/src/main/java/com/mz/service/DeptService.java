package com.mz.service;

import com.mz.domain.Dept;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
* @author 86132
* @description 针对表【sys_dept】的数据库操作Service
* @createDate 2024-03-14 09:41:58
*/
public interface DeptService extends IService<Dept> {

    List<Dept> selectDeptTrees(Integer parent);

    void mySave(Dept dept);

    void exit(Dept dept);


    void myDelete(Integer id);

    List getThreeListByParentId(Integer parentId);
}
