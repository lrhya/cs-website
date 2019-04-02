
package com.jplus.util;

/**
 * Created by rf on 2017/8/13.
 */
public class StringUtil {
    public static boolean isBlank(String str){
        return str == null || "".equals(str.trim());
    }
}
