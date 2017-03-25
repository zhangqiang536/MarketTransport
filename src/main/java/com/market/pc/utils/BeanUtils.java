package com.market.pc.utils;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

public class BeanUtils
{
  public static Map convertBean2Map(Object bean)
    throws IntrospectionException, IllegalAccessException, InvocationTargetException
  {
    Class type = bean.getClass();
    Map returnMap = new HashMap();
    BeanInfo beanInfo = Introspector.getBeanInfo(type);
    
    PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();
    for (int i = 0; i < propertyDescriptors.length; i++)
    {
      PropertyDescriptor descriptor = propertyDescriptors[i];
      String propertyName = descriptor.getName();
      if (!propertyName.equals("class"))
      {
        Method readMethod = descriptor.getReadMethod();
        Object result = readMethod.invoke(bean, new Object[0]);
        if (result != null) {
          returnMap.put(propertyName, result);
        }
      }
    }
    return returnMap;
  }
  
  public static Object convertMap2Bean(Class bean, Map map)
    throws IntrospectionException, IllegalAccessException, InstantiationException, InvocationTargetException
  {
    BeanInfo beanInfo = Introspector.getBeanInfo(bean);
    Object obj = bean.newInstance();
    

    PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();
    for (int i = 0; i < propertyDescriptors.length; i++)
    {
      PropertyDescriptor descriptor = propertyDescriptors[i];
      String propertyName = descriptor.getName();
      if (map.containsKey(propertyName))
      {
        Object value = map.get(propertyName);
        
        Object[] args = new Object[1];
        args[0] = value;
        
        descriptor.getWriteMethod().invoke(obj, args);
      }
    }
    return obj;
  }
  


	
	/**
	 * bean转成map (bean需要遵循javabean定义规范)
	 * @Title: bean2TreeMap 
	 * @date 2015年5月5日 下午5:06:50
	 * @author 张家俊
	 * @modifier 
	 * @modifydate 
	 * @param bean
	 * @return
	 * @throws NoSuchMethodException
	 * @throws InvocationTargetException
	 * @throws IllegalAccessException
	 */
  public static TreeMap<String, Object> bean2TreeMap(Object bean) throws NoSuchMethodException, InvocationTargetException, IllegalAccessException {
      TreeMap<String, Object> map = new TreeMap<String, Object>();
      Class clz = bean.getClass();
      Field[] fields = clz.getDeclaredFields();
      String fieldName;
      Field.setAccessible(fields, true);
      for (Field field : fields) {
          if (!Modifier.isStatic(field.getModifiers())) {
              fieldName = field.getName();
              Method getter = clz.getMethod(fieldName.substring(0,1).toUpperCase() + fieldName.replaceFirst("\\w",""));
              Object value = getter.invoke(bean);
              if (value != null) {
                  map.put(fieldName, value);
              }
          }
      }
      return map;
  }

  /**
   * bean转成map，值为string (bean需要遵循javabean定义规范)
   * @Title: bean2TreeMapValue2String 
   * @date 2015年5月5日 下午5:08:13
   * @author 张家俊
   * @modifier 
   * @modifydate 
   * @param bean
   * @return
   * @throws NoSuchMethodException
   * @throws InvocationTargetException
   * @throws IllegalAccessException
   */
  public static TreeMap<String, String> bean2TreeMapValue2String(Object bean) throws NoSuchMethodException, InvocationTargetException, IllegalAccessException {
      TreeMap<String, String> map = new TreeMap<String, String>();
      Class clz = bean.getClass();
      Field[] fields = clz.getDeclaredFields();
      String fieldName;
      Field.setAccessible(fields, true);
      for (Field field : fields) {
          if (!Modifier.isStatic(field.getModifiers())) {
              fieldName = field.getName();
              Method getter = clz.getMethod(fieldName.substring(0,1).toUpperCase() + fieldName.replaceFirst("\\w",""));
              Object value = getter.invoke(bean);
              if (value != null) {
                  map.put(fieldName, value.toString());
              }
          }
      }
      return map;
  }

  /**
   * bean的非空字段添加到map中
   * @Title: beanFieldAddtoMap 
   * @date 2015年5月5日 下午5:08:42
   * @author 张家俊
   * @modifier 
   * @modifydate 
   * @param bean
   * @param map
   * @throws NoSuchMethodException
   * @throws InvocationTargetException
   * @throws IllegalAccessException
   */
	public static void beanFieldAddtoMap(Object bean, Map<String, Object> map) throws NoSuchMethodException, InvocationTargetException, IllegalAccessException {
      if (map == null) {
          map = new TreeMap<String, Object>();
      }
      Class clz = bean.getClass();
      Field[] fields = clz.getDeclaredFields();
      String fieldName;
      Field.setAccessible(fields, true);
      for (Field field : fields) {
          if (!Modifier.isStatic(field.getModifiers())) {
              fieldName = field.getName();
              Method getter = clz.getMethod("get" + fieldName.substring(0,1).toUpperCase() + fieldName.replaceFirst("\\w",""));
              Object value = getter.invoke(bean);
              if (value != null) {
                  map.put(fieldName, value.toString());
              }
          }
      }
  }
 
	/**
	 * 对象深Copy，克隆一个新对象
	 * @Title: deepCopy 
	 * @date 2015年5月5日 下午5:09:03
	 * @author 张家俊
	 * @modifier 
	 * @modifydate 
	 * @param oldObj
	 * @return
	 * @throws Exception
	 */
  public static Object deepCopy(Object oldObj) throws Exception {
      ObjectOutputStream oos = null;
      ObjectInputStream ois = null;
      try {
          ByteArrayOutputStream bos = new ByteArrayOutputStream();
          oos = new ObjectOutputStream(bos);
          oos.writeObject(oldObj);
          oos.flush();
          ByteArrayInputStream bin = new ByteArrayInputStream(bos.toByteArray());
          ois = new ObjectInputStream(bin);
          return ois.readObject();
      } catch (Exception e) {
          throw new Exception("deep copy failed!", e);
      } finally {
          if (oos != null) {
              oos.close();
          }
          if (ois != null) {
              ois.close();
          }
      }
  }

}

