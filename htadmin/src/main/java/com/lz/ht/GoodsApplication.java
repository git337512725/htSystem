package com.lz.ht;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author Administrator
 */
@MapperScan("com.zs.goods.dao")
@SpringBootApplication
public class  GoodsApplication {

    public static void main(String[] args) {
        SpringApplication.run( GoodsApplication.class, args);
    }

}
