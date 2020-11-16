package com.sswh.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import redis.clients.jedis.JedisPoolConfig;
import redis.clients.jedis.JedisShardInfo;
import redis.clients.jedis.ShardedJedisPool;

import java.util.ArrayList;
import java.util.List;

/**
 * @author nfwy
 * @date 2020/8/31 21:51
 */

@Configuration
public class RedisPoolConfig {

    @Bean
    public ShardedJedisPool shardedJedisPool(JedisPoolConfig jedisPoolConfig, List<JedisShardInfo> jedisShardInfos){
        return new ShardedJedisPool(jedisPoolConfig, jedisShardInfos);
    }
    @Bean
    public JedisPoolConfig jedisPoolConfig(){
        JedisPoolConfig jedisPoolConfig = new JedisPoolConfig();
        jedisPoolConfig.setMaxTotal(100);
        jedisPoolConfig.setMaxIdle(20);
        jedisPoolConfig.setMaxWaitMillis(5000);
        jedisPoolConfig.setTestOnBorrow(true);
        return jedisPoolConfig;
    }
    @Bean
    public List<JedisShardInfo> jedisShardInfos(){
        List<JedisShardInfo> jedisShardInfos = new ArrayList<>();
        jedisShardInfos.add(new JedisShardInfo("127.0.0.1",6379,"127.0.0.1"));
        return jedisShardInfos;
    }
}

