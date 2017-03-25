package com.market.pc.utils;

public class HttpClientResponse
{
  private int statusCode = 200;
  private String resultCode;
  private String resultMsg;
  private Object resultInfo;
  
  public int getStatusCode()
  {
    return this.statusCode;
  }
  
  public void setStatusCode(int statusCode)
  {
    this.statusCode = statusCode;
  }
  
  public String getResultCode()
  {
    return this.resultCode;
  }
  
  public void setResultCode(String resultCode)
  {
    this.resultCode = resultCode;
  }
  
  public String getResultMsg()
  {
    return this.resultMsg;
  }
  
  public void setResultMsg(String resultMsg)
  {
    this.resultMsg = resultMsg;
  }
  
  public Object getResultInfo()
  {
    return this.resultInfo;
  }
  
  public void setResultInfo(Object resultInfo)
  {
    this.resultInfo = resultInfo;
  }
  
  public String toString()
  {
    return "HttpClientResponse{statusCode=" + this.statusCode + ", resultCode='" + this.resultCode + '\'' + ", resultMsg='" + this.resultMsg + '\'' + ", resultInfo='" + this.resultInfo + '\'' + '}';
  }
}
