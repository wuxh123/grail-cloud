package com.cloud.hbase;

import org.apache.hadoop.hbase.HBaseConfiguration;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;

import com.cloud.hbase.HBaseService;

/**
 * HBase相关配置
 *
 * @author wuxh
 * @date 2019/3/3
 * @since 1.0.0
 */
@Configuration
@Order(1)
public class HBaseConfig {
    @Value("${HBase.nodes}")
    private String nodes;

    @Value("${HBase.maxsize}")
    private String maxsize;
    
    @Value("${HBase.port}")
    private String port;

    HBaseConfig(){}

    @Bean
    @Order(2)
    public HBaseService getHbaseService(){
        org.apache.hadoop.conf.Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.zookeeper.quorum",nodes); 
        conf.set("hbase.zookeeper.property.clientPort",port); 
        conf.set("log4j.logger.org.apache.hadoop.hbase","WARN");
        conf.set("hbase.client.keyvalue.maxsize",maxsize);
        
        return new HBaseService(conf);
    }
}
