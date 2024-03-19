package com.mz.mapper;

import com.mz.common.QueryParam;
import com.mz.domain.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
* @author 86132
* @description 针对表【sys_user(用户信息表)】的数据库操作Mapper
* @createDate 2024-03-12 18:53:29
* @Entity com.lx.domain.User
*/
public interface UserMapper extends BaseMapper<User> {

    List<User> selectUserList(QueryParam param);

    void deleteUser(Long userId);
}




