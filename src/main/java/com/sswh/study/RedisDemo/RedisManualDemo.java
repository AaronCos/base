package com.sswh.study.RedisDemo;


import com.sswh.util.RedisCacheUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("manual")
public class RedisManualDemo {


    @RequestMapping("putObj")
    public void addInfo(){
        boolean b = RedisCacheUtil.putObject("zhangqingqing", "nihao");
        System.out.println(b);
    }
}
