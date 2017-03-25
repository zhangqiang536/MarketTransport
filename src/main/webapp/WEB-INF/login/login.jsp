<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%
	String timestamp = String.valueOf(new Date().getTime());
%>
<%
    response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma", "no-cache");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" >
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">
<link rel="dns-prefetch"/>
<title>MT登陆</title>
<link rel="stylesheet" type="text/css" href="/css/functions/login/demo.css" />
<link rel="stylesheet" type="text/css" href="/css/functions/login/login.css" />
<script src="/js/commons/jquery-mt.js"></script>
<script src="/js/functions/login/jquery1.js"></script>
<script src="/js/functions/login/jquery.js"></script>
<script src="/js/commons/jquery.json-2.2.js"></script>
<script src="/js/commons/json2.js"></script>
<script src="/js/commons/lib.js"></script>
<script src="/js/functions/login/Validform_v5.js"></script>
<script src="/js/functions/login/login.js"></script>
</head>
<body>
<div class="header">

  <h1 class="headerLogo"><a title="后台管理系统" target="_blank" href="javascript:;"><img alt="logo" src="imgs/login/logo.gif"></a></h1>

	<div class="headerNav">

		<a target="_blank" href="javascript:;">MT官网</a>

		<a target="_blank" href="javascript:;">意见反馈</a>

		<a target="_blank" href="javascript:;">帮助</a>

	</div>

</div>



<div class="banner">
	<div class="login-aside">
  		<div id="o-box-up"></div>
  		<div id="o-box-down" style="table-layout:fixed;">
   			<div class="error-box Validform_checktip Validform_wrong" id="login_errorTips" style="display: none"></div>
			<form class="registerform">
   				<div class="fm-item">
	   				<label for="logonId" class="form-label">MISS系统登陆：</label>
					<input maxlength="100" id="username" class="i-text Validform_error" placeholder="请输入账户名（手机号）" type="text">    
					<div class="ui-form-explain"></div>
				</div>
				<div class="fm-item">
					<label for="logonId" class="form-label">登陆密码：</label>
					<input maxlength="100" id="password" class="i-text" type="password" placeholder="请输入密码" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')">    
					<div class="ui-form-explain"></div>
				</div>
				<div class="fm-item pos-r">
					<label for="logonId" class="form-label">验证码</label>
					<input maxlength="100" id="yzm" class="i-text yzm" placeholder="请输入验证码" type="text" onblur="testYZM()">    
					<div class="ui-form-explain"><img id="imageNumber" src="${domain}/yanZhengMa.html" class="yzm-img" style="cursor:pointer;" title="点击可更换图片" onclick="checkNumberImage()"></div>
				</div>
				<div class="fm-item">
					<label for="logonId" class="form-label"></label>
					<input  id="send-btn" class="btn-login" type="button" onclick="toIndex();"> 
					<div class="ui-form-explain"></div>
				</div>
			</form>
		</div>
	</div>
	<div class="bd">
		<ul style="position: relative; width: 1600px; height: 478px;">
<!-- 			<li style="position: absolute; width: 1600px; left: 0px; top: 0px; display: none; background: url(&quot;imgs/login/3.jpg&quot;) 50% 0px no-repeat scroll rgb(204, 225, 243);"><a target="_blank" href="javascript:;"></a></li> -->
<!-- 			<li style="position: absolute; width: 1600px; left: 0px; top: 0px; display: list-item; background: url(&quot;imgs/login/7.jpg&quot;) 50% 0px no-repeat scroll rgb(188, 224, 255);"><a target="_blank" href="javascript:;"></a></li> -->
				<li style= "position: absolute; width: 1600px; left: 0px; top: 0px; display: none;background: url(&quot;imgs/login/theme-pic1.jpg&quot;) 50% 0px no-repeat scroll rgb(204, 225, 243);"></li>
				<li style= "position: absolute; width: 1600px; left: 0px; top: 0px; display: list-item;background: url(&quot;imgs/login/theme-pic2.jpg&quot;) 50% 0px no-repeat scroll rgb(188, 224, 255);"></li>
<!-- 				<li style="background:url(&quot;imgs/login/7.jpg&quot;)"></li> -->
		</ul>
	</div>
	<div class="hd"><ul><li class="">1</li><li class="on">2</li></ul></div>
</div>

<script type="text/javascript">jQuery(".banner").slide({ titCell:".hd ul", mainCell:".bd ul", effect:"fold",  autoPlay:true, autoPage:true, trigger:"click" });</script>

<div class="banner-shadow"></div>
</body>
</html>