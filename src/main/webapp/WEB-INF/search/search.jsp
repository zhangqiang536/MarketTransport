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
<title>MT搜索</title>
<link href="/css/functions/search/search.css" rel="stylesheet" type="text/css"></link>
<link href="/css/functions/search/pageGroup.css" rel="stylesheet" type="text/css"></link>
<link rel="stylesheet" type="text/css" href="/css/commons/alert.css" />
</head>
<body>
<%@include file="../common/header.jsp" %>
<div class="wrap">
	<div class="seller">
		<div class="text">批发市场</div>
	    <select style="display: none;">
	      <option value="">--请选择--</option>
	      <option value="西河批发1">西河批发1</option>
	      <option value="西河批发1">西河批发1</option>
	      <option value="device">device</option>
	      <option value="with">with</option>
	      <option value="entertainment">entertainment</option>
	      <option value="and">and</option>
	      <option value="social">social</option>
	      <option value="networking">networking</option>
	      <option value="apps">apps</option>
	      <option value="or">or</option>
	    </select>
    </div>
    <div class="consumer">
		<div class="text">批发商</div>
	    <select style="display: none;">
	   	  <option value="">--请选择--</option>
	      <option value="jQuery插件库">jQuery插件库</option>
	      <option value="BlackBerry">BlackBerry</option>
	      <option value="device">device</option>
	      <option value="with">with</option>
	      <option value="entertainment">entertainment</option>
	      <option value="and">and</option>
	      <option value="social">social</option>
	      <option value="networking">networking</option>
	      <option value="apps">apps</option>
	      <option value="or">or</option>
	      <option value="apps">apps</option>
	      <option value="that">that</option>
	      <option value="will">will</option>
	      <option value="boost">boost</option>
	      <option value="your">your</option>
	      <option value="productivity">productivity</option>
	      <option value="Download">Download</option>
	      <option value="or">or</option>
	      <option value="buy">buy</option>
	      <option value="apps">apps</option>
	      <option value="from">from</option>
	      <option value="Afbb">Afbb</option>
	      <option value="Akademie">Akademie</option>
	      <option value="Berlin">Berlin</option>
	      <option value="reviews">reviews</option>
	      <option value="by">by</option>
	      <option value="real">real</option>
	    </select>
    </div>
    
     <div class="sort">
		<div class="text">类目</div>
	    <select style="display: none;">
	      <option value="">--请选择--</option>
	      <option value="jQuery插件库">jQuery插件库</option>
	      <option value="BlackBerry">BlackBerry</option>
	      <option value="device">device</option>
	      <option value="with">with</option>
	      <option value="entertainment">entertainment</option>
	      <option value="and">and</option>
	      <option value="social">social</option>
	      <option value="networking">networking</option>
	      <option value="apps">apps</option>
	      <option value="or">or</option>
	      <option value="apps">apps</option>
	      <option value="that">that</option>
	      <option value="will">will</option>
	      <option value="boost">boost</option>
	      <option value="your">your</option>
	      <option value="productivity">productivity</option>
	      <option value="Download">Download</option>
	      <option value="or">or</option>
	      <option value="buy">buy</option>
	      <option value="apps">apps</option>
	      <option value="from">from</option>
	      <option value="Afbb">Afbb</option>
	      <option value="Akademie">Akademie</option>
	      <option value="Berlin">Berlin</option>
	      <option value="reviews">reviews</option>
	      <option value="by">by</option>
	      <option value="real">real</option>
	    </select>
    </div>
     <script>
		$(function(){
			$('select').searchableSelect();
		});
 	</script>
 <div class="sequence-left">
        	<ul class="listclass">
            	<li data-value="" class="on"><a href="javascript:;" title="点击后恢复默认排序">综合排序</a></li>
                <li data-value="sal" class="upanddown"><a href="javascript:;" title="点击后销量从高到低"><span>销量</span><i></i></a></li>
                <li data-value="pri" class="sort"><a href="javascript:;" title="点击后价格从高到低"><span>价格</span><i></i></a></li>
                <li data-value="eva" class="upanddown"><a href="javascript:;" title="点击后评论从多到少"><span>评论</span><i></i></a></li>
                <li data-value="crd" class="upanddown"><a href="javascript:;" title="点击后销量从老到新"><span>新品</span></a></li>
            </ul>
 </div>
</div>

<div class="goodsList">
	<div class="goods">
		<img src="imgs/goodsPics/1.jpg" />
		<div class="price">￥8.00(/kg)</div>
		<div class="goodsName">菜</div>
		<div class="goodsWhere">
			<div class="pifaMarket">西河批发市场      小张</div>
		</div>
		<div class="buyButton">加入购物车</div>
	</div>
	<div class="goods">
		<img src="imgs/goodsPics/2.jpg" />
		<div class="price">￥8.00(/kg)</div>
		<div class="goodsName">菜</div>
		<div class="goodsWhere">
			<div class="pifaMarket">西河批发市场      小张</div>
		</div>
		<div class="buyButton">加入购物车</div>
	</div>
	<div class="goods">
		<img src="imgs/goodsPics/3.jpg" />
		<div class="price">￥8.00(/kg)</div>
		<div class="goodsName">菜</div>
		<div class="goodsWhere">
			<div class="pifaMarket">西河批发市场      小张</div>
		</div>
		<div class="buyButton">加入购物车</div>
	</div>
	<div class="goods">
		<img src="imgs/goodsPics/4.jpg" />
		<div class="price">￥8.00(/kg)</div>
		<div class="goodsName">菜</div>
		<div class="goodsWhere">
			<div class="pifaMarket">西河批发市场      小张</div>
		</div>
		<div class="buyButton">加入购物车</div>
	</div>
	<div class="goods">
		<img src="imgs/goodsPics/5.jpg" />
		<div class="price">￥8.00(/kg)</div>
		<div class="goodsName">菜</div>
		<div class="goodsWhere">
			<div class="pifaMarket">西河批发市场      小张</div>
		</div>
		<div class="buyButton">加入购物车</div>
	</div>
	<div class="goods">
		<img src="imgs/goodsPics/6.jpg" />
		<div class="price">￥8.00(/kg)</div>
		<div class="goodsName">菜</div>
		<div class="goodsWhere">
			<div class="pifaMarket">西河批发市场      小张</div>
		</div>
		<div class="buyButton">加入购物车</div>
	</div>
	<div id="pageToolbar"></div>
</div>
<%@include file="../common/footer.jsp" %>
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
<script src="/js/commons/jquery-mt.js" type="text/javascript"></script>
<script src="/js/functions/search/query.js" type="text/javascript"></script>
<script src="/js/commons/flyCart.js" type="text/javascript"></script>
<script src="/js/functions/search/search2.js" type="text/javascript"></script>
<script src="/js/functions/search/pageGroup.js" type="text/javascript"></script>
<script src="/js/functions/search/search.js" type="text/javascript"></script>
<script type="text/javascript">
	$('#pageToolbar').Paging({pagesize:10,count:85,toolbar:true});
</script>
</body>
</html>