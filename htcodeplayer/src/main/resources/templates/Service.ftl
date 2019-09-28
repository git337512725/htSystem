package ${package_name}.service;

import ${package_name}.model.${model_simple_name};

import java.util.List;

public interface I${model_simple_name}Service {

    void add(${model_simple_name} record);

    void updateById(${model_simple_name} record);

    int deleteById(Integer ${model_simple_name}Id);

    List<${model_simple_name}> findAll();

    List<${model_simple_name}> findPageList(PageModel<${model_simple_name}> page, ${model_simple_name} ${model_simple_name?uncap_first}) throws Exception;

    List<${model_simple_name}> findListByMapLimit(HashMap<String,Object> hashMap, long first, long last);

    long findCount(${model_simple_name} ${model_simple_name?uncap_first}) throws Exception;

    long findCountByMap(HashMap<String,Object> hashMap);

}
