package ${package_name}.service.serviceImpl;

import ${package_name}.dao.${model_simple_name}Mapper;
import ${package_name}.model.${model_simple_name};
import ${package_name}.service.${model_simple_name}Service;
import com.lz.ht.page.PageModel;
import ${package_name}.util.ToolKit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.HashMap;

@Service
public class ${model_simple_name}ServiceImpl  implements  ${model_simple_name}Service {

    @Autowired
    private ${model_simple_name}Mapper ${model_simple_name?uncap_first}Mapper;

    @Override
    public void add(${model_simple_name} record) {
        ${model_simple_name?uncap_first}Mapper.add(record);
    }

    @Override
    public void updateById(${model_simple_name} record) {
        ${model_simple_name?uncap_first}Mapper.updateById(record);
    }

    @Override
    public int deleteById(Integer ${model_simple_name}Id) {
        return  ${model_simple_name?uncap_first}Mapper.deleteById(${model_simple_name}Id);
    }

    @Override
    public List<${model_simple_name}> findAll() {
        return ${model_simple_name?uncap_first}Mapper.findAll();
    }


    @Override
    public List<${model_simple_name}> findPageList(PageModel<${model_simple_name}> page, ${model_simple_name} ${model_simple_name?uncap_first}) throws Exception {
        HashMap<String, Object> hashMap = ToolKit.javaBeanToMap(${model_simple_name?uncap_first});
        List<${model_simple_name}> pageList = findListByMapLimit(hashMap, page.getMsFirst(), page.getMsLast());
        return pageList;
    }

    @Override
    public List<${model_simple_name}> findListByMapLimit(HashMap<String,Object> hashMap,long first,long last){
        hashMap.put("msFirst",first);
        hashMap.put("msLast",last);
        return ${model_simple_name?uncap_first}Mapper.findListByMapLimit(hashMap);
    }

    @Override
    public long findCount(${model_simple_name}  ${model_simple_name?uncap_first}) throws Exception {
        HashMap<String, Object> hashMap = ToolKit.javaBeanToMap(${model_simple_name?uncap_first});
        return  findCountByMap(hashMap);
    }

    @Override
    public long findCountByMap(HashMap<String,Object> hashMap){
        return ${model_simple_name?uncap_first}Mapper.findCountByMap(hashMap);
    }


 }
