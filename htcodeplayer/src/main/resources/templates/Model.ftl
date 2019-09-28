package ${package_name}.model;
import java.lang.*;
import java.sql.*;
import java.util.Date;

public class ${model_simple_name} {
<#if model_columnList?exists>
<#list model_columnList as model>
    <#if model.columnComment!='' >
        /** ${model.columnComment!} */
    </#if>
    <#if (model.columnType == 'VARCHAR' || model.columnType == 'TEXT'   )>
        private String ${model.changeColumnName?uncap_first};
    </#if>
    <#if (model.columnType == 'CHAR' )>
        private String ${model.changeColumnName?uncap_first};
    </#if>
    <#if model.columnType ==  'TIMESTAMP' >
        private Date ${model.changeColumnName?uncap_first};
    </#if>
    <#if model.columnType ==  'BLOB' >
        private byte[] ${model.changeColumnName?uncap_first};
    </#if>
    <#if model.columnType== 'INTEGER UNSIGNED' || model.columnType ==  'INTEGER'   || model.columnType ==  'INT'  >
        private Long ${model.changeColumnName?uncap_first};
    </#if>
    <#if model.columnType ==  'TINYINT UNSIGNED' || model.columnType ==  'TINYINT'    >
        private Integer ${model.changeColumnName?uncap_first};
    </#if>
    <#if model.columnType == 'SMALLINT UNSIGNED' || model.columnType ==  'SMALLINT'    >
        private Integer ${model.changeColumnName?uncap_first};
    </#if>
    <#if model.columnType == 'MEDIUMINT UNSIGNED' || model.columnType ==  'MEDIUMINT'    >
        private Integer ${model.changeColumnName?uncap_first};
    </#if>
    <#if model.columnType ==  'BIT' >
        private Boolean ${model.changeColumnName?uncap_first};
    </#if>
    <#if model.columnType ==  'BIGINT'  || model.columnType ==  'BIGINT UNSIGNED'>
        private java.math.BigInteger ${model.changeColumnName?uncap_first};
    </#if>
    <#if model.columnType ==  'FLOAT' >
        private Float ${model.changeColumnName?uncap_first};
    </#if>
    <#if model.columnType ==  'DOUBLE' >
        private Double ${model.changeColumnName?uncap_first};
    </#if>
    <#if model.columnType ==  'DECIMAL' >
        private java.math.BigDecimal ${model.changeColumnName?uncap_first};
    </#if>
    <#if model.columnType ==  'DATE' >
        private java.sql.Date ${model.changeColumnName?uncap_first};
    </#if>
    <#if model.columnType ==  'TIME' >
        private java.sql.Time  ${model.changeColumnName?uncap_first};
    </#if>
    <#if model.columnType == 'DATETIME' >
        private  java.sql.Timestamp ${model.changeColumnName?uncap_first};
    </#if>
    <#if model.columnType == 'YEAR' >
        private java.sql.Date ${model.changeColumnName?uncap_first};
    </#if>
</#list>
</#if>

<#if model_columnList?exists>
<#list model_columnList as model>
    <#if (model.columnType == 'VARCHAR' || model.columnType == 'TEXT'   )>
        public void set${model.changeColumnName}(String ${model.changeColumnName?uncap_first}){
            this.${model.changeColumnName?uncap_first} = ${model.changeColumnName?uncap_first};
        }
        public String get${model.changeColumnName}() {
            return this.${model.changeColumnName?uncap_first};
        }
    </#if>
    <#if (model.columnType == 'CHAR' )>
        public void set${model.changeColumnName}(String ${model.changeColumnName?uncap_first}){
            this.${model.changeColumnName?uncap_first} = ${model.changeColumnName?uncap_first};
        }
        public String get${model.changeColumnName}() {
            return this.${model.changeColumnName?uncap_first};
        }
    </#if>
    <#if model.columnType ==  'TIMESTAMP' >
        public void set${model.changeColumnName}(java.sql.Date ${model.changeColumnName?uncap_first}){
            this.${model.changeColumnName?uncap_first} = ${model.changeColumnName?uncap_first};
        }
        public java.sql.Date get${model.changeColumnName}() {
            return this.${model.changeColumnName?uncap_first};
        }
    </#if>
    <#if model.columnType ==  'BLOB' >
        public void set${model.changeColumnName}(byte[] ${model.changeColumnName?uncap_first}){
            this.${model.changeColumnName?uncap_first} = ${model.changeColumnName?uncap_first};
        }
        public byte[] get${model.changeColumnName}() {
            return this.${model.changeColumnName?uncap_first};
        }
    </#if>
    <#if model.columnType== 'INTEGER UNSIGNED' || model.columnType ==  'INTEGER'   || model.columnType ==  'INT'  >
        public void set${model.changeColumnName}(Long ${model.changeColumnName?uncap_first}){
            this.${model.changeColumnName?uncap_first} = ${model.changeColumnName?uncap_first};
        }
        public Long get${model.changeColumnName}() {
            return this.${model.changeColumnName?uncap_first};
        }
    </#if>
    <#if model.columnType ==  'TINYINT UNSIGNED' || model.columnType ==  'TINYINT'    >
        public void set${model.changeColumnName}(Integer ${model.changeColumnName?uncap_first}){
            this.${model.changeColumnName?uncap_first} = ${model.changeColumnName?uncap_first};
        }
        public Integer get${model.changeColumnName}() {
            return this.${model.changeColumnName?uncap_first};
        }
    </#if>
    <#if model.columnType == 'SMALLINT UNSIGNED' || model.columnType ==  'SMALLINT'    >
        public void set${model.changeColumnName}(Integer ${model.changeColumnName?uncap_first}){
            this.${model.changeColumnName?uncap_first} = ${model.changeColumnName?uncap_first};
        }
        public Integer get${model.changeColumnName}() {
            return this.${model.changeColumnName?uncap_first};
        }
    </#if>
    <#if model.columnType == 'MEDIUMINT UNSIGNED' || model.columnType ==  'MEDIUMINT'    >
        public void set${model.changeColumnName}(Integer ${model.changeColumnName?uncap_first}){
            this.${model.changeColumnName?uncap_first} = ${model.changeColumnName?uncap_first};
        }
        public Integer get${model.changeColumnName}() {
            return this.${model.changeColumnName?uncap_first};
        }
    </#if>
    <#if model.columnType ==  'BIT' >
        public void set${model.changeColumnName}(Boolean ${model.changeColumnName?uncap_first}){
            this.${model.changeColumnName?uncap_first} = ${model.changeColumnName?uncap_first};
        }
        public Boolean get${model.changeColumnName}() {
            return this.${model.changeColumnName?uncap_first};
        }
    </#if>
    <#if model.columnType ==  'BIGINT'  || model.columnType ==  'BIGINT UNSIGNED'>
        public void set${model.changeColumnName}(java.math.BigInteger ${model.changeColumnName?uncap_first}){
            this.${model.changeColumnName?uncap_first} = ${model.changeColumnName?uncap_first};
        }
        public java.math.BigInteger get${model.changeColumnName}() {
            return this.${model.changeColumnName?uncap_first};
        }
    </#if>
    <#if model.columnType ==  'FLOAT' >
        public void set${model.changeColumnName}(Float ${model.changeColumnName?uncap_first}){
           this.${model.changeColumnName?uncap_first} = ${model.changeColumnName?uncap_first};
        }
        public Float get${model.changeColumnName}() {
            return this.${model.changeColumnName?uncap_first};
        }
    </#if>
    <#if model.columnType ==  'DOUBLE' >
        public void set${model.changeColumnName}(Double ${model.changeColumnName?uncap_first}){
            this.${model.changeColumnName?uncap_first} = ${model.changeColumnName?uncap_first};
        }
        public Double get${model.changeColumnName}() {
            return this.${model.changeColumnName?uncap_first};
        }
    </#if>
    <#if model.columnType ==  'DECIMAL' >
        public void set${model.changeColumnName}(java.math.BigDecimal ${model.changeColumnName?uncap_first}){
            this.${model.changeColumnName?uncap_first} = ${model.changeColumnName?uncap_first};
        }
        public java.math.BigDecimal get${model.changeColumnName}() {
            return this.${model.changeColumnName?uncap_first};
        }
    </#if>
    <#if model.columnType ==  'DATE' >
        public void set${model.changeColumnName}(java.sql.Date ${model.changeColumnName?uncap_first}){
            this.${model.changeColumnName?uncap_first} = ${model.changeColumnName?uncap_first};
        }
        public java.sql.Date get${model.changeColumnName}() {
            return this.${model.changeColumnName?uncap_first};
        }
    </#if>
    <#if model.columnType ==  'TIME' >
        public void set${model.changeColumnName}(java.sql.Time  ${model.changeColumnName?uncap_first}){
            this.${model.changeColumnName?uncap_first} = ${model.changeColumnName?uncap_first};
        }
        public java.sql.Time get${model.changeColumnName}() {
            return this.${model.changeColumnName?uncap_first};
        }
    </#if>
    <#if model.columnType == 'DATETIME' >
        public void set${model.changeColumnName}(java.sql.Timestamp ${model.changeColumnName?uncap_first}){
            this.${model.changeColumnName?uncap_first} = ${model.changeColumnName?uncap_first};
        }
        public java.sql.Timestamp get${model.changeColumnName}() {
            return this.${model.changeColumnName?uncap_first};
        }
    </#if>
    <#if model.columnType == 'YEAR' >
        public void set${model.changeColumnName}(java.sql.Date ${model.changeColumnName?uncap_first}){
            this.${model.changeColumnName?uncap_first} = ${model.changeColumnName?uncap_first};
        }
        public java.sql.Date get${model.changeColumnName}() {
            return this.${model.changeColumnName?uncap_first};
        }
    </#if>
</#list>
</#if>


}