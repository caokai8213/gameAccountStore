package cn.com.util;

import java.util.UUID;

public class UUIDUtils {
    
    public static String getUUID(){
        return UUID.randomUUID().toString().replaceAll("-", "");
    }
    public void main(String args[]){
        System.out.println(UUIDUtils.getUUID());
    }
}