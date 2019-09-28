package com.lz.ht.service.impl;

import com.lz.ht.dao.UserMapper;
import com.lz.ht.model.User;
import com.lz.ht.page.PageModel;
import com.lz.ht.util.ToolKit;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;

public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public List<User> findPageList(PageModel<User> page, User user) throws Exception {
        HashMap<String, Object> hashMap = ToolKit.javaBeanToMap(user);
        List<User> pageList = findListByMapLimit(hashMap, page.getMsFirst(), page.getMsLast());
        return pageList;
    }
    @Override
    public List<User> findListByMapLimit(HashMap<String,Object> hashMap,long first,long last){
        hashMap.put("msFirst",first);
        hashMap.put("msLast",last);
        return userMapper.findListByMapLimit(hashMap);
    }
    @Override
    public long findCount(User user) throws Exception {
        HashMap<String, Object> hashMap = ToolKit.javaBeanToMap(user);
        return  findCountByMap(hashMap);
    }
    @Override
    public long findCountByMap(HashMap<String,Object> hashMap){
        return userMapper.findCountByMap(hashMap);
    }

}
