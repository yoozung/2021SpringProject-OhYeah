package com.work.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Utility {
	public static String getCurrentDate() {

		SimpleDateFormat today = new SimpleDateFormat("yyyyMMdd");

		Calendar calendar = Calendar.getInstance();

		String strToday = today.format(calendar.getTime());

		return strToday;

	}
}
