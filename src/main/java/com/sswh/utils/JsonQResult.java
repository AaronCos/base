package com.sswh.utils;

import java.io.Serializable;

/**
 * 针对layui的json返回格式封装的map工具类
 * @author nuanfeng
 */
public class JsonQResult implements Serializable {

    /**
     * 解析接口状态代码
     */
    private int code;
    /**
     * 对提示的代码做进一步解释说明
     */
    private String msg;
    /**
     * 解析数据长度
     */
    private int count;
    /**
     * 解析数据列表
     */
    private Object data;

    private JsonQResult() {
    }

    public static  JsonQResult getInstance(){
        return new JsonQResult();
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
