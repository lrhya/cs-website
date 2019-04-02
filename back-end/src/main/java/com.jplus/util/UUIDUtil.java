
package com.jplus.util;

import org.junit.Test;

import java.util.UUID;

/**
 * Created by rf on 2017/8/16.
 */
public class UUIDUtil {
    public static String getUUID(){
        return UUID.randomUUID().toString();
    }
    @Test
    public void  getUuid(){
        System.out.println(UUIDUtil.getUUID().length());
    }
}
