package com.mz.domain.vo;


import com.mz.domain.SysStu;
import com.mz.domain.SysSub;
import lombok.Data;

import java.util.List;

@Data
public class StuVo extends SysStu {
    private String subs;

    private List<SysSub> ids;

    public static StuVo getStuVo(SysStu stu){
        StuVo stuVo = new StuVo();
        stuVo.setStuId(stu.getStuId());
        stuVo.setStuName(stu.getStuName());
        stuVo.setGender(stu.getGender());
        stuVo.setInDate(stu.getInDate());
        stuVo.setCreateTime(stu.getCreateTime());
        return stuVo;
    }
}
