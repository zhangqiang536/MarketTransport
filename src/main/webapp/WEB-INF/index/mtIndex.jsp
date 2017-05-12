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
<link rel="stylesheet" type="text/css" href="/css/functions/index/style.css" />
<link rel="stylesheet" type="text/css" href="/css/functions/index/index.css" />
<link rel="stylesheet" type="text/css" href="/css/functions/index/daohang.css" />
<link rel="stylesheet" type="text/css" href="/css/commons/pageGroup.css" />
<link rel="stylesheet" type="text/css" href="/css/commons/alert.css" />
</head>
<body>
<%@include file="../common/header.jsp" %>
<div class="down-main">
   <div class="container">
	   <div class="slider ">
	       <ul class="slider-main">
	           <li style="display: none; opacity: 1;"><a href="javascript:"><img src="imgs/index/1.jpg" alt="" width="100%" height="460px"></a></li>
	           <li style="display: none; opacity: 1;"><a href="javascript:"><img src="imgs/index/2.png" alt="" width="100%" height="460px"></a></li>
	           <li style="display: list-item; opacity: 0.972532;"><a href="javascript:"><img src="imgs/index/3.png" alt="" width="100%" height="460px"></a></li>
	           <li style="display: list-item; opacity: 0.00691493;"><a href="javascript:"><img src="imgs/index/4.png" alt="" width="100%" height="460px"></a></li>
	           <li style="display: none; opacity: 1;"><a href="javascript:"><img src="imgs/index/1.png" alt="" width="100%" height="460px"></a></li>
	       </ul>
	       <ul class="index">
	           <li class=""></li>
	           <li class=""></li>
	           <li class=""></li>
	           <li class="active"></li>
	           <li class=""></li>
	       </ul>
	       <a class="btn pre" href="javascript:"></a>
	       <a class="btn next" href="javascript:"></a>
	       <div class="category">
	           <ul id="categoryList" class="category-list clear">
	               <li class="category-item">
	                   <a class="title" href="javascript:">蔬菜</a>
	                   <div class="children clear children-col-2" style="display: none;">
	                       <div class="subitem">
	
						<dl class="fore1">
	
							<dt><a href="#">叶菜类</a></dt>
	
							<dd>
								<em><a href="#">白菜</a></em>
								<em><a href="#">菠菜</a></em>
								<em><a href="#">油菜</a></em>
								<em><a href="#">卷心菜</a></em>
								<em><a href="#">苋菜</a></em>
								<em><a href="#">韭菜</a></em>
								<em><a href="#">蒿菜</a></em>
								<em><a href="#">香菜</a></em>
								<em><a href="#">芥菜</a></em>
								<em><a href="#">芥兰</a></em>
								<em><a href="#">茴香</a></em>
								<em><a href="#">蒜苗</a></em>
								<em><a href="#">莴笋</a></em>
								<em><a href="#">空心菜</a></em>
								<em><a href="#">豌豆尖</a></em>
								<em><a href="#">生菜</a></em>
								<em><a href="#">白花菜</a></em>
								<em><a href="#">青花菜</a></em>
								<em><a href="#">油麦菜</a></em>
								<em><a href="#">甘蓝</a></em>
								<em><a href="#">小葱</a></em>
							</dd>
	
						</dl>
	
						<dl class="fore2">
	
							<dt><a href="#">瓜类和茄果类</a></dt>
	
							<dd>
								<em><a href="#">冬瓜</a></em>
								<em><a href="#">南瓜</a></em>
								<em><a href="#">西葫芦</a></em>
								<em><a href="#">丝瓜</a></em>
								<em><a href="#">黄瓜</a></em>
								<em><a href="#">茄子</a></em>
								<em><a href="#">西红柿</a></em>
								<em><a href="#">香苦瓜</a></em>
								<em><a href="#">辣椒</a></em>
								<em><a href="#">玉米</a></em>
								<em><a href="#">小瓜</a></em>
							</dd>	
	
						</dl>
	
						<dl class="fore3">
	
							<dt><a href="#">根茎类</a></dt>
							<dd>
								<em><a href="#">萝卜</a></em>
								<em><a href="#">马铃薯</a></em>
								<em><a href="#">藕</a></em>
								<em><a href="#">甘薯</a></em>
								<em><a href="#">山药</a></em>
								<em><a href="#">芋头</a></em>
								<em><a href="#">茭白</a></em>
								<em><a href="#">苤蓝</a></em>
								<em><a href="#">慈姑</a></em>
								<em><a href="#">洋葱</a></em>
								<em><a href="#">生姜</a></em>
								<em><a href="#">大蒜</a></em>
								<em><a href="#">蒜苔</a></em>
								<em><a href="#">韭菜花</a></em>
								<em><a href="#">大葱</a></em>
								<em><a href="#">韭黄</a></em>
							</dd>	
						</dl>
						
						<dl class="fore4">
	
							<dt><a href="#">菌菇类</a></dt>
						
							<dd>
								<em><a href="#">香菇</a></em>
								<em><a href="#">平菇</a></em>
								<em><a href="#">金针菇</a></em>
								<em><a href="#">木耳</a></em>
								<em><a href="#">银耳</a></em>
								<em><a href="#">杏鲍菇</a></em>
								<em><a href="#">口蘑</a></em>
							</dd>
						</dl>
						
						<dl class="fore5">
	
							<dt><a href="#">鲜豆类</a></dt>
	
							<dd>
								<em><a href="#">毛豆</a></em>
								<em><a href="#">豌豆</a></em>
								<em><a href="#">蚕豆</a></em>
								<em><a href="#">扁豆</a></em>
								<em><a href="#">豇豆</a></em>
								<em><a href="#">四季豆</a></em>
							</dd>
						</dl>
					</div>
	                   </div>
	               </li>
	               <li class="category-item">
	                   <a class="title" href="javascript:">肉禽蛋</a>
	                   <div class="children clear children-col-2" style="display: none;">
	                       <div class="subitem">
	
						<dl class="fore1">
	
							<dt><a href="#">肉类</a></dt>
	
							<dd>
								<em><a href="#">猪肉</a></em>
								<em><a href="#">牛肉</a></em>
								<em><a href="#">羊肉</a></em>
								<em><a href="#">狗肉</a></em>
								<em><a href="#">其它</a></em>
							</dd>
	
						</dl>
	
						<dl class="fore2">
	
							<dt><a href="#">整禽</a></dt>
	
							<dd>
								<em><a href="#">鸡</a></em>
								<em><a href="#">鸭</a></em>
								<em><a href="#">鹅</a></em>
								<em><a href="#">其它</a></em>
							</dd>	
	
						</dl>
	
						<dl class="fore3">
	
							<dt><a href="#">蛋类</a></dt>
							<dd>
								<em><a href="#">鸡蛋</a></em>
								<em><a href="#">鸭蛋</a></em>
								<em><a href="#">鹅蛋</a></em>
								<em><a href="#">安全蛋</a></em>
								<em><a href="#">其它</a></em>
							</dd>	
						</dl>
					</div>
	                   </div>
	               </li>
	               <li class="category-item">
	                   <a class="title" href="javascript:">水产品</a>
	                   <div class="children clear children-col-2" style="display: none;">
	                       <div class="subitem">
	
						<dl class="fore1">
	
							<dt><a href="#">鱼类</a></dt>
	
							<dd>
								<em><a href="#">鲫鱼</a></em>
								<em><a href="#">鲤鱼</a></em>
								<em><a href="#">草鱼</a></em>
								<em><a href="#">鲢鱼</a></em>
								<em><a href="#">青鱼</a></em>
								<em><a href="#">鲶鱼</a></em>
								<em><a href="#">鳖</a></em>
								<em><a href="#">带鱼</a></em>
								<em><a href="#">金枪鱼</a></em>
								<em><a href="#">其它</a></em>
							</dd>
	
						</dl>
	
						<dl class="fore2">
	
							<dt><a href="#">虾类</a></dt>
	
							<dd>
								<em><a href="#">对虾</a></em>
								<em><a href="#">毛虾</a></em>
								<em><a href="#">基围虾</a></em>
								<em><a href="#">竹节虾</a></em>
								<em><a href="#">草虾</a></em>
								<em><a href="#">河虾</a></em>
								<em><a href="#">龙虾</a></em>
								<em><a href="#">小龙虾</a></em>
								<em><a href="#">其它</a></em>
							</dd>	
	
						</dl>
	
						<dl class="fore3">
	
							<dt><a href="#">蟹贝其它</a></dt>
							<dd>
								<em><a href="#">螃蟹</a></em>
								<em><a href="#">哈利肉</a></em>
								<em><a href="#">花螺</a></em>
								<em><a href="#">鲍鱼</a></em>
								<em><a href="#">鱿鱼</a></em>
								<em><a href="#">墨鱼</a></em>
								<em><a href="#">章鱼</a></em>
								<em><a href="#">生蚝</a></em>
								<em><a href="#">其它</a></em>
							</dd>	
						</dl>
						
					</div>
	                   </div>
	               </li>
	               
	               <li class="category-item">
	                   <a class="title" href="javascript:">豆制品</a>
	                   <div class="children clear children-col-2" style="display: none;">
	                        <div class="subitem">
	
							<dl class="fore1">
	
								<dt><a href="#">豆制品类</a></dt>
	
								<dd>
									<em><a href="#">豆腐</a></em>
									<em><a href="#">干子</a></em>
									<em><a href="#">百叶</a></em>
									<em><a href="#">百叶结</a></em>
									<em><a href="#">豆皮</a></em>
									<em><a href="#">素鸡</a></em>
									<em><a href="#">蛋白肉</a></em>
									<em><a href="#">其它</a></em>
								</dd>
	
							</dl>
						</div>
	                    </div>
	                </li>
	            </ul>
	        </div>
	    </div>
	</div>
	
 
		<!-- <div class="content_body">
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
  		分页
	    <div id="pageGro">
	        <div class="pageUp" style="display: none;">《 上一页</div>
	        <div class="pageList">
	            <ul><li class="on">1</li><li>2</li><li>3</li><li>4</li><li>5</li></ul>
	        </div>
	        <div class="pageDown" style="display: block;">下一页 》</div>
	    </div> -->
	    
	    <%@include file="../common/footer.jsp" %>
  </div>
<!-- </div> -->
<%--购买弹框 --%>
<div class="buyTetailAlert" style="display: none;background: yellow;width: 200px;height: 200px">
	<img alt="" src="imgs/goodsPics/10.jpg">
	重量：<input class="numbers" type="text" value="10kg">10kg</input>
	<div class="totalNumbs">总共：100kg</div>
	<div class="addCart">加入购物车</div>
</div>

<!-- <div class="m-sidebar">
  <div class="cart">
    <i id="end"></i>
    <span>购物车</span>
  </div>
</div> -->
<div id="msg">已成功加入购物车！</div>


<div id="fullbg" style="display: none"></div>
			<div id="dialog">
				<p class="close"><a href="#" onclick="closeBg();">关闭</a></p>
				<div class="dialog_content">
					<img src="imgs/goodsPics/10.jpg" />
					<div class="provider">商户:小张</div>
					<div class="goodsName">商品名:蔬菜</div>
					<div class="weight">购买重量:<input type="text" value="5"/>&nbsp;kg<div class="totalWeight">库存:99kg</div></div>
					<div class="button">采购</div>
				</div>
			</div>
<script src="/js/commons/jquery-mt.js"></script>
<script src="/js/commons/pageGroup.js"></script>
<script src="/js/commons/fly.js"></script>
<script src="/js/commons/fly_need.js"></script>
<script src="/js/functions/index/bootstrap.js"></script>
<script src="/js/functions/index/jquery.cookie.js"></script>
<script src="/js/functions/index/search.js"></script>
<script src="/js/functions/index/daohang.js"></script>
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
})
</script>
</body>
</html>