package ${package_name}.dao;

import ${package_name}.model.${model_simple_name};
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.HashMap;
import org.apache.ibatis.annotations.Mapper;

//@Repository
@Mapper
public interface ${model_simple_name}Mapper {

    void add(${model_simple_name} record);

    void updateById(${model_simple_name} record);

    int deleteById(Long ${model_simple_name}Id);

    ${model_simple_name}  findById(Long id);

    List<${model_simple_name}> findAll();

    List<${model_simple_name}> findList(${model_simple_name} record);

    long findCount(${model_simple_name} ${model_simple_name?uncap_first});

    long findCountByMap(HashMap<String,Object> hashMap);

    List<${model_simple_name}> findListByMapLimit(HashMap<String,Object> hashMap);

}
