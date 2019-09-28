package com.lz.ht.service.impl;

import com.lz.ht.model.User;
import com.lz.ht.page.PageModel;
import com.lz.ht.util.ToolKit;

import java.util.HashMap;
import java.util.List;

public interface UserService {

    List<User>  findPageList(PageModel<User> page, User user) throws Exception;

    List<User> findListByMapLimit(HashMap<String,Object> hashMap, long first, long last);

    long findCount(User user) throws Exception;

    long findCountByMap(HashMap<String,Object> hashMap);
}
