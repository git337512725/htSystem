<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="${package_name}.dao.${model_simple_name}Mapper">

    <resultMap id="baseResultMap" type="${package_name}.model.${model_simple_name}"></resultMap>

    <insert id="add" parameterType="${package_name}.model.${model_simple_name}" >
        insert into ${table_name} <trim prefix="(" suffix=")" suffixOverrides= ",">
            <#if model_columnList?exists>
                <#list model_columnList as model>
                    <if test= "${model.changeColumnName?uncap_first} != null">${model.columnName},</if>
                </#list>
            </#if>
        </trim>
        values <trim prefix="(" suffix=")" suffixOverrides= ",">
            <#if model_columnList?exists>
                <#list model_columnList as model>
                    <if test= "${model.changeColumnName?uncap_first} != null">${r"#{"}${model.changeColumnName?uncap_first}${r"}"},</if>
                </#list>
            </#if>
        </trim>
    </insert>
    <update id="updateById" parameterType="${package_name}.model.${model_simple_name}" >
        UPDATE ${table_name}
        <set>
            <#if model_columnList?exists>
                <#list model_columnList as model>
                    <if test= "${model.changeColumnName?uncap_first} != null">${model.columnName} = ${r"#{"}${model.changeColumnName?uncap_first}${r"}"},</if>
                </#list>
            </#if>
        </set>
        WHERE id = ${r"#{"}${'id'}${r"}"}
    </update>

    <delete id="deleteById" parameterType="${package_name}.model.${model_simple_name}" >
        delete from ${table_name} where id = ${r"#{"}${'id'}${r"}"}
    </delete>

    <select id="findById"   resultMap="baseResultMap"  parameterType="java.lang.Long" >
        select * from  ${table_name} t  WHERE id = ${r"#{"}${'id'}${r",jdbcType=BIGINT}"}
    </select>

    <select id="findAll"   resultMap="baseResultMap">
        select * from  ${table_name} t
    </select>


    <select id="findList"  parameterType="${package_name}.model.${model_simple_name}" resultMap="baseResultMap">
        select * from  ${table_name} t where 1=1
        <#if model_columnList?exists>
            <#list model_columnList as model>
                <if test= "${model.changeColumnName?uncap_first} != null"> and ${model.columnName} = ${r"#{"}${model.changeColumnName?uncap_first}${r"}"}</if>
            </#list>
        </#if>
    </select>

    <select id="findCount" parameterType="${package_name}.model.${model_simple_name}"  resultType="java.lang.Long">
        select count(*)  from ${table_name} where 1=1
            <#if model_columnList?exists>
                <#list model_columnList as model>
                    <if test= "${model.changeColumnName?uncap_first} != null"> and ${model.columnName} = ${r"#{"}${model.changeColumnName?uncap_first}${r"}"}</if>
                </#list>
            </#if>
    </select>

    <select id="findCountByMap" parameterType="java.util.HashMap"   resultType="java.lang.Long" >
        select count(*) from ${table_name} where 1=1
        <#if model_columnList?exists>
            <#list model_columnList as model>
                <if test= "${model.changeColumnName?uncap_first} != null">  and ${model.columnName} = ${r"#{"}${model.changeColumnName?uncap_first}${r"}"} </if>
            </#list>
        </#if>
    </select>

    <select id="findListByMapLimit" parameterType="java.util.HashMap"   resultType="${package_name}.model.${model_simple_name}" >
        select * from ${table_name} where 1=1
        <#if model_columnList?exists>
            <#list model_columnList as model>
                <if test= "${model.changeColumnName?uncap_first} != null">  and ${model.columnName} = ${r"#{"}${model.changeColumnName?uncap_first}${r"}"}</if>
            </#list>
        </#if>
        order by id desc limit  ${r"#{"}${'msFirst'}${r"}"},${r"#{"}${'msLast'}${r"}"}
    </select>

</mapper>