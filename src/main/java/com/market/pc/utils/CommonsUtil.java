package com.market.pc.utils;

import java.io.PrintStream;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CommonsUtil
{
  public static final String DATE_FORMAT_DATE_NOT_CHAR = "yyyyMMdd";
  public static final String DATE_FORMAT_TIME_NOT_CHAR = "yyyyMMddHHmmss";
  public static final String DATE_FORMAT_MILLISECOND_TIME_NOT_CHAR = "yyyyMMddHHmmssSSS";
  public static final String DATE_FORMAT_DATE = "yyyy-MM-dd";
  public static final String DATE_FORMAT_TIME = "yyyy-MM-dd HH:mm:ss";
  public static final String DATE_FORMAT_MILLISECOND_TIME = "yyyy-MM-dd HH:mm:ss.SSS";
  
  public static boolean isLeapYear(Date date)
  {
    Calendar c = Calendar.getInstance();
    c.setTime(date);
    int year = c.get(1);
    return isLeapYear(year);
  }
  
  public static boolean isLeapYear(int year)
  {
    if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) {
      return true;
    }
    return false;
  }
  
  public static boolean isLeapYear(Calendar calendar)
  {
    return isLeapYear(calendar.get(1));
  }
  
  public static boolean isCommonYear(Date date)
  {
    return !isLeapYear(date);
  }
  
  public static boolean isCommonYear(int year)
  {
    return !isLeapYear(year);
  }
  
  public static boolean isCommonYear(Calendar calendar)
  {
    return !isLeapYear(calendar);
  }
  
  private static Date formatTime(String date, String dateFormat)
    throws ParseException
  {
    if ((date == null) || ("".equals(date))) {
      return null;
    }
    SimpleDateFormat format = new SimpleDateFormat(dateFormat);
    return format.parse(date);
  }
  
  public static Date formatTime(String date)
    throws ParseException
  {
    return formatTime(date, "yyyy-MM-dd HH:mm:ss");
  }
  
  public static Date formatMilliSecondTime(String date)
    throws ParseException
  {
    return formatTime(date, "yyyy-MM-dd HH:mm:ss.SSS");
  }
  
  public static Date formatDateNotChar(String date)
    throws ParseException
  {
    return formatTime(date, "yyyyMMdd");
  }
  
  public static Date formatDate(String date)
    throws ParseException
  {
    return formatTime(date, "yyyy-MM-dd");
  }
  
  private static String timeFormat(Date date, String dateFormat)
  {
    if (date == null) {
      return null;
    }
    SimpleDateFormat format = new SimpleDateFormat(dateFormat);
    return format.format(date);
  }
  
  public static String formatDateToStringNotChar(Date date)
  {
    return timeFormat(date, "yyyyMMdd");
  }
  
  public static String formatTimeNotCharToString(Date date)
  {
    return timeFormat(date, "yyyyMMddHHmmss");
  }
  
  public static String formatDateToString(Date date)
  {
    return timeFormat(date, "yyyy-MM-dd");
  }
  
  public static String formatTimeToString(Date date)
  {
    return timeFormat(date, "yyyy-MM-dd HH:mm:ss");
  }
  
  public static String formatMilliSecondTimeToString(Date date)
  {
    return timeFormat(date, "yyyy-MM-dd HH:mm:ss.SSS");
  }
  
  public static String getCurrDate()
  {
    return timeFormat(Calendar.getInstance().getTime(), "yyyy-MM-dd");
  }
  
  public static String getCurrDateToString()
  {
    return timeFormat(Calendar.getInstance().getTime(), "yyyy-MM-dd HH:mm:ss");
  }
  
  public static String getCurrMilliSecondToString()
  {
    return timeFormat(Calendar.getInstance().getTime(), "yyyy-MM-dd HH:mm:ss.SSS");
  }
  
  public static String getCurrDateToStringNotChar()
  {
    return timeFormat(Calendar.getInstance().getTime(), "yyyyMMdd");
  }
  
  public static String getCurrTimeToStringNotChar()
  {
    return timeFormat(Calendar.getInstance().getTime(), "yyyyMMddHHmmss");
  }
  
  public static String getCurrMilliSecondToStringNotChar()
  {
    return timeFormat(Calendar.getInstance().getTime(), "yyyyMMddHHmmssSSS");
  }
  
  public static boolean isNotNull(String s)
  {
    boolean isNotNull = true;
    if ((null == s) || ("".equals(s.trim()))) {
      isNotNull = false;
    }
    return isNotNull;
  }
  
  public static boolean isNull(String s)
  {
    return !isNotNull(s);
  }
  
  public static boolean isEmpty(Object o)
  {
    if (o == null) {
      return true;
    }
    if (o.toString().trim().length() == 0) {
      return true;
    }
    return false;
  }
  
  public static boolean notEmpty(Object o)
  {
    return !isEmpty(o);
  }
  
  public static String preAddZero(String value, int total)
  {
    String returnValue = "";
    if (isEmpty(value))
    {
      for (int i = 0; i < total; i++) {
        returnValue = returnValue + "0";
      }
      return returnValue;
    }
    byte[] chars = value.getBytes();
    int valueLength = chars.length;
    if (valueLength > total) {
      return value;
    }
    for (int i = 0; i < total - valueLength; i++) {
      returnValue = returnValue + "0";
    }
    returnValue = returnValue + value;
    return returnValue;
  }
  
  public static boolean isNotEmpty(List list)
  {
    if ((null != list) && (!list.isEmpty())) {
      return true;
    }
    return false;
  }
  
  public static boolean isEmpty(List list)
  {
    return !isNotEmpty(list);
  }
  
  public static String toGb2312(String strConvert)
  {
    if ((strConvert != null) && (strConvert.length() > 0)) {
      try
      {
        return new String(strConvert.getBytes("iso8859-1"), "gb2312");
      }
      catch (Exception ex)
      {
        System.err.println("iso2Gb错误");
        return strConvert;
      }
    }
    return strConvert;
  }
  
  public static String toUtf8(String strConvert)
  {
    if ((strConvert != null) && (strConvert.length() > 0)) {
      try
      {
        return new String(strConvert.getBytes("iso8859-1"), "UTF-8");
      }
      catch (Exception ex)
      {
        System.err.println("UTF-8错误");
        return strConvert;
      }
    }
    strConvert = "";
    
    return strConvert;
  }
  
  public static String transPid(String pid)
  {
    String user_pid = pid;
    user_pid = user_pid.toUpperCase();
    if (user_pid.length() == 15)
    {
      String local_input_id_no = "";
      String left_id_no = "";
      String right_id_no = "";
      String temp_id_no = "";
      int sum = 0;
      int ad = 0;
      String ad_string = "";
      local_input_id_no = user_pid;
      left_id_no = local_input_id_no.substring(0, 6);
      right_id_no = local_input_id_no.substring(6, 15);
      temp_id_no = left_id_no + "19" + right_id_no;
      sum += (temp_id_no.charAt(0) - '0') * 7;
      sum += (temp_id_no.charAt(1) - '0') * 9;
      sum += (temp_id_no.charAt(2) - '0') * 10;
      sum += (temp_id_no.charAt(3) - '0') * 5;
      sum += (temp_id_no.charAt(4) - '0') * 8;
      sum += (temp_id_no.charAt(5) - '0') * 4;
      sum += (temp_id_no.charAt(6) - '0') * 2;
      sum += (temp_id_no.charAt(7) - '0') * 1;
      sum += (temp_id_no.charAt(8) - '0') * 6;
      sum += (temp_id_no.charAt(9) - '0') * 3;
      sum += (temp_id_no.charAt(10) - '0') * 7;
      sum += (temp_id_no.charAt(11) - '0') * 9;
      sum += (temp_id_no.charAt(12) - '0') * 10;
      sum += (temp_id_no.charAt(13) - '0') * 5;
      sum += (temp_id_no.charAt(14) - '0') * 8;
      sum += (temp_id_no.charAt(15) - '0') * 4;
      sum += (temp_id_no.charAt(16) - '0') * 2;
      ad = sum % 11;
      switch (ad)
      {
      case 0: 
        ad_string = "1";
        break;
      case 1: 
        ad_string = "0";
        break;
      case 2: 
        ad_string = "X";
        break;
      case 3: 
        ad_string = "9";
        break;
      case 4: 
        ad_string = "8";
        break;
      case 5: 
        ad_string = "7";
        break;
      case 6: 
        ad_string = "6";
        break;
      case 7: 
        ad_string = "5";
        break;
      case 8: 
        ad_string = "4";
        break;
      case 9: 
        ad_string = "3";
        break;
      case 10: 
        ad_string = "2";
      }
      user_pid = temp_id_no + ad_string;
    }
    return user_pid;
  }
  
  public static Date trimTime(Date date)
  {
    Calendar cal = Calendar.getInstance();
    cal.setTime(date);
    cal.set(11, 0);
    cal.set(12, 0);
    cal.set(13, 0);
    cal.set(14, 0);
    return cal.getTime();
  }
  
  public static String generateRuleNo(Long value, int maxDigit)
  {
    NumberFormat nf = NumberFormat.getNumberInstance();
    nf.setMinimumIntegerDigits(maxDigit);
    nf.setMaximumIntegerDigits(maxDigit);
    return nf.format(value).replaceAll(",", "");
  }
  
  public static String generateRadomNum()
  {
    long radomNum = (long) (Math.random() * 10000000000.0D);
    if (radomNum % 2L == 0L) {
      return Long.toHexString(radomNum).toUpperCase();
    }
    return Long.toOctalString(radomNum);
  }
  
  public static boolean valiEmail(String value)
  {
    return value.matches("\\w+@\\w+\\.\\w+[\\.cn]?");
  }
  
  public static boolean valiMobilePhone(String value)
  {
    return value.matches("1[3587]\\d{9}");
  }
  
  public static boolean valiTelephone(String value)
  {
    return value.matches("([\\d]{3}-([\\d]{5}|[\\d]{8}))|([\\d]{4}-([\\d]{5}|[\\d]{7}))");
  }
  
  public static boolean valiPostCode(String value)
  {
    return value.matches("\\d{6}");
  }
  
  public static boolean valiID(String value)
  {
    return value.matches("\\d{15}|\\d{18}");
  }
  
  public static boolean isPureNumber(String value)
  {
    return value.matches("\\d+");
  }
  
  public static boolean exsitIllegalChar(String value)
  {
    return value.matches("[\\w]*[\\'\\\"]+[\\w]*");
  }
  
  public static boolean valiLength(String value, int maxLength)
  {
    return getLength(value) <= maxLength;
  }
  
  public static int getLength(String value)
  {
    return value.replaceAll("[^\\x00-\\xff]", "**").length();
  }
  
  public static boolean valiEnAndNumUline(String value)
  {
    return value.matches("\\w+");
  }
  
  public static String changeInitialUpperCase(String name)
  {
    char[] cs = name.toCharArray(); int 
      tmp7_6 = 0; char[] tmp7_5 = cs;tmp7_5[tmp7_6] = ((char)(tmp7_5[tmp7_6] - ' '));
    return String.valueOf(cs);
  }
  
  public static boolean isChinese(String str)
  {
    return isEmpty(str) ? false : str.matches("[\\u4e00-\\u9fa5]+");
  }
  
  public static boolean isContainsChinese(String str)
  {
    return Pattern.compile("[\\u4e00-\\u9fa5]").matcher(str).find();
  }
  
  public static String formatString(String str)
  {
    if (isNotNull(str))
    {
      str = str.replaceAll("<", "&lt;");
      
      str = str.replaceAll(">", "&gt;");
      
      str = str.replaceAll("\"", "&quot;");
      
      str = str.replaceAll("©", "&copy;");
      
      str = str.replaceAll("®", "&reg;");
      
      str = str.replaceAll("™", "&#8482;");
      
      str = str.replaceAll("×", "&times;");
      
      str = str.replaceAll("÷", "&divide;");
    }
    return str;
  }
  
  public static boolean isNumeric(String str)
  {
    Pattern pattern = Pattern.compile("[1-5]$");
    return pattern.matcher(str).matches();
  }
}
