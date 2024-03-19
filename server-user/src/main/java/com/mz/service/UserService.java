package com.mz.service;

import com.github.pagehelper.PageInfo;
import com.mz.common.QueryParam;
import com.mz.domain.User;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author 86132
* @description 针对表【sys_user(用户信息表)】的数据库操作Service
* @createDate 2024-03-12 18:53:29
*/
public interface UserService extends IService<User> {

    PageInfo<User> selectUserList(QueryParam param);

    void deleteUser(Long userId);
}
