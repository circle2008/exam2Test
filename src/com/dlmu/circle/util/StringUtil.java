package com.dlmu.circle.util;

/**
 * Created by cf on 2017/4/9.
 */
public class StringUtil {
    public static boolean isEmpty(String str){
        if("".equals(str)|| str==null){
            return true;
        }else{
            return false;
        }
    }
    public static boolean isNotEmpty(String str){
        if(!"".equals(str)&&str!=null){
            return true;
        }else{
            return false;
        }
    }
}
