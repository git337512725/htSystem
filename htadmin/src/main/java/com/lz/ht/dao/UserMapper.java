package com.lz.ht.dao;

import com.lz.ht.model.User;

import java.util.HashMap;
import java.util.List;

public interface UserMapper {

    long findCount(User user);

    long findCountByMap(HashMap<String,Object> hashMap);

    List<User> findListByMapLimit(HashMap hashMap);
}
