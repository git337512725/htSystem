package com.lz.ht;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @author Administrator
 */
@EnableTransactionManagement
@MapperScan("com.lz.ht.dao")
@SpringBootApplication
public class  GoodsApplication {

    public static void main(String[] args) {
        SpringApplication.run( GoodsApplication.class, args);
    }

}



