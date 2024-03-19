package com.mz.common;

import lombok.Data;

@Data
public class QueryParam {
    private Integer pageNum;
    private Integer pageSize;
    private String userName;
    private String nickName;
    private String sex;
}
