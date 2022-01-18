package com.jt.util;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspWriter;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class ParameterMap extends HashMap<String, Object>{
  private Log logger = LogFactory.getLog(getClass());
  private boolean isRequest = false;
  
  private static final long serialVersionUID = 1L;
  
  public ParameterMap() {}
  
  public ParameterMap(boolean isRequest){
    this.isRequest = isRequest;
  }
  
  public ParameterMap(HttpServletRequest request){
    this.isRequest = true;
    putParameterMap(request);
  }
  
  private void putParameterMap(Object obj){
    Map<String, String[]> m = ((HttpServletRequest)obj).getParameterMap();
    Iterator<String> i = m.keySet().iterator();
    String k = null;
    String[] v = null;
    String v2 = ""; 
    while (i.hasNext()){
      k = (String)i.next();
      v = (String[])m.get(k);
      if (v != null){
        if (v.length == 1){
          if (k.equals("checkItem")) {
            put(k, v);
          } else {
        	  
        	  	v2 = v[0];
        	    if (k.equals("keyword")){
        	    	v2 = ComUtils.sqlInjectionStr(v2);
        		}
        		if (k.equals("seq")){
        			v2 = ComUtils.sqlInjectionStr(String.valueOf(ComUtils.StrToInt(v2)));
        			//return String.valueOf(ComUtils.StrToInt(value.toString()));
        		}	
        		v2 = ComUtils.Replace_Html_Char(v2);
        	  
        		put(k, v2);
          }
        }else {
          put(k, v);
        }
      }else {
        put(k, "");
      }
    }
  }
  
  public String get(String k, Object s){
    Object value = super.get(k);
    if (value == null) {
      return s.toString();
    }
    return value.toString();
  }
  
	public String[] getStringArray(String k) {
		Object value = super.get(k);
		if (value == null) {
			return new String[] {};
		}
		return value instanceof String[] ? (String[]) value
				: new String[] { value.toString() };
	}
  
  public String[] getStringArray(String k, String splitStr){
    Object value = super.get(k);
    if (value == null) {
      return new String[0];
    }
    return value.toString().split(splitStr);
  }
  
  public String getString(String k){
    return get(k, "");
  }
  
  public int getInt(String k){
	  return Integer.parseInt(get(k, Integer.valueOf(0)));
  }
  
  public int getInt(String k, int n){
    try{
      return Integer.parseInt(get(k, Integer.valueOf(n)));
    }catch (Exception e) {}
    return n;
  }
  
  public boolean equals(String k, int min, int max){
    int a = 0;
    try{
      a = Integer.parseInt(get(k, "0"));
      if (min > a) {
        return false;
      }
      if (max < a) {
        return false;
      }
      return true;
    }catch (Exception e) {}
    return false;
  }
  
  public boolean equals(String k, int length){
    String a = null;
    try{
      Integer.parseInt(get(k, "0"));
      a = get(k, "0");
      if (length != a.length()) {
        return false;
      }
      return true;
    }catch (Exception e){
      this.logger.error("equals", e);
    }
    return false;
  }
  
  public long getLong(String k){
    return Long.parseLong(get(k, Integer.valueOf(0)));
  }
  
  public boolean getBoolean(String k){
    try{
      return Boolean.parseBoolean(get(k, Integer.valueOf(0)));
    }catch (Exception e){
      this.logger.error("getBoolean", e);
    }
    return false;
  }
  
  public double getDouble(String k)
  {
    return Double.parseDouble(get(k, Integer.valueOf(0)));
  }
  
  public float getFloat(String k)
  {
    return Float.parseFloat(get(k, Integer.valueOf(0)));
  }
  
  public byte getByte(String k)
  {
    return Byte.parseByte(get(k, Integer.valueOf(0)));
  }
  
  public short getShort(String k)
  {
    return Short.parseShort(get(k, Integer.valueOf(0)));
  }
  
  public Object getObject(String k)
  {
    return super.get(k);
  }
  
  public Object put(String k, Object obj)
  {
    //String[] ks = null;
    //StringBuffer realKey = null;
    //StringBuffer sb = null;
    if (!this.isRequest) {
      return super.put(k, obj);
    }
    return super.put(k, obj);
  }
  
  public String[] getStringArray(String k, int len, String split)
  {
    if (super.get(k) == null)
    {
      String[] t = new String[len];
      for (int i = 0; i < t.length; i++) {
        t[i] = "0";
      }
      return t;
    }
    String[] value = super.get(k).toString().split(split);
    if (value.length < len)
    {
      String[] t = new String[len];
      for (int i = 0; i < t.length; i++) {
        if (i >= value.length) {
          t[i] = "0";
        } else {
          t[i] = value[i];
        }
      }
      return t;
    }
    return value;
  }
  
  public String[][] getMapDataList()
  {
    String[][] mapDataList = null;
    
    Set<String> keyset = keySet();
    Object[] hashkeys = keyset.toArray();
    if (hashkeys != null)
    {
      mapDataList = new String[hashkeys.length][2];
      for (int i = 0; i < hashkeys.length; i++)
      {
        mapDataList[i][0] = ((String)hashkeys[i]);
        mapDataList[i][0] = ((String)get(mapDataList[i][0]));
      }
    }
    return mapDataList;
  }
  
  public void outSystemPrint()
  {
    Iterator<String> itr = keySet().iterator();
    String keyData = null;
    
    int i = 1;
    while (itr.hasNext())
    {
      keyData = (String)itr.next();
      System.out.println(i++ + ". " + keyData + " = " + get(keyData));
    }
  }
  
  public void outWebPrint(JspWriter out)
  {
    Iterator<String> itr = keySet().iterator();
    String keyData = null;
    
    int i = 1;
    try
    {
      while (itr.hasNext())
      {
        keyData = (String)itr.next();
        out.println(i++ + ". " + keyData + " = " + get(keyData) + "</BR>");
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
  }
}
