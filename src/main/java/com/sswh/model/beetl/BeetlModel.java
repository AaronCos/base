package com.sswh.model.beetl;

import com.sswh.utils.beetl.GroupTemplateGenerator;
import org.beetl.core.GroupTemplate;
import org.beetl.core.ResourceLoader;
import org.beetl.core.Template;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

/**
 * @author nuanfeng
 * @date 2020/4/21 22:14
 */
@Controller
public class BeetlModel {

    @Resource(name = "resourceLoader")
    ResourceLoader resourceLoader;

    public void example(){

    }

    public static void main(String[] args) {
        useBeetl();
    }

    public static  void useBeetl(){
        GroupTemplate groupTemplate = GroupTemplateGenerator.getInstance();
        Template t = groupTemplate.getTemplate("hello,${name}");
        t.binding("name","beetl");
        String str = t.render();
        System.out.println(str);
    }

    /**
     * @PostConstruct
     * beetl在web项目中的使用案例
     * 1。 resourceLoader 注入模板源头
     */
    public void testModel(){
        GroupTemplate groupTemplate = GroupTemplateGenerator.getInstance();
        Template template = groupTemplate.getTemplate("testbeetl.html", resourceLoader);
        template.binding("name","beetl");
        String str = template.render();
        System.out.println(str);
    }
}
