
package com.jplus.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Created by rf on 2017/9/15.
 */
public class MD5Util {
    public static String encode(String plainText) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(plainText.getBytes());
            byte b[] = md.digest();
            int i;
            StringBuilder buf = new StringBuilder("");
            for (int offset = 0; offset < b.length; offset++) {
                i = b[offset];
                if (i < 0) {
                    i += 256;
                }
                if (i < 16) {
                    buf.append("0");
                }
                buf.append(Integer.toHexString(i));
            }
            return buf.toString();// 32位的加密

        } catch (NoSuchAlgorithmException e) {
            return null;
        }
    }
}
