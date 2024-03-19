package com.mz.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mz.common.QueryParam;
import com.mz.domain.User;
import com.mz.service.UserService;
import com.mz.mapper.UserMapper;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* @author 86132
* @description 针对表【sys_user(用户信息表)】的数据库操作Service实现
* @createDate 2024-03-12 18:53:29
*/
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User>
    implements UserService{

    @Override
    public PageInfo<User> selectUserList(QueryParam param) {
        PageHelper.startPage(param.getPageNum(),param.getPageSize());
        List<User> list = baseMapper.selectUserList(param);
        return new PageInfo<>(list);
    }

    @Override
    public void deleteUser(Long userId) {
        baseMapper.deleteUser(userId);
    }
}




