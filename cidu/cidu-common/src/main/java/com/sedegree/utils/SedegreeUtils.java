package com.sedegree.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class SedegreeUtils {
	
	private static SimpleDateFormat sdft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	public static String getUUID(){
		String uuid = UUID.randomUUID().toString();
		return uuid.replace("-", "");
	}

	public static Date getCurrentTimestamp() {
		String date = sdft.format(new Date());
		try {
			return sdft.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
}
