package com.mz.web;

import lombok.Data;

import java.util.Map;

@Data
public class CodesInfo {
    private Integer userId;
    private Integer toUserId;
    private Map<String,Object> contentText;
}
