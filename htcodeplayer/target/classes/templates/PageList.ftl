<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" th:href="@{${layui_css}}"  media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<div class="searchTable">
    搜索ID：
    <div class="layui-inline">
        <input class="layui-input" name="id" id="searchReload" autocomplete="off">
    </div>
    <button id="searchBtn" class="layui-btn" data-type="reload">搜索</button>
</div>
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
    layui.use(['jquery','table'], function(){
        var table = layui.table;

        table.render({
            elem: '#${model_simple_name}'
            ,url:'${list_url}'
            ,method: 'post'
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                ,layEvent: 'LAYTABLE_TIPS'
                ,icon: 'layui-icon-tips'
            }]
            ,title: '${model_simple_name}'
            ,cols: [
                [
                {type: 'checkbox', fixed: 'left'}
            <#if model_columnList?exists>
              <#list model_columnList as model>
              ,{field: ${r"'"}${model.changeColumnName?uncap_first}${r"'"}, title:${r"'"}${model.columnComment}${r"'"},  align:'center' }
              </#list>
            </#if>
              ,{fixed: 'right', title:'操作', toolbar: '#barDemo'}
            ]
            ]
            ,page: true
            ,request: {
                pageName: 'currentPageNum' //页码的参数名称，默认：page
                ,limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }
            ,parseData: function(res){ //res 即为原始返回的数据
                return {
                    "code": 0, //解析接口状态
                    "msg": "", //解析提示文本
                    "count": res.totalRecords, //解析数据长度
                    "data": res.recordList //解析数据列表
                };
            }

        });



        var $ = layui.$, active = {
            reload: function(){
                var id$_ = $('#searchReload');
                var queryWhere = {};
                queryWhere['id'] = id$_.val();
                //执行重载
                table.reload('${model_simple_name}', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: queryWhere
                }, 'data');
            }
        };

        $('.searchTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        //头工具栏事件
        table.on('toolbar(${model_simple_name})', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                //自定义头工具栏右侧图标 - 提示
                case 'add':
                    //iframe层-父子操作
                {
                    layer.open({
                        type: 2,
                        area: ['700px', '450px'],
                        fixed: false, //不固定
                        maxmin: true,
                        content: '/${model_simple_name?uncap_first}/add'
                    });
                }
                    break;
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
                    $.post("/${model_simple_name?uncap_first}/delete",{"id":data.id},function (data) {
                        layer.msg(data);
                    },"json");
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                //iframe层-父子操作
                layer.open({
                    type: 2,
                    area: ['700px', '450px'],
                    fixed: false, //不固定
                    maxmin: true,
                    content: '/${model_simple_name?uncap_first}/update?id=' + data.id
                });
            }
        });

    });


</script>

</body>
</html>