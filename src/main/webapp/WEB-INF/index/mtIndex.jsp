<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" >
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">
<link rel="dns-prefetch"/>
<title>MT首页</title>
<link rel="stylesheet" type="text/css" href="/css/functions/index/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/functions/index/style.css" />
<link rel="stylesheet" type="text/css" href="/css/functions/index/dermadefault.css" />
<link rel="stylesheet" type="text/css" href="/css/functions/index/dermagreen.css"/>
<link rel="stylesheet" type="text/css" href="/css/functions/index/dermaorange.css"/>
<link rel="stylesheet" type="text/css" href="/css/functions/index/templatecss.css" />
<link rel="stylesheet" type="text/css" href="/css/functions/index/index.css" />
<link rel="stylesheet" type="text/css" href="/css/commons/pageGroup.css" />
<script src="/js/commons/jquery-mt.js"></script>
<script src="/js/commons/pageGroup.js"></script>
<script src="/js/functions/index/bootstrap.js"></script>
<script src="/js/functions/index/jquery.cookie.js"></script>
<script src="/js/functions/index/search.js"></script>
</head>
<body>
	<nav class="nav navbar-default navbar-mystyle navbar-fixed-top">
  <div class="navbar-header">
    <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"> 
     <span class="icon-bar"></span> 
     <span class="icon-bar"></span> 
     <span class="icon-bar"></span> 
    </button>
    <a class="navbar-brand mystyle-brand"><span class="glyphicon glyphicon-home"></span></a> </div>
  <div class="collapse navbar-collapse">
    <ul class="nav navbar-nav">
      <li class="li-border"><a class="mystyle-color" href="#">管理控制台</a></li>
      <li class="dropdown li-border"><a href="#" class="dropdown-toggle mystyle-color" data-toggle="dropdown">产品与服务<span class="caret"></span></a>
        <!----下拉框选项---->
         <div class="dropdown-menu topbar-nav-list">
             <div class="topbar-nav-col">
               <div class="topbar-nav-item">
               <p class="topbar-nav-item-title">弹性计算</p>
               <ul>
                 <li><a href="#">
                     <span class="glyphicon glyphicon-road"></span> 
                     <span class="">云服务器 ECS</span> 
                 </a>
                 </li>
                  <li><a href="#">
                     <span class="glyphicon glyphicon-picture"></span> 
                     <span class="">云服务器 ECS</span> 
                 </a>
                 </li>
                  <li><a href="#">
                     <span class="glyphicon glyphicon-gift"></span> 
                     <span class="">云服务器 ECS</span> 
                 </a>
                 </li>
                </ul>
               </div>
               
               <div class="">
               <p class="topbar-nav-item-title">弹性计算</p>
               <ul>
                 <li><a href="#">
                     <span class="glyphicon glyphicon-road"></span> 
                     <span class="">云服务器 ECS</span> 
                 </a>
                 </li>
                  <li><a href="#">
                     <span class="glyphicon glyphicon-picture"></span> 
                     <span class="">云服务器 ECS</span> 
                 </a>
                 </li>
                  <li><a href="#">
                     <span class="glyphicon glyphicon-gift"></span> 
                     <span class="">云服务器 ECS</span> 
                 </a>
                 </li>
               </ul>
               </div> 
             </div>
             
             
             <div class="topbar-nav-col">
               <div class="topbar-nav-item">
               <p class="topbar-nav-item-title">弹性计算</p>
               <ul>
                 <li><a href="#">
                     <span class="glyphicon glyphicon-road"></span> 
                     <span class="">云服务器 ECS</span> 
                 </a>
                 </li>
                  <li><a href="#">
                     <span class="glyphicon glyphicon-picture"></span> 
                     <span class="">云服务器 ECS</span> 
                 </a>
                 </li>
                  <li><a href="#">
                     <span class="glyphicon glyphicon-gift"></span> 
                     <span class="">云服务器 ECS</span> 
                 </a>
                 </li>
                </ul>
               </div>
               
               <div class="">
               <p class="topbar-nav-item-title">弹性计算</p>
               <ul>
                 <li><a href="#">
                     <span class="glyphicon glyphicon-road"></span> 
                     <span class="">云服务器 ECS</span> 
                 </a>
                 </li>
                  <li><a href="#">
                     <span class="glyphicon glyphicon-picture"></span> 
                     <span class="">云服务器 ECS</span> 
                 </a>
                 </li>
                  <li><a href="#">
                     <span class="glyphicon glyphicon-gift"></span> 
                     <span class="">云服务器 ECS</span> 
                 </a>
                 </li>
               </ul>
               </div>
               
             </div>
             
         </div>
      </li>
    </ul>
    
    <ul class="nav navbar-nav pull-right">
       <li class="li-border">
          <a href="#" class="mystyle-color">
            <span class="glyphicon glyphicon-bell"></span>
            <span class="topbar-num">0</span>
          </a>
      </li>
       <li class="li-border dropdown"><a href="#" class="mystyle-color" data-toggle="dropdown">
      <span class="glyphicon glyphicon-search"></span> 搜索</a>
         <div class="dropdown-menu search-dropdown">
            <div class="input-group">
                <input type="text" class="form-control">
                 <span class="input-group-btn">
                   <button type="button" class="btn btn-default">搜索</button>
                </span>
            </div>
         </div>
      </li>
      <li class="dropdown li-border"><a href="#" class="dropdown-toggle mystyle-color" data-toggle="dropdown">帮助与文档<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">帮助与文档</a></li>
          <li class="divider"></li>
          <li><a href="#">论坛</a></li>
          <li class="divider"></li>
          <li><a href="#">博客</a></li>
        </ul>
      </li>
      <li class="dropdown li-border"><a href="#" class="dropdown-toggle mystyle-color" data-toggle="dropdown">605875855@qq.com<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">退出</a></li>
        </ul>
      </li>
      <li class="dropdown"><a href="#" class="dropdown-toggle mystyle-color" data-toggle="dropdown">换肤<span class="caret"></span></a>
        <ul class="dropdown-menu changecolor">
          <li id="blue"><a href="#">蓝色</a></li>
          <li class="divider"></li>
          <li id="green"><a href="#">绿色</a></li>
          <li class="divider"></li>
          <li id="orange"><a href="#">橙色</a></li>
        </ul>
      </li>
    </ul>
  </div>
</nav>
<div class="down-main">
  <div class="left-main left-off">
    <div class="sidebar-fold"><span class="glyphicon glyphicon-menu-hamburger"></span></div>
    <div class="subNavBox">
      <div class="sBox">
        <div class="subNav sublist-down"><span class="title-icon glyphicon glyphicon-chevron-down"></span><span class="sublist-title">买买买</span></div>
        <ul class="navContent" style="display:block">
          <li>
            <div class="showtitle" style="width:100px;"><img src="imgs/index/leftimg.png" />商品搜索</div>
            <a href="#"><span class="sublist-icon glyphicon"><img src="imgs/index/search.png"/></span><span class="sub-title">商品收索</span></a></li>
          <li>
            <div class="showtitle" style="width:100px;"><img src="imgs/index/leftimg.png" />购物车</div>
            <a href="#"><span class="sublist-icon glyphicon"><img src="imgs/index/cart.png" /></span><span class="sub-title">购物车</span></a></li>
          <li>
            <div class="showtitle" style="width:100px;"><img src="imgs/index/leftimg.png" />结算</div>
            <a href="#"><span class="sublist-icon glyphicon"><img src="imgs/index/pay.png" /></span><span class="sub-title">结算</span></a></li>
        </ul>
      </div>
      <div class="sBox">
       <div class="subNav sublist-down"><span class="title-icon glyphicon glyphicon-chevron-up"></span><span class="sublist-title">用户中心</span>
        </div>
        <ul class="navContent" style="display:none">
         <li>
            <div class="showtitle" style="width:100px;"><img src="imgs/index/leftimg.png" />账号管理</div>
            <a href="#"><span class="sublist-icon glyphicon glyphicon-user"></span><span class="sub-title">账号管理</span></a> </li>
          <li>
            <div class="showtitle" style="width:100px;"><img src="imgs/index/leftimg.png" />消息中心</div>
            <a href="#"><span class="sublist-icon glyphicon glyphicon-envelope"></span><span class="sub-title">消息中心</span></a> </li>
          <li>
            <div class="showtitle" style="width:100px;"><img src="imgs/index/leftimg.png" />短信</div>
            <a href="#"><span class="sublist-icon glyphicon glyphicon-bullhorn"></span><span class="sub-title">短信</span></a></li>
          <li class="active">
            <div class="showtitle" style="width:100px;"><img src="imgs/index/leftimg.png" />实名认证</div>
            <a href="#"><span class="sublist-icon glyphicon glyphicon-credit-card"></span><span class="sub-title">实名认证</span></a></li>
        </ul>
      </div>
    </div>
  </div>
  <div class="right-product view-product right-off" style="display:block">
  		<div class="content_header">
	  		<div class="address_select">
			  <select class="provinces">
			  		<option value="">--请选择省份--</option>
			  		<option value="001">安徽省</option>
			  </select>
			  <select class="city">
			  		<option value="">--请选择市--</option>
			  		<option value="00100">芜湖市</option>
			  </select>
			  <select class="district">
			  		<option value="">--请选择区(县)--</option>
			  		<option value="0010000">弋江区</option>
			  		<option value="0010000">芜湖县</option>
			  		<option value="0010000">南陵县</option>
			  		<option value="0010000">繁昌县</option>
			  </select>
			  <select class="pifaMarket">
			  		<option value="">--请选择批发市场--</option>
			  		<option value="0010000000">西河批发1</option>
			  		<option value="0010000001">西河批发2</option>
			  		<option value="0010000002">西河批发3</option>
			  		<option value="0010000003">西河批发4</option>
			  </select>
			  <select class="pifaSaler">
			  		<option value="">--请选择批发商--</option>
			  		<option value="0010000000">张强</option>
			  		<option value="0010000001">张卓</option>
			  		<option value="0010000002">贺盛</option>
			  		<option value="0010000003">蒋云</option>
			  		<option value="0010000004">胡龙龙</option>
			  		<option value="0010000005">王立民</option>
			  </select>
			  <select class="sort">
			  		<option value="">--请选择种类--</option>
			  		<option value="">蔬菜</option>
			  		<option value="">肉类</option>
			  		<option value="">鱼类</option>
			  		<option value="">家禽</option>
			  		<option value="">野味</option>
			  		<option value="">其它</option>
			  </select>
			</div>
			<div class="sort_box">
			
			<%--数量大于6才展示 --%>
			<div class="fr-button" onclick="close_open();">
	    		<div class="fr-button-a">展开 +</div>
	        </div>
	        <div class="sx-show"  style="display: block;" id="sx-show-close">
				<div class="sort_detail">
					<ul class="list-class">
		        		<li class="on" title="蔬菜">
		                    <span><img src="/imgs/goodsPics/12.jpg" height="48"></span>
		              				<i data-code="184215">蔬菜</i>
		              				</li>
		          		<li class="" title="南瓜">
		                    <span><img src="/imgs/goodsPics/2.jpg" height="48"></span>
		              				<i data-code="186028">南瓜</i>
		              				</li>
		          		<li class="" title="黄瓜">
		                    <span><img src="/imgs/goodsPics/1.jpg" height="48"></span>
		              				<i data-code="187381">黄瓜</i>
		              				</li>
		          		<li class="" title="花菜">
		                    <span><img src="/imgs/goodsPics/6.jpg" height="48"></span>
		              				<i data-code="175269">花菜</i>
		              				</li>
		          		<li class="" title="白菜">
		                    <span><img src="/imgs/goodsPics/11.jpg" height="48"></span>
		              				<i data-code="187862">白菜</i>
		              				</li>
		                  		<li class="" title="萝卜">
			                            <span><img src="/imgs/goodsPics/9.jpg" height="48"></span>
		                          				<i data-code="186739">萝卜</i>
		                          				</li>
	                          		<li class="" title="土豆">
			                            <span><img src="/imgs/goodsPics/8.jpg" height="48"></span>
		                          				<i data-code="175093">土豆</i>
		                          				</li>
	                          		<li class="" title="茄子">
			                            <span><img src="/imgs/goodsPics/3.jpg" height="48"></span>
		                          				<i data-code="181993">茄子</i>
		                          				</li>
	                          		<li class="" title="康师傅(Master Kong)">
			                            <span><img src="http://k21.iblimg.com/prd/images/brand/2016/01/0127142338.jpg" height="48"></span>
		                          				<i data-code="183917">康师傅(Master Kong)</i>
		                          				</li>
	                          		<li class="" title="和之礼">
			                            <span><img src="http://k21.iblimg.com/prd/images/brand/2016/06/hezhi.jpg" height="48"></span>
		                          				<i data-code="192977">和之礼</i>
		                          				</li>
	                          		<li class="" title="茱蒂丝(Julie's)">
			                            <span><img src="http://k21.iblimg.com/prd/images/brand/2016/03/zhudisi.jpg" height="48"></span>
		                          				<i data-code="174866">茱蒂丝(Julie's)</i>
		                          				</li>
	                          		<li class="" title="三立">
			                            <span>三立</span>
	                          					<i data-code="187346">三立</i>
	                          				</li>
			        </ul>
				</div>
			</div>
			<div class="sx-show" style="display: none;" id="sx-show-open">
				<div class="sort_detail" >
					<ul class="list-class1">
		        		<li class="on" title="苹果(APPLE)">
		                    <span><img src="http://k21.iblimg.com/prd/images/brand/2016/02/Apple.jpg" height="48"></span>
		              				<i data-code="184215">苹果(APPLE)</i>
		              				</li>
		          		<li class="" title="华为(HUAWEI)">
		                    <span><img src="http://k21.iblimg.com/prd/images/brand/2016/01/HUAWEI.jpg" height="48"></span>
		              				<i data-code="186028">华为(HUAWEI)</i>
		              				</li>
		          		<li class="" title="三星(SAMSUNG)">
		                    <span><img src="http://k21.iblimg.com/prd/images/brand/2016/04/SAMSUNG.jpg" height="48"></span>
		              				<i data-code="187381">三星(SAMSUNG)</i>
		              				</li>
		          		<li class="" title="小米(Mi)">
		                    <span><img src="http://k21.iblimg.com/prd/images/brand/2016/01/MI.jpg" height="48"></span>
		              				<i data-code="175269">小米(Mi)</i>
		              				</li>
		          		<li class="" title="海尔(Haier)">
		                    <span><img src="http://k21.iblimg.com/prd/images/brand/2016/02/haier.jpg" height="48"></span>
		              				<i data-code="187862">海尔(Haier)</i>
		              				</li>
		                <li class="" title="海尔(Haier)">
		                    <span><img src="http://k21.iblimg.com/prd/images/brand/2016/02/haier.jpg" height="48"></span>
		              				<i data-code="187862">海尔(Haier)</i>
		              				</li>
		                  		<li class="" title="格力高(Glico)">
			                            <span><img src="http://k21.iblimg.com/prd/images/brand/2016/01/geligao.jpg" height="48"></span>
		                          				<i data-code="186739">格力高(Glico)</i>
		                          				</li>
	                          		<li class="" title="奥利奥(OREO)">
			                            <span><img src="http://k21.iblimg.com/prd/images/brand/2016/02/oreo.jpg" height="48"></span>
		                          				<i data-code="175093">奥利奥(OREO)</i>
		                          				</li>
	                          		<li class="" title="马奇新新(Munchy's)">
			                            <span><img src="http://k21.iblimg.com/prd/images/brand/2016/07/maqixinxin.jpg" height="48"></span>
		                          				<i data-code="181993">马奇新新(Munchy's)</i>
		                          				</li>
	                          		<li class="" title="康师傅(Master Kong)">
			                            <span><img src="http://k21.iblimg.com/prd/images/brand/2016/01/0127142338.jpg" height="48"></span>
		                          				<i data-code="183917">康师傅(Master Kong)</i>
		                          				</li>
	                          		<li class="" title="和之礼">
			                            <span><img src="http://k21.iblimg.com/prd/images/brand/2016/06/hezhi.jpg" height="48"></span>
		                          				<i data-code="192977">和之礼</i>
		                          				</li>
	                          		<li class="" title="茱蒂丝(Julie's)">
			                            <span><img src="http://k21.iblimg.com/prd/images/brand/2016/03/zhudisi.jpg" height="48"></span>
		                          				<i data-code="174866">茱蒂丝(Julie's)</i>
		                          				</li>
	                          		<li class="" title="三立">
			                            <span>三立</span>
	                          					<i data-code="187346">三立</i>
	                          				</li>
			        </ul>
				</div>
			</div>	
		</div>
		</div>
		<div class="search_right">
			<img alt="" src="/imgs/goodsPics/12.jpg">
		</div>
		<div class="line_middle"></div>
		<div class="content_body">
			<div class="goods">
				<img alt="" src="imgs/goodsPics/1.jpg">
				<div class="content_plain">
					<span>张老板</span>
					<span>1kg</span>
				</div>
				<div class="wantToBuy">我要买</div>
			</div>
			<div class="goods">
				<img alt="" src="imgs/goodsPics/2.jpg">
				<div class="content_plain">
					<span>张老板</span>
					<span>单价：1kg</span>
				</div>
				<div class="wantToBuy">我要买</div>
			</div>
			<div class="goods">
				<img alt="" src="imgs/goodsPics/3.jpg">
				<div class="content_plain">
					<span>张老板</span>
					<span>1kg</span>
				</div>
				<div class="wantToBuy">我要买</div>
			</div>
			<div class="goods">
				<img alt="" src="imgs/goodsPics/4.jpg">
				<div class="content_plain">
					<span>张老板</span>
					<span>1kg</span>
				</div>
				<div class="wantToBuy">我要买</div>
			</div>
			<div class="goods">
				<img alt="" src="imgs/goodsPics/5.jpg">
				<div class="content_plain">
					<span>张老板</span>
					<span>1kg</span>
				</div>
				<div class="wantToBuy">我要买</div>
			</div>
			<div class="goods">
				<img alt="" src="imgs/goodsPics/6.jpg">
				<div class="content_plain">
					<span>张老板</span>
					<span>1kg</span>
				</div>
				<div class="wantToBuy">我要买</div>
			</div>
			<div class="goods">
				<img alt="" src="imgs/goodsPics/7.jpg">
				<div class="content_plain">
					<span>张老板</span>
					<span>1kg</span>
				</div>
				<div class="wantToBuy">我要买</div>
			</div>
			<div class="goods">
				<img alt="" src="imgs/goodsPics/8.jpg">
				<div class="content_plain">
					<span>张老板</span>
					<span>1kg</span>
				</div>
				<div class="wantToBuy">我要买</div>
			</div>
			<div class="goods">
				<img alt="" src="imgs/goodsPics/9.jpg">
				<div class="content_plain">
					<span>张老板</span>
					<span>1kg</span>
				</div>
				<div class="wantToBuy">我要买</div>
			</div>
			<div class="goods">
				<img alt="" src="imgs/goodsPics/10.jpg">
				<div class="content_plain">
					<span>张老板</span>
					<span>1kg</span>
				</div>
				<div class="wantToBuy">我要买</div>
			</div>
  		</div>
  		<!--分页-->
	    <div id="pageGro">
	        <div class="pageUp" style="display: none;">《 上一页</div>
	        <div class="pageList">
	            <ul><li class="on">1</li><li>2</li><li>3</li><li>4</li><li>5</li></ul>
	        </div>
	        <div class="pageDown" style="display: block;">下一页 》</div>
	    </div>
	    
	    <div class="pageEnd">我是尾部</div>
  </div>
</div>
<script type="text/javascript">
$(function(){
/*换肤*/
$(".dropdown .changecolor li").click(function(){
	var style = $(this).attr("id");
    $("link[title!='']").attr("disabled","disabled"); 
	$("link[title='"+style+"']").removeAttr("disabled"); 

	$.cookie('mystyle', style, { expires: 7 }); // 存储一个带7天期限的 cookie 
})
var cookie_style = $.cookie("mystyle"); 
if(cookie_style!=null){ 
    $("link[title!='']").attr("disabled","disabled"); 
	$("link[title='"+cookie_style+"']").removeAttr("disabled"); 
} 
/*左侧导航栏显示隐藏功能*/
$(".subNav").click(function(){				
			/*显示*/
			if($(this).find("span:first-child").attr('class')=="title-icon glyphicon glyphicon-chevron-down")
			{
				$(this).find("span:first-child").removeClass("glyphicon-chevron-down");
			    $(this).find("span:first-child").addClass("glyphicon-chevron-up");
			    $(this).removeClass("sublist-down");
				$(this).addClass("sublist-up");
			}
			/*隐藏*/
			else
			{
				$(this).find("span:first-child").removeClass("glyphicon-chevron-up");
				$(this).find("span:first-child").addClass("glyphicon-chevron-down");
				$(this).removeClass("sublist-up");
				$(this).addClass("sublist-down");
			}	
		// 修改数字控制速度， slideUp(500)控制卷起速度
	    $(this).next(".navContent").slideToggle(300).siblings(".navContent").slideUp(300);
	})
/*左侧导航栏缩进功能*/
$(".left-main .sidebar-fold").click(function(){

	if($(this).parent().attr('class')=="left-main left-full")
	{
		$(this).parent().removeClass("left-full");
		$(this).parent().addClass("left-off");
		
		$(this).parent().parent().find(".right-product").removeClass("right-full");
		$(this).parent().parent().find(".right-product").addClass("right-off");
		
		
		}
	else
	{
		$(this).parent().removeClass("left-off");
		$(this).parent().addClass("left-full");
		
		$(this).parent().parent().find(".right-product").removeClass("right-off");
		$(this).parent().parent().find(".right-product").addClass("right-full");
		
		
		}
	})	
 
  /*左侧鼠标移入提示功能*/
		$(".sBox ul li").mouseenter(function(){
			if($(this).find("span:last-child").css("display")=="none")
			{$(this).find("div").show();}
			}).mouseleave(function(){$(this).find("div").hide();})	
})


//分页
	//页面加载完成是与后台数据交互，后台返回总页数（如果只有总条数的话就自己算。Math.ceil(总条数/每条多少页)=总页数）
			var pageCount = 11;//后台返回的总页数
			icon_load(pageCount);
	    	//点击分页按钮触发
			$(document).on("click","#pageGro li",function(){
				var pageNum = parseInt($(this).html());//获取当前页数
				var selector = $(this);
				
				//这里写ajax数据交互,json.html为后台，返回了总页数。实际开发中请删除json.html文件，
				//$.post('json.html',{},function(rs){
					//判断请求是否成功，后台一般会给一个标识。
					//if(true){
						
						//成功后生成分页按钮
						num_click(pageCount,pageNum,selector);
						
					//}else{
						//alert('这里就表示获取后台的数据失败了');
					//}
				//},'json');
			});
			
			//点击上一页触发
			$(document).on("click","#pageGro .pageUp",function(){
				var pageNum = parseInt($("#pageGro li.on").html());//获取当前页
				var index = $("#pageGro ul li.on").index();//获取index
				
				//这里写ajax数据交互,json.html为后台，返回了总页数。实际开发中请删除json.html文件，
				//$.post('json.html',{},function(rs){
					//判断请求是否成功，后台一般会给一个标识。
					//if(true){
						
						//成功后生成分页按钮
						pageUp_click(pageCount,pageNum,index);
						
					//}else{
						//alert('这里就表示获取后台的数据失败了');
					//}
				//},'json');
			});
			
			//点击下一页触发
			$(document).on("click","#pageGro .pageDown",function(){
				var pageNum = parseInt($("#pageGro li.on").html());//获取当前页
				var index = $("#pageGro ul li.on").index();//获取index
				
				//这里写ajax数据交互,json.html为后台，返回了总页数。实际开发中请删除json.html文件，
				//$.post('json.html',{},function(rs){
					//判断请求是否成功，后台一般会给一个标识。
					//if(true){
						
						//成功后生成分页按钮
						pageDown_click(pageCount,pageNum,index);
						
					//}else{
						//alert('这里就表示获取后台的数据失败了');
					//}
				//},'json');
				
			});
</script>
</body>
</html>