package com.mz.config;

import java.util.Date;

/**
 * @author 马震
 * @version 1.0
 * @date 2024/2/25 11:41
 */

public class QueryPage {
    private Integer pageNum =1 ;
    private Integer pageSize =10;

    private Date endTime;

    private Date beginTime;



    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Date getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(Date beginTime) {
        this.beginTime = beginTime;
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }
}
