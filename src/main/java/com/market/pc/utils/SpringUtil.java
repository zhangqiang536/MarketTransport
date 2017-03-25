package com.market.pc.utils;

import org.springframework.context.ApplicationContext;

public class SpringUtil
{
  private static SpringUtil springUtil = null;
  private ApplicationContext mvcContext = null;
  
  public static SpringUtil getInstance()
  {
    if (springUtil == null) {
      springUtil = new SpringUtil();
    }
    return springUtil;
  }
  
  public void init(ApplicationContext mvcContext)
  {
    this.mvcContext = mvcContext;
  }
  
  public Object getBean(String name)
  {
    return this.mvcContext.getBean(name);
  }
}
