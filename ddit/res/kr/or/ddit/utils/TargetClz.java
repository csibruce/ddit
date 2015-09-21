package kr.or.ddit.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TargetClz {
	public static Integer plus(Integer x, Integer y){
		return x + y;
	}
	
	public static String times(){
		SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyy/MM/dd");
		return simpleFormat.format(new Date());
	}
	
	// charCount(가나다마바사가나,"가")
	public static Integer charCount(String target, String delim){
		int inx = 0;
		int icount = 0;
		inx = target.indexOf(delim);
		for(;inx!=-1;icount++){
			delim = target.substring(target.indexOf(delim)+1,target.length());
			inx = target.indexOf(delim);
		}
		return icount;
	}
}
