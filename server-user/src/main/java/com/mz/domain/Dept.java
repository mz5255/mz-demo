package com.mz.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

/**
 *
 * @TableName sys_dept
 */
@TableName(value ="sys_dept")
@Data
public class Dept implements Serializable {
    /**
     * ID
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 部门名称
     */
    private String deptName;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /**
     * 所属部门
     */
    private Integer parentId;

    /**
     * 部门等级
     */
    private Integer level;

    /**
     * 部门位置
     */
    private String place;

    /**
     * 部门路径
     */
    private String path;

    @TableField(exist = false)
    private List<Dept> children;
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}
