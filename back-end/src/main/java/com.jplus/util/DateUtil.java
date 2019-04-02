
package com.jplus.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by rf on 2017/9/17.
 */
public class DateUtil {
    public static String getFormatDate(){
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return dateFormat.format(new Date());
    }
    public static String getEntranceDate(String entrancetime) {
        if(entrancetime!=null){
            SimpleDateFormat simpleDateFormat =new SimpleDateFormat("yyyy-MM-dd");
           return simpleDateFormat.format(entrancetime);
        }
        return null;
    }
}
