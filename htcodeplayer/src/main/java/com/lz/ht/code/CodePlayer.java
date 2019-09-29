package com.lz.ht.code;

import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.springframework.util.StringUtils;

import java.io.*;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class CodePlayer {


    public static String htSystemPath = "E:/kj/htSystem";

    public static String outDir =  htSystemPath + "/htadmin/src/main/java";

    public static String basePackageName = "com.lz.ht";

    public static String defaultMapperDir = htSystemPath +  "/htadmin/src/main/resources/xml/mapper";

    public static String defaultPageDir = htSystemPath +  "/htadmin/src/main/resources/templates" ;

    public static String layUICSS = "/alllayui/layui/css/layui.css";

    public static String layUIJS = "/alllayui/layui/layui.js";


    public static String basePackageDirs = basePackageName.replace('.','/');

    public static void main(String[] args) throws IOException, TemplateException, SQLException {
        List<String> myboot = JdbcUtil.findAllTables("myboot");
        for (String tableName: myboot) {
            createModel(tableName);
            createDto(tableName);
            createController(tableName);
            createServiceInterface(tableName);
            createServiceImpl(tableName);
            createMapperInterface(tableName);
            createMapperXML(tableName);
            createPage(tableName,layUIJS,layUICSS);
        }

    }




    /**创建Model**/
    public static void createModel(String tableName) throws SQLException, IOException, TemplateException {
        List<ColumnClass> columnClassList = getColumnClasses(tableName);
        Map<String,Object> dataMap = new HashMap<>();
        dataMap.put("model_columnList",columnClassList);
        System.out.println("model_columnList:" + Arrays.toString(columnClassList.toArray()));
        String upperCase = replaceUnderLineAndUpperCase(tableName);
        System.out.println(upperCase);
        dataMap.put("model_simple_name",upperCase);
        dataMap.put("package_name", basePackageName);
        createJavaByTemplate("Model.ftl",upperCase,dataMap,outDir);
    }


    /**创建Dto**/
    public static void createDto(String tableName) throws IOException, TemplateException {
        Map<String,Object> dataMap = new HashMap<>();
        String upperCase = replaceUnderLineAndUpperCase(tableName);
        System.out.println(upperCase);
        dataMap.put("model_simple_name",upperCase);
        dataMap.put("package_name", basePackageName);
        createJavaByTemplate("Dto.ftl",upperCase,dataMap,outDir);
    }



    public static void createMapperInterface(String tableName) throws IOException, TemplateException {
        Map<String,Object> dataMap = new HashMap<>();
        String upperCase = replaceUnderLineAndUpperCase(tableName);
        System.out.println(upperCase);
        dataMap.put("model_simple_name",upperCase);
        dataMap.put("package_name", basePackageName);
        createMapperInterfaceByTemplate("Mapper.ftl",upperCase,dataMap,outDir);
    }

    private static void createMapperInterfaceByTemplate(String templateName, String modelSimpleName, Map<String, Object> templateVars, String outDir) throws IOException, TemplateException {
        String createJavaFileName = modelSimpleName + templateName.substring(0,templateName.lastIndexOf('.')) + ".java";
        System.out.println(createJavaFileName);
        Template template = FreeMarkerTemplateUtils.getTemplate(templateName);
        String dir = createDir(outDir, basePackageDirs + "/dao" );
        FileOutputStream fileOutputStream = new FileOutputStream(new File(dir + "/" + createJavaFileName));
        Writer out = new BufferedWriter(new OutputStreamWriter(fileOutputStream, "utf-8"),10240);
        template.process(templateVars,out);
    }


    public static void createMapperXML(String tableName) throws IOException, TemplateException, SQLException {
        List<ColumnClass> columnClassList = getColumnClasses(tableName);
        Map<String,Object> dataMap = new HashMap<>();
        dataMap.put("model_columnList",columnClassList);
        System.out.println("model_columnList:" + Arrays.toString(columnClassList.toArray()));
        String upperCase = replaceUnderLineAndUpperCase(tableName);
        System.out.println(upperCase);
        dataMap.put("model_simple_name",upperCase);
        dataMap.put("package_name", basePackageName);
        dataMap.put("table_name", tableName);
        createMapperXMLFileByTemplate("MapperXML.ftl",upperCase,dataMap,defaultMapperDir);
    }

    public static List<ColumnClass> getColumnClasses(String tableName) throws SQLException {
        Connection connection = JdbcUtil.getConnection();
        DatabaseMetaData databaseMetaData = connection.getMetaData();
        ResultSet resultSet = databaseMetaData.getColumns(null, "%", tableName, "%");
        List<ColumnClass> columnClassList = new ArrayList<>();
        ColumnClass columnClass = null;
        while (resultSet.next()) {
            //id字段略过
            //if(resultSet.getString("COLUMN_NAME").equals("id")) continue;
            columnClass = new ColumnClass();
            //获取字段名称
            columnClass.setColumnName(resultSet.getString("COLUMN_NAME"));
            //获取字段类型
            columnClass.setColumnType(resultSet.getString("TYPE_NAME"));
            //转换字段名称，如 sys_name 变成 SysName
            columnClass.setChangeColumnName(replaceUnderLineAndUpperCase(resultSet.getString("COLUMN_NAME")));
            //字段在数据库的注释
            columnClass.setColumnComment(resultSet.getString("REMARKS"));
            columnClassList.add(columnClass);
        }
        return columnClassList;
    }


    /**去掉下划线，变成每个单词首字母大写*/
    public static String replaceUnderLineAndUpperCase(String str){
        StringBuffer sb = new StringBuffer();
        sb.append(str);
        int count = sb.indexOf("_");
        while(count!=0){
            int num = sb.indexOf("_",count);
            count = num + 1;
            if(num != -1){
                char ss = sb.charAt(count);
                char ia = (char) (ss - 32);
                sb.replace(count , count + 1,ia + "");
            }
        }
        String result = sb.toString().replaceAll("^t_","");
        result = result.replaceAll("_","");
        return StringUtils.capitalize(result);
    }

    public static void createPage(String tableName,String js,String css) throws IOException, TemplateException, SQLException {
        List<ColumnClass> columnClassList = getColumnClasses(tableName);
        Map<String,Object> dataMap = new HashMap<>();
        dataMap.put("model_columnList",columnClassList);
        System.out.println("model_columnList:" + Arrays.toString(columnClassList.toArray()));
        String upperCase = replaceUnderLineAndUpperCase(tableName);
        System.out.println(upperCase);
        dataMap.put("model_simple_name",upperCase);
        dataMap.put("package_name", basePackageName);
        dataMap.put("table_name", tableName);
        dataMap.put("list_url", getResourceUrl(tableName,"list"));
        dataMap.put("list_add", getResourceUrl(tableName,"add"));
        dataMap.put("list_update", getResourceUrl(tableName,"update"));
        dataMap.put("list_delete", getResourceUrl(tableName,"delete"));
        dataMap.put("layui_js",js);
        dataMap.put("layui_css",css);
        createPageByTemplate("PageList.ftl",upperCase,dataMap,defaultPageDir);
        createPageByTemplate("PageAdd.ftl",upperCase,dataMap,defaultPageDir);
        createPageByTemplate("PageUpdate.ftl",upperCase,dataMap,defaultPageDir);
    }


    private static String getResourceUrl(String tableName, String list_add_update_delete){
        return "/" + tableName2moduleName(tableName) + "/" + list_add_update_delete;
    }

    private static String  tableName2moduleName(String tableName){
        String s = replaceUnderLineAndUpperCase(tableName);
        return  (s.charAt(0)+"").toLowerCase() + s.substring(1);
    }

    public static void createServiceInterface(String tableName) throws IOException, TemplateException {
        Map<String,Object> map = new HashMap<>();
        String modelSimpleName = replaceUnderLineAndUpperCase(tableName);
        System.out.println(modelSimpleName);
        map.put("model_simple_name",modelSimpleName);
        map.put("package_name",basePackageName);
        createJavaByTemplate("Service.ftl" ,modelSimpleName, map,outDir);
    }


    public static void createServiceImpl(String tableName) throws IOException, TemplateException {
        Map<String,Object> map = new HashMap<>();
        String modelSimpleName = replaceUnderLineAndUpperCase(tableName);
        System.out.println(modelSimpleName);
        map.put("model_simple_name",modelSimpleName);
        map.put("package_name",basePackageName);
        createJavaByTemplate("ServiceImpl.ftl" ,modelSimpleName, map,outDir);
    }

    public static void createController(String tableName) throws IOException, TemplateException {
        Map<String,Object> map = new HashMap<>();
        String modelSimpleName = replaceUnderLineAndUpperCase(tableName);
        System.out.println(modelSimpleName);
        map.put("model_simple_name",modelSimpleName);
        map.put("package_name",basePackageName);
        map.put("list_url", getResourceUrl(tableName,"list"));
        map.put("list_add", getResourceUrl(tableName,"add"));
        map.put("list_update", getResourceUrl(tableName,"update"));
        map.put("list_delete", getResourceUrl(tableName,"delete"));
        createJavaByTemplate("Controller.ftl" ,modelSimpleName, map,outDir);
    }


    private static void createJavaByTemplate(String templateName, String modelSimpleName, Map<String,Object> templateVars,String outDir) throws IOException, TemplateException {
        String createJavaFileName =  "";
        if(templateName.equalsIgnoreCase("Model.ftl") ){
            createJavaFileName = modelSimpleName + ".java" ;
        }else{
            createJavaFileName = modelSimpleName + templateName.substring(0,templateName.lastIndexOf('.')) + ".java";
        }
        System.out.println(createJavaFileName);
        Template template = FreeMarkerTemplateUtils.getTemplate(templateName);
        String dir = "";
        if(templateName.equalsIgnoreCase("ServiceImpl.ftl")){
            dir =   createDir(outDir,  basePackageDirs + "/service/" + StringFirstToLower(templateName.substring(0, templateName.lastIndexOf('.'))));
        }else{
            dir = createDir(outDir,  basePackageDirs + "/" + StringFirstToLower(templateName.substring(0, templateName.lastIndexOf('.'))));
        }
        FileOutputStream fileOutputStream = new FileOutputStream(new File(dir + "/" + createJavaFileName));
        Writer out = new BufferedWriter(new OutputStreamWriter(fileOutputStream, "utf-8"),10240);
        template.process(templateVars,out);
    }

    private static void createPageByTemplate(String templateName, String modelSimpleName, Map<String,Object> templateVars,String outDir) throws IOException, TemplateException {
        String createPageFileName = "";
        String moduleName  = (modelSimpleName.charAt(0)+"").toLowerCase() + modelSimpleName.substring(1);
        if("PageList.ftl".equalsIgnoreCase(templateName)){
            createPageFileName = moduleName+ "_list.html";
        }else if("PageAdd.ftl".equalsIgnoreCase(templateName)){
            createPageFileName = moduleName+ "_add.html";
        }else if("PageUpdate.ftl".equalsIgnoreCase(templateName)) {
            createPageFileName = moduleName+ "_update.html";
        }
        System.out.println(createPageFileName);
        Template template = FreeMarkerTemplateUtils.getTemplate(templateName);
        String dir = createDir(outDir + "/" + moduleName );
        FileOutputStream fileOutputStream = new FileOutputStream(new File(dir + "/" + createPageFileName));
        Writer out = new BufferedWriter(new OutputStreamWriter(fileOutputStream, "utf-8"),10240);
        template.process(templateVars,out);
    }

    private static void createMapperXMLFileByTemplate(String templateName, String modelSimpleName, Map<String,Object> templateVars,String mapperDir) throws IOException, TemplateException {
        String createMapperFileName = modelSimpleName  + "Mapper.xml";
        System.out.println(createMapperFileName);
        Template template = FreeMarkerTemplateUtils.getTemplate(templateName);
        String dir = createDir(mapperDir);
        FileOutputStream fileOutputStream = new FileOutputStream(new File(dir + "/" + createMapperFileName));
        Writer out = new BufferedWriter(new OutputStreamWriter(fileOutputStream, "utf-8"),10240);
        template.process(templateVars,out);
    }



    private static String createDir(String outDir,String basePackageDirs){
        File dir  = new File(outDir+ "/" + basePackageDirs);
        if(!dir.exists()){
            dir.mkdirs();
        }
        return dir.getAbsolutePath();
    }
    private static String createDir(String dirStr){
        File dir  = new File(dirStr);
        if(!dir.exists()){
            dir.mkdirs();
        }
        return dir.getAbsolutePath();
    }


    private static String StringFirstToLower(String str){
        if(!StringUtils.isEmpty(str)){
            String firstChar = str.charAt(0)+"";
            str = firstChar.toLowerCase() + str.substring(1);
            return str;
        }
       return null;
    }
}
