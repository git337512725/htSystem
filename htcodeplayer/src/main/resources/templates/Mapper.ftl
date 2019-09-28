package ${package_name}.dao;

import ${package_name}.model.${model_simple_name};

import java.util.List;
import java.util.HashMap;

public interface I${model_simple_name}Mapper {

    void add(${model_simple_name} record);

    void updateById(${model_simple_name} record);

    int deleteById(Integer ${model_simple_name}Id);

    List<${model_simple_name}> findAll();

    long findCount(${model_simple_name} ${model_simple_name?uncap_first});

    long findCountByMap(HashMap<String,Object> hashMap);

    List<${model_simple_name}> findListByMapLimit(HashMap<String,Object> hashMap);

}
