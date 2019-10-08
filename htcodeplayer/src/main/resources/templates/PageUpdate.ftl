<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" th:href="@{${layui_css}}"  media="all">
    <script th:src="@{${layui_js}}" charset="utf-8"></script>
    <script th:src="@{/system/js/jquery.min.js}" charset="utf-8"></script>
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>修改${model_simple_name}</legend>
</fieldset>

<form class="layui-form" action="">
    <#if model_columnList?exists>
        <#list model_columnList as model>
            <#if  (model.changeColumnName?uncap_first) == 'id' >
                <input type="hidden" name="id" value="${r"${"}${model.changeColumnName?uncap_first}${r"}"}"  >
            <#else>
                <div class="layui-form-item">
                    <label class="layui-form-label">${model.columnComment!}</label>
                    <div class="layui-input-block">
                        <input type="text" name=${r"'"}${model.changeColumnName?uncap_first}${r"'"}  lay-verify="required" lay-reqtext="${model.columnComment!}为必填项" placeholder="请输入${model.columnComment!}" autocomplete="off" class="layui-input">
                    </div>
                </div>
            </#if>
        </#list>
    </#if>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="subBtn">提交</button>
        </div>
    </div>
</form>
<script>
    layui.use(['form'], function(){
        var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
        var form = layui.form
            ,layer = layui.layer ;
        //监听提交
        form.on('submit(subBtn)', function(data){
            var data2Send = JSON.stringify(data.field);
            $.post("${list_update}",data2Send,function (res) {
                layer.msg(res, function(){
                    parent.layer.close(index);
                });
            },"json");
        });
    });
</script>

</body>