package com.jt.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.Array;
import java.net.URL;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
import java.util.ResourceBundle;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.support.RequestContextUtils;


public class ComUtils
{
  public static int floor(double a)
  {
    return Math.round((float)Math.round(Math.floor(a)));
  }
  
  public static int GetPageCount(long pTotalRow, int G_PAGE_SIZE)
  {
    if (G_PAGE_SIZE <= 0) {
      G_PAGE_SIZE = 1;
    }
    int rsVal = floor(pTotalRow / G_PAGE_SIZE);
    if (pTotalRow % G_PAGE_SIZE > 0L) {
      rsVal++;
    }
    return rsVal;
  }
  
  public static String getArrayValue(String key, String[][] arrayData)
  {
    String str = "";
    for (int i = 0; i < arrayData.length; i++) {
      if (arrayData[i][0].equals(key))
      {
        str = arrayData[i][1];
        break;
      }
    }
    return str;
  }
  
  public static boolean ckContainUrl(String url, String str2, String dv)
  {
    boolean rs = false;
    String[] arrayData1 = url.split("/");
    String[] arrayData2 = str2.split(dv);
    for (int i = 0; i < arrayData1.length; i++) {
      for (int j = 0; j < arrayData2.length; j++) {
        if (arrayData1[i].equals(arrayData2[j]))
        {
          rs = true;
          break;
        }
      }
    }
    return rs;
  }
  
  public static boolean ckInnerString(String str, String find_str)
  {
    return ckInnerString(str, find_str, ",");
  }
  
  public static boolean ckInnerString(String str, String find_str, String dv)
  {
    boolean rs = false;
    String[] arrayData = str.split(dv);
    for (int i = 0; i < arrayData.length; i++) {
      if (arrayData[i].equals(find_str))
      {
        rs = true;
        break;
      }
    }
    return rs;
  }
  
  public static String getInnerStringFromIdx(String str, String dv, int idx)
  {
    String rs = "";
    String[] arrayData = str.split(dv);
    if (arrayData.length > idx) {
      rs = arrayData[idx];
    }
    return rs;
  }
  
  public static String getInnerStringToIdx(String str, String dv, int idx)
  {
    String rs = "";
    String[] arrayData = str.split(dv);
    if (arrayData.length > idx) {
      for (int i = 0; i < arrayData.length; i++)
      {
        if (i > idx) {
          break;
        }
        if (rs.equals("")) {
          rs = arrayData[i];
        } else {
          rs = rs + dv + arrayData[i];
        }
      }
    } else {
      return str;
    }
    return rs;
  }
  
  public static String getCommaText(String[] ar)
  {
    String rsStr = "";
    for (int i = 0; i < ar.length; i++) {
      if (rsStr.equals("")) {
        rsStr = rsStr + "'" + ar[i] + "'";
      } else {
        rsStr = rsStr + ",'" + ar[i] + "'";
      }
    }
    return rsStr;
  }
  
  public static String getArrayCommaData(String[] arrayData)
  {
    String rsStr = "";
    for (int i = 0; i < arrayData.length; i++) {
      if (rsStr.equals("")) {
        rsStr = arrayData[i];
      } else {
        rsStr = rsStr + "," + arrayData[i];
      }
    }
    return rsStr;
  }
  
  public static String getWeekday(int w)
  {
    String rsWeek = "";
    if (w == 1) {
      rsWeek = "일";
    }
    if (w == 2) {
      rsWeek = "월";
    }
    if (w == 3) {
      rsWeek = "화";
    }
    if (w == 4) {
      rsWeek = "수";
    }
    if (w == 5) {
      rsWeek = "목";
    }
    if (w == 6) {
      rsWeek = "금";
    }
    if (w == 7) {
      rsWeek = "토";
    }
    return rsWeek;
  }
  
  public static boolean CheckIDStr(String idStr, int min_len, int max_len)
  {
    boolean rs = true;
    int i = 0;
    String checkStr = "abcdefghijklmnopqrstuvwxyZABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    for (i = 0; i < idStr.length(); i++) {
      if (checkStr.indexOf(idStr.charAt(i)) < 0)
      {
        rs = false;
        break;
      }
    }
    if ((idStr.length() < min_len) || (idStr.length() > max_len)) {
      rs = false;
    }
    return rs;
  }
  
  public static int ckUserId(String user_id)
  {
    String temp1 = "";
    String temp2 = "";
    int tmp_cnt1 = 0;
    int tmp_cnt2 = 0;
    
    int cnt1 = 1;
    int cnt2 = 1;
    
    boolean for_rs = true;
    if ((user_id.length() < 4) || (user_id.length() > 50)) {
      return 1;
    }
    if ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz".indexOf(user_id.charAt(0)) < 0) {
      return 2;
    }
    if ((user_id.indexOf("..") >= 0) || (user_id.indexOf(".") == 0) || (user_id.indexOf(".") == user_id.length() - 1)) {
      return 6;
    }
    for (int i = 0; i < user_id.length(); i++) {
      if ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz._0123456789".indexOf(user_id.substring(i, i + 1)) < 0)
      {
        for_rs = false;
        break;
      }
    }
    if (!for_rs) {
      return 3;
    }
    for (int i = 0; i < user_id.length(); i++)
    {
      temp1 = user_id.substring(i, i + 1);
      tmp_cnt1 = StrToInt(temp1) + 1;
      if (user_id.length() >= i + 2) {
        temp2 = user_id.substring(i + 1, i + 2);
      }
      tmp_cnt2 = StrToInt(temp2);
      if (tmp_cnt2 == tmp_cnt1) {
        cnt1++;
      } else {
        cnt1 = 1;
      }
      if (temp1.equals(temp2)) {
        cnt2++;
      } else {
        cnt2 = 1;
      }
      if ((cnt1 > 3) || 
        (cnt2 > 3)) {
        break;
      }
    }
    if (cnt1 > 3) {
      return 4;
    }
    if (cnt2 > 3) {
      return 5;
    }
    return 0;
  }
  
  public static int ckUserPw(String user_pw, String user_id)
  {
    String temp1 = "";
    String temp2 = "";
    int tmp_cnt1 = 0;
    int tmp_cnt2 = 0;
    
    int cnt1 = 1;
    int cnt2 = 1;
    
    boolean for_rs = true;
    if ((user_pw.length() < 6) || (user_pw.length() > 16)) {
      return 1;
    }
    if ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz".indexOf(user_pw.charAt(0)) < 0) {
      return 2;
    }
    for (int i = 0; i < user_pw.length(); i++) {
      if ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~!@#$^*()_+|0123456789".indexOf(user_pw.substring(i, i + 1)) < 0)
      {
        for_rs = false;
        break;
      }
    }
    if (!for_rs) {
      return 3;
    }
    for (int i = 0; i < user_pw.length(); i++)
    {
      temp1 = user_pw.substring(i, i + 1);
      tmp_cnt1 = StrToInt(temp1) + 1;
      if (user_pw.length() >= i + 2) {
        temp2 = user_pw.substring(i + 1, i + 2);
      }
      tmp_cnt2 = StrToInt(temp2);
      if (tmp_cnt2 == tmp_cnt1) {
        cnt1++;
      } else {
        cnt1 = 1;
      }
      if (temp1.equals(temp2)) {
        cnt2++;
      } else {
        cnt2 = 1;
      }
      if ((cnt1 > 3) || 
        (cnt2 > 3)) {
        break;
      }
    }
    if (cnt1 > 3) {
      return 4;
    }
    if (cnt2 > 3) {
      return 5;
    }
    for (int i = 0; i < user_pw.length() - 4; i++)
    {
      temp1 = user_pw.substring(i, i + 4);
      if (user_id.indexOf(temp1) >= 0)
      {
        for_rs = false;
        break;
      }
    }
    if (!for_rs) {
      return 6;
    }
    return 0;
  }
  
  public static String getNumFromStr(String str)
  {
    StringBuffer buffer = new StringBuffer();
    int len = str.length();
    int c = -1;
    for (int i = 0; i < len; i++)
    {
      c = StrToIntDef(str.substring(i, i + 1), -1);
      if (c >= 0) {
        buffer.append(str.substring(i, i + 1));
      }
    }
    return buffer.toString();
  }
  
  public static String getNumFromStr(String str, String x)
  {
    StringBuffer buffer = new StringBuffer();
    int len = str.length();
    int c = -1;
    for (int i = 0; i < len; i++) {
      if (str.substring(i, i + 1).equals(x))
      {
        buffer.append(x);
      }
      else
      {
        c = StrToIntDef(str.substring(i, i + 1), -1);
        if (c >= 0) {
          buffer.append(str.substring(i, i + 1));
        }
      }
    }
    return buffer.toString();
  }
  
  public static String getRandomString(int len)
  {
    StringBuffer buffer = new StringBuffer();
    Random rnd = new Random();
    int idx = 0;
    idx = rnd.nextInt("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz".length());
    buffer.append("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz".substring(idx, idx + 1));
    for (int i = 1; i < len; i++)
    {
      idx = rnd.nextInt("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789".length());
      buffer.append("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789".substring(idx, idx + 1));
    }
    return buffer.toString();
  }
  
  public static boolean ckJumin(String jumin)
  {
    boolean isKorean = true;
    int check = 0;
    if ((jumin == null) || (jumin.length() != 13)) {
      return false;
    }
    if ((Character.getNumericValue(jumin.charAt(6)) > 4) && (Character.getNumericValue(jumin.charAt(6)) < 9)) {
      isKorean = false;
    }
    for (int i = 0; i < 12; i++) {
      if (isKorean) {
        check += (i % 8 + 2) * Character.getNumericValue(jumin.charAt(i));
      } else {
        check += (9 - i % 8) * Character.getNumericValue(jumin.charAt(i));
      }
    }
    if (isKorean)
    {
      check = 11 - check % 11;
      check %= 10;
    }
    else
    {
      int remainder = check % 11;
      if (remainder == 0) {
        check = 1;
      } else if (remainder == 10) {
        check = 0;
      } else {
        check = remainder;
      }
      int check2 = check + 2;
      if (check2 > 9) {
        check = check2 - 10;
      } else {
        check = check2;
      }
    }
    if (check == Character.getNumericValue(jumin.charAt(12))) {
      return true;
    }
    return false;
  }
  
  public static String getCookieValue(HttpServletRequest req, String pKey)
  {
    String rsStr = "";
    Cookie[] _tmp_cookies = req.getCookies();
    if (_tmp_cookies != null) {
      for (int i = 0; i < _tmp_cookies.length; i++) {
        if (_tmp_cookies[i].getName().equals(pKey))
        {
          rsStr = _tmp_cookies[i].getValue();
          break;
        }
      }
    }
    return rsStr;
  }
  
  public static void delCookieValue(HttpServletRequest req, HttpServletResponse res, String pKey)
  {
    Cookie[] _tmp_cookies = req.getCookies();
    if (_tmp_cookies != null) {
      for (int i = 0; i < _tmp_cookies.length; i++) {
        if (_tmp_cookies[i].getName().equals(pKey))
        {
          _tmp_cookies[i].setValue("");
          _tmp_cookies[i].setMaxAge(0);
          Cookie coo = new Cookie(pKey, "");
          res.addCookie(coo);
          break;
        }
      }
    }
  }
  
  public static String getMD5(String strVal)
  {
    StringBuffer sb = new StringBuffer();
    try
    {
      byte[] digest = MessageDigest.getInstance("MD5").digest(strVal.getBytes());
      sb.setLength(0);
      for (int i = 0; i < digest.length; i++)
      {
        sb.append(Integer.toString((digest[i] & 0xF0) >> 4, 16));
        sb.append(Integer.toString(digest[i] & 0xF, 16));
      }
      return sb.toString();
    }
    catch (Exception ex) {}
    return "";
  }
  
  public static String chSecondToHour(int ss)
  {
    String rs = "";
    int s = ss;
    int m = 0;
    int h = 0;
    if (ss > 60)
    {
      m = ss / 60;
      h = ss / 60 / 60;
    }
    if (ss < 60) {
      rs = "00:00:" + fixLenNum(s, 2);
    }
    if (m >= 1) {
      rs = "00:" + fixLenNum(m, 2) + ":" + fixLenNum(s, 2);
    }
    if (h >= 1) {
      rs = fixLenNum(h, 2) + ":" + fixLenNum(m, 2) + ":" + fixLenNum(s, 2);
    }
    return rs;
  }
  
  public static String number_format(int a)
  {
    DecimalFormat nFormat = new DecimalFormat("###,###,###,###,###,###,###");
    return nFormat.format(a);
  }
  
  public static String fixLenNum(int a, int len)
  {
    String x = "";
    for (int i = 1; i <= len; i++) {
      x = x + "0";
    }
    DecimalFormat nFormat = new DecimalFormat(x);
    return nFormat.format(a);
  }
  
  public static String getFileExt(String filename)
  {
    if (filename == null) {
      return "";
    }
    int pos = filename.lastIndexOf(".");
    if (pos > 0) {
      return filename.substring(pos + 1);
    }
    return "";
  }
  
	public static String rmTag(String tags) throws Exception {

		String buf = tags;
		int begin = 0;
		int end = 0;
		int old_begin = 0;
		buf = buf.toLowerCase();
		String result = "";
		if ((tags != null) && !tags.equals("")){
			while(true){
				if( (begin = buf.indexOf("<script", begin)) == -1) break;
				if( (end = buf.indexOf("</script>", end)) == -1) break;
				if( end > begin ){
					result += buf.substring(old_begin, begin);
					old_begin = end + 9;
				}
				++end;
				++begin;
			}
			if( end > begin ){
				//result += buf.substring(end + 9);
				result += buf.substring(end);
			}
			buf = result.replaceAll("&[a-z]+;", " ");
			result = buf.replaceAll("(<([a-z!/]+)[^>]*>)|([\\t\\x0B\\f]+)|(([\\r\\n][\\r\\n])+)|(-->)", "");

			buf = "";
			int len = result.length();
			int i = 0;
			while(len > i){
				while((len > i) && (result.charAt(i) == ' ')) ++i;
				while((len > i) && (result.charAt(i) != ' ')) buf += result.charAt(i++);
				if( len > i ) buf += " ";
			}
		}

		return buf;
	}
  
  public static String strCut(String reqStr, int len, String tail)
  {
    String rs = reqStr;
    if ((reqStr != null) && (!reqStr.equals("")))
    {
      reqStr = Replace_Html_Repair(reqStr);
      if (reqStr.length() > len)
      {
        rs = reqStr.substring(0, len - tail.length() + 2);
        rs = Replace_Html_Char(rs + tail);
      }
    }
    return rs;
  }
  
  public static String strRequestText(String reqStr)
  {
    return strRequestText(reqStr, "");
  }
  
  public static String strRequestText(String reqStr, String def)
  {
    String rsStr = def;
    if ((reqStr != null) && (!reqStr.equals(""))) {
      rsStr = Replace_Html_Char(reqStr);
    }
    return rsStr;
  }
  
  public static int intRequest(String reqStr)
  {
    return StrToIntDef(reqStr, 0);
  }
  
  public static int intRequest(String reqStr, int def)
  {
    return StrToIntDef(reqStr, def);
  }
  
  public static float floatRequest(String reqStr)
  {
    return StrToFloatDef(reqStr, 0.0F);
  }
  
  public static float floatRequest(String reqStr, float def)
  {
    return StrToFloatDef(reqStr, def);
  }
  
  public static long longRequest(String reqStr)
  {
    return StrToLongDef(reqStr, 0L);
  }
  
  public static long longRequest(String reqStr, long def)
  {
    return StrToLongDef(reqStr, def);
  }
  
  public static String strRequest(String reqStr)
  {
    return strRequest(reqStr, "");
  }
  
  public static String strRequest(String reqStr, String def)
  {
    String rsStr = def;
    if ((reqStr != null) && (!reqStr.equals(""))) {
      rsStr = Replace_Html_Char(reqStr);
    }
    return rsStr;
  }
  
  public static String nl2br(String str)
  {
    String nl2br_str = nullToStr(str);
    nl2br_str = nl2br_str.replaceAll("\r\n", "<br>");
    nl2br_str = nl2br_str.replaceAll("\r", "<br>");
    nl2br_str = nl2br_str.replaceAll("\n", "<br>");
    return nl2br_str;
  }
  
  //DB->html
  public static String Replace_Html_Repair(String html_str)
  {
    String repair_str = html_str;
    if (repair_str == null) {
      repair_str = "";
    }
    repair_str = repair_str.replaceAll("&#47;", "/");
    repair_str = repair_str.replaceAll("&lt;", "<");
    repair_str = repair_str.replaceAll("&gt;", ">");
    repair_str = repair_str.replaceAll("&quot;", "\"");
    repair_str = repair_str.replaceAll("&apos;", "'");
    
    repair_str = repair_str.replaceAll("&amp;", "&");
    repair_str = repair_str.replaceAll("<script", "&lt;script");
    repair_str = repair_str.replaceAll("</script>", "&lt;/script&gt;");
    return repair_str;
  }
  
  public static String Replace_Html_Char(String shtml_char)
  {
    StringBuffer sb = new StringBuffer();
    for (int i = 0; i < shtml_char.length(); i++)
    {
      char c = shtml_char.charAt(i);
      switch (c)
      {
      case '/': 
        sb.append("&#47;");
        break;
      case '<': 
        sb.append("&lt;");
        break;
      case '>': 
        sb.append("&gt;");
        break;
      case '"': 
        sb.append("&quot;");
        break;
      case '\'': 
        sb.append("&apos;");
        break;
      case '\\': 
        sb.append("&#92;");
        break;
      case '\t': 
        sb.append("");
        break;
      case '&': 
        sb.append("&amp;");
        break;
      default: 
        sb.append(c);
      }
    }
    String dhtml_char = sb.toString();
    return dhtml_char;
  }
  
  public static String Replace_Html_Char_Naver(String shtml_char)
  {
    StringBuffer sb = new StringBuffer();
    for (int i = 0; i < shtml_char.length(); i++)
    {
      char c = shtml_char.charAt(i);
      switch (c)
      {
      case '"': 
        sb.append("&quot;");
        break;
      case '\'': 
        sb.append("&apos;");
        break;
      case '\r': 
        sb.append("\\r");
        break;
      case '\n': 
        sb.append("\\n");
        break;
      default: 
        sb.append(c);
      }
    }
    String dhtml_char = sb.toString();
    return dhtml_char;
  }
  
  public static String nullToAddStr(String str, String pre_add)
  {
    String rs = "";
    if (str == null) {
      str = "";
    }
    if (!str.equals("")) {
      rs = pre_add + str;
    }
    return rs;
  }
  
  public static int StrToIntDef(String str, int def)
  {
    int rsInt = 0;
    if (str == null) {
      rsInt = def;
    } else {
      try
      {
        rsInt = Integer.parseInt(str);
      }
      catch (NumberFormatException ne)
      {
        rsInt = def;
      }
    }
    return rsInt;
  }
  
  public static int StrToInt(String str)
  {
    int rsInt = 0;
    if (str != null) {
      try
      {
        rsInt = Integer.parseInt(str);
      }
      catch (NumberFormatException localNumberFormatException) {}
    }
    return rsInt;
  }
  
  public static long StrToLongDef(String str, long def)
  {
    long rsInt = 0L;
    if (str == null) {
      rsInt = def;
    } else {
      try
      {
        rsInt = Long.parseLong(str);
      }
      catch (NumberFormatException ne)
      {
        rsInt = def;
      }
    }
    return rsInt;
  }
  
  public static long StrToLong(String str)
  {
    long rsInt = 0L;
    if (str != null) {
      try
      {
        rsInt = Long.parseLong(str);
      }
      catch (NumberFormatException localNumberFormatException) {}
    }
    return rsInt;
  }
  
  public static float StrToFloatDef(String str, float def)
  {
    float rsInt = 0.0F;
    if (str == null) {
      rsInt = def;
    } else {
      try
      {
        rsInt = Float.parseFloat(str);
      }
      catch (NumberFormatException ne)
      {
        rsInt = def;
      }
    }
    return rsInt;
  }
  
  public static float StrToFloat(String str)
  {
    float rsInt = 0.0F;
    if (str != null) {
      try
      {
        rsInt = Float.parseFloat(str);
      }
      catch (NumberFormatException localNumberFormatException) {}
    }
    return rsInt;
  }
  
  public static String nullToStr(String str)
  {
    String rsStr = "";
    if (str != null) {
      rsStr = str;
    }
    return rsStr;
  }
  
  public static String objToStr(Object obj)
  {
    String rsStr = "";
    if (obj != null) {
      rsStr = obj.toString();
    }
    return rsStr;
  }
  
  public static int objToIntDef(Object obj, int c)
  {
    int rs = c;
    if (obj != null) {
      rs = StrToInt(obj.toString());
    }
    return rs;
  }
  
  public static int objToInt(Object obj)
  {
    return objToIntDef(obj, 0);
  }
  
  public static String[] nullToStr(String[] str)
  {
    String[] rsStr = { "" };
    if (str != null) {
      rsStr = str;
    }
    return rsStr;
  }
  
  public static String nullToStrDef(String str, String def)
  {
    String rsStr = def;
    if ((str != null) && (!str.equals(""))) {
      rsStr = str;
    }
    return rsStr;
  }
  
  public static Date StrToDate(String g)
  {
    DateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    try
    {
      return f.parse(g);
    }
    catch (Exception e)
    {
      try
      {
        return f.parse(g + " 00:00:00");
      }
      catch (Exception e2) {}
    }
    return null;
  }
  
  public static String DateToStr(Date d)
  {
    DateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    try
    {
      return f.format(d);
    }
    catch (Exception e) {}
    return null;
  }
  
  public static String getTodayDay24H(Date d)
  {
    DateFormat f = new SimpleDateFormat("yyyy-MM-dd 23:59:59");
    try
    {
      return f.format(d);
    }
    catch (Exception e) {}
    return "";
  }
  
  public static String AddDay(String d, int v)
  {
    Calendar cal = Calendar.getInstance();
    try
    {
      cal.setTime(StrToDate(d));
      cal.add(5, v);
      return DateToStr(cal.getTime());
    }
    catch (Exception e) {}
    return "";
  }
  
  public static Date AddDay(Date d, int v)
  {
    Calendar cal = Calendar.getInstance();
    try
    {
      cal.setTime(d);
      cal.add(5, v);
      return cal.getTime();
    }
    catch (Exception e) {}
    return null;
  }
  
  public static Date AddMonth(Date d, int v)
  {
    Calendar cal = Calendar.getInstance();
    try
    {
      cal.setTime(d);
      cal.add(2, v);
      return cal.getTime();
    }
    catch (Exception e) {}
    return null;
  }
  
  public static Date AddYear(Date d, int v)
  {
    Calendar cal = Calendar.getInstance();
    try
    {
      cal.setTime(d);
      cal.add(1, v);
      return cal.getTime();
    }
    catch (Exception e) {}
    return null;
  }
  
  public static String getCurDate(String g)
  {
    String rsDate = null;
    DecimalFormat df = new DecimalFormat("00");
    Calendar cal = Calendar.getInstance();
    
    int _cur_y = cal.get(1);
    
    String defYear = Integer.toString(_cur_y);
    String defMonth = df.format(cal.get(2) + 1);
    String defDay = df.format(cal.get(5));
    String curYmd = defYear + "-" + defMonth + "-" + defDay;
    String curYm = defYear + "-" + defMonth;
    String curYmdhis = defYear + "-" + defMonth + "-" + defDay + " " + df.format(cal.get(11)) + ":" + df.format(cal.get(12)) + ":" + df.format(cal.get(13));
    String curTimestamp = defYear + defMonth + defDay + df.format(cal.get(11)) + df.format(cal.get(12)) + df.format(cal.get(13));
    String curMillisecond = defYear + defMonth + defDay + df.format(cal.get(11)) + df.format(cal.get(12)) + df.format(cal.get(13)) + df.format(cal.get(14));
    if (g.equals("ymdhis")) {
      rsDate = curYmdhis;
    }
    if (g.equals("timestamp")) {
      rsDate = curTimestamp;
    }
    if (g.equals("millisecond")) {
      rsDate = curMillisecond;
    }
    if (g.equals("ymd")) {
      rsDate = curYmd;
    }
    if (g.equals("ym")) {
      rsDate = curYm;
    }
    if (g.equals("y")) {
      rsDate = defYear;
    }
    if (g.equals("m")) {
      rsDate = defMonth;
    }
    if (g.equals("d")) {
      rsDate = defDay;
    }
    return rsDate;
  }
  
  public static String getPreMonth(String g)
  {
    String rsDate = null;
    DecimalFormat df = new DecimalFormat("00");
    Calendar cal = Calendar.getInstance();
    int _cur_y = cal.get(1);
    int _cur_m = cal.get(2);
    if (_cur_m == 0) {
      _cur_y = _cur_m - 1;
    }
    cal.set(_cur_y, _cur_m - 1, 1);
    String defYear = Integer.toString(_cur_y);
    String defMonth = df.format(cal.get(2) + 1);
    String curYm = defYear + "-" + defMonth;
    if (g.equals("ym")) {
      rsDate = curYm;
    }
    if (g.equals("y")) {
      rsDate = defYear;
    }
    if (g.equals("m")) {
      rsDate = defMonth;
    }
    return rsDate;
  }
  
	public static String readFromUrl(String url) throws IOException {
		String str = "";
		try{
			InputStream is = new URL(url).openStream();		
			try {
				StringBuilder sb = new StringBuilder();
				int cp;
				BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));			
			    while ((cp = rd.read()) != -1) {
			      sb.append((char) cp);
			    }		
				str = sb.toString();
			} finally {
				is.close();
			}
		}catch(Exception e){
			
		}		
	
		return str;
	}
	
	public static Locale getLocaleForLanguage(String lang){
		Locale loc;
		int semi, dash;

		// Cut off any q-value that might come after a semi-colon
		if ((semi = lang.indexOf(';')) != -1) {
			lang = lang.substring(0, semi);
		}

		// Trim any whitespace
		lang = lang.trim();

		// Create a Locale from the language. A dash may separate the
		// language from the country.
		if ((dash = lang.indexOf('-')) == -1) {
			loc = new Locale(lang, "");  // No dash, no country
		}else {
			loc = new Locale(lang.substring(0, dash), lang.substring(dash+1));
		}

		return loc;
	}
  
  public static ResourceBundle getLocaleResourceBundle(String accept_language)
  {
    ResourceBundle lang = ResourceBundle.getBundle("lang", Locale.US);
    try
    {
      accept_language = accept_language.replaceAll("_", "-");
      String accept_lang = getLocaleForLanguage(accept_language.toLowerCase()).getCountry();
      if (accept_lang.contains("KR")) {
        lang = ResourceBundle.getBundle("lang", Locale.KOREA);
      }
    }
    catch (Exception localException) {}
    return lang;
  }
  
  public static boolean containsHangul(String str)
  {
    for (int i = 0; i < str.length(); i++)
    {
      char ch = str.charAt(i);
      Character.UnicodeBlock unicodeBlock = Character.UnicodeBlock.of(ch);
      if ((Character.UnicodeBlock.HANGUL_SYLLABLES.equals(unicodeBlock)) || 
        (Character.UnicodeBlock.HANGUL_COMPATIBILITY_JAMO.equals(unicodeBlock)) || 
        (Character.UnicodeBlock.HANGUL_JAMO.equals(unicodeBlock))) {
        return true;
      }
    }
    return false;
  }
  
  public static boolean isEmpty(Object o)
    throws IllegalArgumentException
  {
    if (o == null) {
      return true;
    }
    if ((o instanceof String))
    {
      if (((String)o).length() == 0) {
        return true;
      }
    }
    else if ((o instanceof Collection))
    {
      if (((Collection<?>)o).isEmpty()) {
        return true;
      }
    }
    else if (o.getClass().isArray())
    {
      if (Array.getLength(o) == 0) {
        return true;
      }
    }
    else if ((o instanceof Map))
    {
      if (((Map<?, ?>)o).isEmpty()) {
        return true;
      }
    }
    else {
      return false;
    }
    return false;
  }
  
  public static boolean isNotEmpty(Object o)
  {
    return !isEmpty(o);
  }
  
  public static ResourceBundle getMsgBundle(HttpServletRequest request)
  {
    LocaleResolver localeResolver = RequestContextUtils.getLocaleResolver(request);
    ResourceBundle bundle = ResourceBundle.getBundle("message", localeResolver.resolveLocale(request));
    return bundle;
  }
  
  public static boolean mkdir(String path)
  {
    try
    {
      File dir = new File(path);
      if (!dir.exists()) {
        dir.mkdirs();
      }
      return true;
    }
    catch (Exception ex) {}
    return false;
  }
  
  public static String getUploadImagePath(String documentRoot)
  {
    String path = "";
    DecimalFormat df = new DecimalFormat("00");
    Calendar cal = Calendar.getInstance();
    int _cur_y = cal.get(1);
    
    String defYear = String.valueOf(_cur_y);
    String defMonth = df.format(cal.get(2) + 1);
    String defDay = df.format(cal.get(5));
    path = defYear + "/" + defMonth + "/" + defDay;
    if (!mkdir(documentRoot + "/" + path)) {
      path = "";
    }
    return path;
  }
  
  public String unscript(String data)
  {
    if ((data == null) || (data.trim().equals(""))) {
      return "";
    }
    String ret = data;
    ret = ret.replaceAll("<(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;script");
    ret = ret.replaceAll("</(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;/script");
    
    ret = ret.replaceAll("<(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;object");
    ret = ret.replaceAll("</(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;/object");
    
    ret = ret.replaceAll("<(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;applet");
    ret = ret.replaceAll("</(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;/applet");
    
    ret = ret.replaceAll("<(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
    ret = ret.replaceAll("</(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
    
    ret = ret.replaceAll("<(F|f)(O|o)(R|r)(M|m)", "&lt;form");
    ret = ret.replaceAll("</(F|f)(O|o)(R|r)(M|m)", "&lt;form");
    return ret;
  }
  
  public static String filePathBlackList(String value)
  {
    String returnValue = value;
    if ((returnValue == null) || (returnValue.trim().equals(""))) {
      return "";
    }
    returnValue = returnValue.replaceAll("\\.\\./", "");
    returnValue = returnValue.replaceAll("\\.\\.\\\\", "");
    
    return returnValue;
  }
  
  public static String ln2br(String value)
  {
    String nl2br_str = value;
    try
    {
      nl2br_str = nl2br_str.replaceAll("\r\n", "<br>");
      nl2br_str = nl2br_str.replaceAll("\r", "<br>");
      nl2br_str = nl2br_str.replaceAll("\n", "<br>");
    }
    catch (Exception localException) {}
    return nl2br_str;
  }
  
  public static String cleanXSS(String value)
  {
    value = value.replaceAll("<", "&lt;").replaceAll(">", "&gt;");
    value = value.replaceAll("\\(", "&#40;").replaceAll("\\)", "&#41;");
    value = value.replaceAll("'", "&#39;");
    value = value.replaceAll("eval\\((.*)\\)", "");
    value = value.replaceAll("[\\\"\\'][\\s]*javascript:(.*)[\\\"\\']", "\"\"");
    value = value.replaceAll("script", "");
    return value;
  }
  
	public static String sqlInjectionStr(String value) {
		final Pattern SpecialChars = Pattern.compile("['\"\\-#()@;=*/+]");
		final String regex = "(union|select|from|where)";
		final Pattern pattern = Pattern.compile(regex, Pattern.CASE_INSENSITIVE);
	
		String returnValue = value;
		if (returnValue == null || returnValue.trim().equals("")) {
			return "";
		}else{
			returnValue = SpecialChars.matcher(returnValue).replaceAll("");
		}	
		final Matcher matcher = pattern.matcher(returnValue);
		if(matcher.find()){
			returnValue = "";
		}
		return returnValue;
	}
  
  
}
