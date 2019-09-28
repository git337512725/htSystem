<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" th:href="@{${layui_css}"  media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

<table class="layui-hide" id="${model_simple_name}" lay-filter="${model_simple_name}"></table>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="add">新增</button>
    </div>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


<script th:src="@{${layui_js}}" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    layui.use('table', function(){
        var table = layui.table;

        table.render({
            elem: '#${model_simple_name}'
            ,url:'${list_url}'
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                ,layEvent: 'LAYTABLE_TIPS'
                ,icon: 'layui-icon-tips'
            }]
            ,title: '${model_simple_name}'
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
            <#if model_columnList?exists>
              <#list model_columnList as model>
              ,{field: ${r"'"}${model.changeColumnName?uncap_first}${r"'"}, title:${r"'"}${model.columnComment}${r"'"}, width:80}
              </#list>
            </#if>
              ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
            ]]
            ,page: true
        });

        //头工具栏事件
        table.on('toolbar(${model_simple_name})', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                //自定义头工具栏右侧图标 - 提示
                case 'LAYTABLE_TIPS':
                    layer.alert('这是工具栏右侧自定义的一个图标按钮');
                    break;
            };
        });

        //监听行工具事件
        table.on('tool(${model_simple_name})', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    del(data.id);
                    layer.close(index);
                });
            } else if(obj.event === 'add'){
                add(data.id);
            } else if(obj.event === 'edit'){
                edit(data.id);
            }
        });
    });

    function add() {
        //iframe层-父子操作
        layer.open({
            type: 2,
            area: ['700px', '450px'],
            fixed: false, //不固定
            maxmin: true,
            content: '${list_add}'
        });
    }

    function edit(objId) {
        //iframe层-父子操作
        layer.open({
            type: 2,
            area: ['700px', '450px'],
            fixed: false, //不固定
            maxmin: true,
            content: '${list_update}?id=' + objId
        });
    }

    function del(objId){
        $.post("${list_delete}",{"id",objId},function (data) {
            layer.msg(data);
        },"json");
    }
</script>

</body>
</html>