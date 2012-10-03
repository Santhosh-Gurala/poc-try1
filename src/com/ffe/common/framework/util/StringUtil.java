package com.ffe.common.framework.util;


public class StringUtil {

	public static boolean isNullorEmpty(String value) {
		
		if(null!= value && !ConstantUtil.EMPTY_STRING.equalsIgnoreCase(value.trim())){
		return false;
		}else 
			return true ;
	}

	public static boolean isNullorEmptyorZero(String value) {

		if(null!= value 
				&& !ConstantUtil.EMPTY_STRING.equalsIgnoreCase(value.trim())
				&& !"0".equalsIgnoreCase(value.trim())){
			return false;
		}else 
			return true ;
	}

	
}

