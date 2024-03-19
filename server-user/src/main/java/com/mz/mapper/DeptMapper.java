package com.mz.mapper;

import com.mz.domain.Dept;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
* @author 86132
* @description 针对表【sys_dept】的数据库操作Mapper
* @createDate 2024-03-14 09:41:58
* @Entity com.lx.domain.Dept
*/
public interface DeptMapper extends BaseMapper<Dept> {

    List<Dept> selectDeptTrees(Integer parentId);
    List<Dept> selectList();

    /**
     * 根据id查parentid
     * @param id
     * @return
     */
    List myListById(Integer id);

    /**
     * 根据parentid查id
     * @param parentId
     * @return
     */
    Dept myListByParentId(Integer parentId);

    Dept select(Integer id);
}




