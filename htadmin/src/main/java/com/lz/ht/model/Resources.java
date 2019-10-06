package com.lz.ht.model;
import java.lang.*;
import java.sql.*;
import java.util.Date;

public class Resources {
        private Long id;
        /** 资源名称 */
        private String name;
        /** 资源id */
        private Long resKey;
        /** 资源链接 */
        private String resUrl;
        /** 父资源id */
        private Long presKey;
        /** 父资源名称 */
        private String pName;
        /** 资源排序 */
        private Long sort;
        /** 0 启用 1 禁用 */
        private Long type;

        public void setId(Long id){
            this.id = id;
        }

        public Long getId() {
            return this.id;
        }

        public void setName(String name){
            this.name = name;
        }

        public String getName() {
            return this.name;
        }

        public void setResKey(Long resKey){
            this.resKey = resKey;
        }

        public Long getResKey() {
            return this.resKey;
        }

        public void setResUrl(String resUrl){
            this.resUrl = resUrl;
        }

        public String getResUrl() {
            return this.resUrl;
        }

        public void setPresKey(Long presKey){
            this.presKey = presKey;
        }

        public Long getPresKey() {
            return this.presKey;
        }

        public void setPName(String pName){
            this.pName = pName;
        }

        public String getPName() {
            return this.pName;
        }

        public void setSort(Long sort){
            this.sort = sort;
        }

        public Long getSort() {
            return this.sort;
        }

        public void setType(Long type){
            this.type = type;
        }

        public Long getType() {
            return this.type;
        }



}