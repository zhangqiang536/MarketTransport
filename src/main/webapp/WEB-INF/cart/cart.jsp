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
<link href="/css/functions/cart/cart.css" rel="stylesheet" type="text/css"></link>
</head>
<body>
<%@include file="../common/header.jsp" %>
 <div id="app">
    	<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="position: absolute; width: 0px; height: 0px; overflow: hidden;"><defs><symbol id="icon-add" viewBox="0 0 32 32"><title>add2</title> <path d="M15 17h-13.664c-0.554 0-1.002-0.446-1.002-1 0-0.552 0.452-1 1.002-1h13.664v-13.664c0-0.554 0.446-1.002 1-1.002 0.552 0 1 0.452 1 1.002v13.664h13.664c0.554 0 1.002 0.446 1.002 1 0 0.552-0.452 1-1.002 1h-13.664v13.664c0 0.554-0.446 1.002-1 1.002-0.552 0-1-0.452-1-1.002v-13.664z" class="path1"></path></symbol> <symbol id="icon-ok" viewBox="0 0 39 32"><title>ok</title> <path d="M14.084 20.656l-7.845-9.282c-1.288-1.482-3.534-1.639-5.016-0.351s-1.639 3.534-0.351 5.016l10.697 12.306c1.451 1.669 4.057 1.623 5.448-0.096l18.168-22.456c1.235-1.527 0.999-3.765-0.528-5.001s-3.765-0.999-5.001 0.528l-15.573 19.337z" class="path1"></path></symbol> <symbol id="icon-edit" viewBox="0 0 32 32"><title>edit</title> <path d="M25.599 11.292l-4.892-4.892 3.825-3.825 4.892 4.892-3.825 3.825zM4.732 23.308l3.959 3.959-5.939 1.98 1.98-5.939zM10.666 26.225l-4.892-4.892 13.425-13.425 4.892 4.892-13.425 13.425zM31.687 6.713l-6.4-6.4c-0.417-0.417-1.091-0.417-1.508 0l-20.267 20.267c-0.114 0.115-0.191 0.25-0.242 0.393-0.003 0.009-0.012 0.015-0.015 0.025l-3.2 9.6c-0.128 0.383-0.029 0.806 0.257 1.091 0.203 0.204 0.476 0.313 0.754 0.313 0.112 0 0.227-0.017 0.337-0.054l9.6-3.2c0.011-0.003 0.017-0.013 0.027-0.016 0.142-0.052 0.276-0.128 0.39-0.242l20.267-20.267c0.417-0.416 0.417-1.091 0-1.508v0z" class="path1"></path></symbol> <symbol id="icon-del" viewBox="0 0 26 32"><title>delete</title> <path d="M17.723 28c0.543 0 0.984-0.448 0.984-1v-12c0-0.552-0.441-1-0.984-1s-0.985 0.448-0.985 1v12c0 0.552 0.441 1 0.985 1v0zM7.877 28c0.543 0 0.984-0.448 0.984-1v-12c0-0.552-0.441-1-0.984-1s-0.985 0.448-0.985 1v12c0 0.552 0.441 1 0.985 1v0zM12.8 28c0.543 0 0.985-0.448 0.985-1v-12c0-0.552-0.441-1-0.985-1s-0.984 0.448-0.984 1v12c0 0.552 0.441 1 0.984 1v0zM23.631 4h-5.908v-2c0-1.104-0.882-2-1.969-2h-5.908c-1.087 0-1.969 0.896-1.969 2v2h-5.908c-1.087 0-1.969 0.896-1.969 2v2c0 1.104 0.882 2 1.969 2v18c0 2.208 1.765 4 3.939 4h13.784c2.174 0 3.938-1.792 3.938-4v-18c1.087 0 1.969-0.896 1.969-2v-2c0-1.104-0.882-2-1.969-2v0zM9.846 3c0-0.552 0.441-1 0.984-1h3.938c0.544 0 0.985 0.448 0.985 1v1h-5.908v-1zM21.662 28c0 1.104-0.882 2-1.969 2h-13.784c-1.087 0-1.97-0.896-1.97-2v-18h17.723v18zM22.646 8h-19.692c-0.543 0-0.985-0.448-0.985-1s0.441-1 0.985-1h19.692c0.543 0 0.984 0.448 0.984 1s-0.441 1-0.984 1v0z" class="path1"></path></symbol> <symbol id="icon-clock" viewBox="0 0 32 32"><title>clock</title> <path d="M29.333 16c0-7.364-5.97-13.333-13.333-13.333s-13.333 5.97-13.333 13.333c0 7.364 5.97 13.333 13.333 13.333s13.333-5.97 13.333-13.333v0 0 0 0 0 0zM0 16c0-8.837 7.163-16 16-16s16 7.163 16 16c0 8.837-7.163 16-16 16s-16-7.163-16-16zM14.667 14.667v1.333h2.667v-10.667h-2.667v9.333zM24 18.667h1.333v-2.667h-10.667v2.667h9.333z" class="path1"></path></symbol></defs></svg>
        <div class="container">
            <div class="cart">
                <!--商品信息-->
                <div class="item-list-wrap">
                    <div class="cart-item">
                        <div class="cart-item-head">
                            <ul>
                                <li>商品信息</li>
                                <li>商品金额</li>
                                <li>商品数量</li>
                                <li>总金额</li>
                                <li>编辑</li>
                            </ul>
                        </div>
                        <!--商品列表信息-->

                        <ul class="cart-item-list">
                        	<div class="shanghu">
                        		<a href="javascript:;" class="item-check-btn check"><svg class="icon icon-ok"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-ok"></use></svg></a>
                        		<span>商户</span>
                        		<div class="line"></div>
                        	</div>
                        	<li>
                        		<div class="cart-tab-1">
                        			<div class="cart-item-check">
                        				<a href="javascript:;" class="item-check-btn"><svg class="icon icon-ok"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-ok"></use></svg></a>
                        			</div>
                        			<div class="cart-item-pic">
                        				<img src="img/goods-1.jpg" alt="">
                        			</div>
                        			<div class="cart-item-title">
                        				<div class="item-name">
                                           	 黄鹤楼香烟--我是index的值0
                                        </div>
                        			</div>
                        			<div class="item-include">
                        				<dl>
                        					<dt>赠送</dt>
                        					<dd>打火机</dd>
                        					<dd>吸管</dd>
                        				</dl>
                        			</div>
                        		</div>
                        		<div class="cart-tab-2">
                        			<div class="item-price"> ¥ 19.00 元</div>
                        		</div>
                        		<div class="cart-tab-3">
                        			<div class="item-quantity">
                        				<div class="select-self select-self-open">
                        					<div class="quentity">
                        						<a href="javascript:;"> - </a>
                        						<input type="text" disabled="disabled" value="10">
                        							<a href="javascript:;"> + </a>
                        					</div>
                        				</div>
                        				<div class="item-stock"> 有货 </div>
                        			</div>
                        		</div>
                        		<div class="cart-tab-4">
                        			<div class="item-price-total">¥ 95.00 元</div>
                        		</div>
                        		<div class="cart-tab-5">
                        			<div class="cart-item-opration">
                        				<a href="javascript:;" class="item-edit-btn"><svg class="icon icon-del"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-del"></use></svg></a>
                        			</div>
                        		</div>
                        	</li>
                        </ul>
                         <ul class="cart-item-list">
                        	<div class="shanghu">
                        		<a href="javascript:;" class="item-check-btn check"><svg class="icon icon-ok"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-ok"></use></svg></a>
                        		<span>商户</span>
                        		<div class="line"></div>
                        	</div>
                        	<li>
                        		<div class="cart-tab-1">
                        			<div class="cart-item-check">
                        				<a href="javascript:;" class="item-check-btn"><svg class="icon icon-ok"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-ok"></use></svg></a>
                        			</div>
                        			<div class="cart-item-pic">
                        				<img src="img/goods-1.jpg" alt="">
                        			</div>
                        			<div class="cart-item-title">
                        				<div class="item-name">
                                           	 黄鹤楼香烟--我是index的值0
                                        </div>
                        			</div>
                        			<div class="item-include">
                        				<dl>
                        					<dt>赠送</dt>
                        					<dd>打火机</dd>
                        					<dd>吸管</dd>
                        				</dl>
                        			</div>
                        		</div>
                        		<div class="cart-tab-2">
                        			<div class="item-price"> ¥ 19.00 元</div>
                        		</div>
                        		<div class="cart-tab-3">
                        			<div class="item-quantity">
                        				<div class="select-self select-self-open">
                        					<div class="quentity">
                        						<a href="javascript:;"> - </a>
                        						<input type="text" disabled="disabled" value="10">
                        							<a href="javascript:;"> + </a>
                        					</div>
                        				</div>
                        				<div class="item-stock"> 有货 </div>
                        			</div>
                        		</div>
                        		<div class="cart-tab-4">
                        			<div class="item-price-total">¥ 95.00 元</div>
                        		</div>
                        		<div class="cart-tab-5">
                        			<div class="cart-item-opration">
                        				<a href="javascript:;" class="item-edit-btn"><svg class="icon icon-del"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-del"></use></svg></a>
                        			</div>
                        		</div>
                        	</li>
                        	<li>
                        		<div class="cart-tab-1">
                        			<div class="cart-item-check">
                        				<a href="javascript:;" class="item-check-btn"><svg class="icon icon-ok"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-ok"></use></svg></a>
                        			</div>
                        			<div class="cart-item-pic">
                        				<img src="img/goods-1.jpg" alt="">
                        			</div>
                        			<div class="cart-item-title">
                        				<div class="item-name">
                                           	 黄鹤楼香烟--我是index的值0
                                        </div>
                        			</div>
                        			<div class="item-include">
                        				<dl>
                        					<dt>赠送</dt>
                        					<dd>打火机</dd>
                        					<dd>吸管</dd>
                        				</dl>
                        			</div>
                        		</div>
                        		<div class="cart-tab-2">
                        			<div class="item-price"> ¥ 19.00 元</div>
                        		</div>
                        		<div class="cart-tab-3">
                        			<div class="item-quantity">
                        				<div class="select-self select-self-open">
                        					<div class="quentity">
                        						<a href="javascript:;"> - </a>
                        						<input type="text" disabled="disabled" value="10">
                        							<a href="javascript:;"> + </a>
                        					</div>
                        				</div>
                        				<div class="item-stock"> 有货 </div>
                        			</div>
                        		</div>
                        		<div class="cart-tab-4">
                        			<div class="item-price-total">¥ 95.00 元</div>
                        		</div>
                        		<div class="cart-tab-5">
                        			<div class="cart-item-opration">
                        				<a href="javascript:;" class="item-edit-btn"><svg class="icon icon-del"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-del"></use></svg></a>
                        			</div>
                        		</div>
                        	</li>
                        </ul>
                    </div>
                </div>

                <!--footer-->
                <div class="cart-foot-wrap">
                    <!--footer 左边的-->
                    <div class="cart-foot-l">
                        <div class="item-all-check">
                            <a href="javascript:;">
                            <!--v-bind:class 的简写  :class-->
                            <span class="item-check-btn" :class="{'check': checkAllFlag}" @click="checkAll(true)">
                                <svg class="icon icon-ok"><use xlink:href="#icon-ok"></use></svg>
                            </span>
                            <span @click="checkAll(true)"> 全选 </span>
                            </a>
                        </div>
                        <div class="item-all-del">
                            <a href="javascript:;" @click="checkAll(false)"> 取消全选</a>
                        </div>
                    </div>
                    <!--footer 右边的-->
                    <div class="cart-foot-r">
                        <div class="item-total">
                            总价：<span class="total-price"> {{ totalMoney }}</span>
                        </div>
                        <div  class="next-btn-wrap">
                            <a href="javascript:;" class="btn btn--red" > 结账 </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--模态框-->
        <div class="md-modal modal-msg md-modal-transtion " id="showModal" :class="{'md-show': delFlag}">
            <div class="md-modal-inner">
                <div class="md-top">
                    <button class="md-close" @click="delFlag= false"> 关闭 </button>
                </div>
                <div class="md-content">
                    <div class="confirm-tips">
                        <p id="cusLanInfo" lan="Cart.Del.Confirm">你确认删除此订单信息吗?</p>
                    </div>
                    <div class="btn-wrap col-2">
                        <button class="btn btn--m" id="btnModalConfirm" @click=" delProduct()"> YES</button>
                        <button class="btn btn--m  btn--red" id="btnModalCancel" @click=" delFlag = false" > NO</button>
                    </div>
                </div>
            </div>
        </div>
        <!--遮罩层-->
		<!--<div class="md-overlay" id="showOverLay" v-if=" delFlag"></div>-->
    </div>
<script src="/js/commons/jquery-mt.js" type="text/javascript"></script>
<script src="/js/functions/cart/cart.js" type="text/javascript"></script>
</body>
</html>