package com.sswh.study.threadDemo;

import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class ReentrantLockDemo {

    private static final Lock rlock = new ReentrantLock();

    public static void main(String[] args) {
        String a = "";
        for (int i = 0; i < 4001; i++) {
            a+="<";
        }
        System.out.println(a);
        String b = "";
        System.out.println(b.length());
    }

}
