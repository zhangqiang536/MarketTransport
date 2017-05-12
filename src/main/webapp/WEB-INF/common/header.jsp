<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<link rel="stylesheet" type="text/css" href="/css/commons/header.css" />
<script src="/js/commons/jquery-mt.js"></script>
<script src="/js/commons/common_search.js"></script>
<div class="top">
	<h3>欢迎来到MT系统!</h3>
	<div class="userInfo">
		<span>欢迎，${user.name }</span>
	</div>
	<div class="exitSys">
		<span>退出</span>
	</div>
	<div class="aboutMe">
		<span>个人中心</span>
		<div>
			<span class="myOrder">我的订单</span>
			<span class="goodsManage">商品管理</span>
		</div>
	</div>
	<div class="cart_header">
		<span>购物车(0)</span>
	</div>
	
	<div class="search">
    	<form>
        	<input placeholder="查询关键词..."  type="text">
            <a class="search_button" href="javascript:;"></a>
        </form>
    </div>
</div>
