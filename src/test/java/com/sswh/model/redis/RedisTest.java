package com.sswh.model.redis;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;
import com.sswh.util.RedisCacheUtil;
import com.sun.codemodel.internal.fmt.JSerializedObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import redis.clients.jedis.ShardedJedis;
import redis.clients.jedis.ShardedJedisPool;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

/**
 * JedisApi
 * @author nuanfeng
 * @date 2020/9/1 23:03
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"}) //加载配置文件
public class RedisTest {


    @Autowired
    ShardedJedisPool shardedJedisPool;

    @Test
    public void testPush(){
        try (ShardedJedis resource = shardedJedisPool.getResource()) {
            //resource.lpush("hello","world");
            resource.set("hello","world");
            resource.lpush("cat","tiger","bao");
            System.out.println(resource.get("hello"));
            for (int i = 0; i < 100; i++) {
                resource.lindex("circle",i);
            }


        }

    }

    @Test
    public void test(){
        Man man = new Man();
        man.setId(1);
        man.setAge(20);
        man.setName("gbl");
        RedisCacheUtil.putObject("good",man);
        try {
            man = RedisCacheUtil.getObject("good", new TypeReference<Man>() {
            });
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println(man.getName());
    }

    @Test
    public void testPushList(){
        try (ShardedJedis resource = shardedJedisPool.getResource()) {
            List<Man> manlist = new ArrayList<>();
            for (int i = 0;i<100;i++){
                Man man = new Man();
                man.setAge((int) Math.random());
                man.setName("wang"+i);
                man.setId(i);
                manlist.add(man);
            }



            resource.set("listkey".getBytes(Charset.defaultCharset()), JSONObject.toJSONBytes(manlist));
            String listkey = resource.get("listkey");
            JSONArray array = (JSONArray) JSONArray.parse(listkey);
            System.out.println(array.size());


            Man man = new Man();
            man.setName("王成成");
            man.setAge(1);
            man.setId(1);

            String set = resource.set("selfObject".getBytes(Charset.defaultCharset()), JSON.toJSONBytes(man));
            System.out.println("-----"+set);

            System.out.println(listkey);
            // String cat = resource.lpop("cat");
            //System.out.println(cat);
            //resource.get("cat");

        }
    }


}
class Man{
    int id;
    String name;
    int age;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}