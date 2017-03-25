$(function(){
	$(".i-text").focus(function(){
		$(this).addClass('h-light');
	});
	$(".i-text").focusout(function(){
		$(this).removeClass('h-light');
	});
	
	var userLogin = {
		fun : {
			getUrlParam : function(){  //获取url中的参数
				var url = location.search; //获取url中"?"符后的字串
				var theRequest = new Object();
				if (url.indexOf("?") != -1) {
					theRequest = new Object();
					var str = url.substr(1);
					strs = str.split("&");
					for(var i = 0; i < strs.length; i ++) {
						theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);
					}
				}
				return theRequest;
			},
			/** 刷新验证码 **/
			reloadVerifyCode:function(){
				var imageNumber = document.getElementById("imageNumber");
				imageNumber.src = domain.main+"/yanZhengMa.html?timestamp="+new Date().getTime();
			},
			/** 登陆验证 **/
			checkLogin:function(){
				var loginId = $.trim($("#loginId").val());
				var password = $.trim($("#password").val());
				var verifyCode = $.trim($("#check-num").val());
				var loginIdLength = userLogin.fun.getByteLength(loginId);
				
				if(loginId == ""){
					$("#verifyCode_error_msg").text("请输入用户名").show();
					return false;
				}else if(loginId.indexOf("@") != -1){
					if(!/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]{2,4}$/.test(loginId)){
						$("#verifyCode_error_msg").text("请输入正确的邮箱格式").show();
	        			return false;
					}
				}else if(/^[\u4e00-\u9fa5a-zA-Z0-9]+$/.test(loginId)){
					if(loginIdLength > 20 || loginIdLength < 4){
						$("#verifyCode_error_msg").text("用户名长度只能在4-20位字符之间").show();
	        			return false;
					}
        		}else{
        			$("#verifyCode_error_msg").text("用户名为4-20位字符,支持汉字、字母、数字组合").show();
					return;
				}
				
				if(password == ""){
					$("#verifyCode_error_msg").text("请输入密码").show();
					return false;
				}else if (password.length < 6 || password.length > 12) {
					$("#verifyCode_error_msg").text("密码长度为6-12位").show();
                    return false;
                }
				
				if(!/^[0-9a-zA-Z]{4}$/.test(verifyCode)){
					$("#verifyCode_error_msg").text("请输入正确的验证码").show();
					return false;
				}
				return true;
			},
			init:function(){
				/** 右侧广告图片 **/
				$.ajax({
					url: domain.passport + "/json/getLoginAdvertisement.html",
					type:"post",
					success:function(obj){
						$("#loginAdvertising").attr("href",obj.landingPageUrl).css("bottom","85px");
						$("#loginAdvertising").find("img").attr("src",obj.pictureUrl).css("width","220px");
					}
				});
				
				
				//tab键 密码框切换到验证码文本框 
				$(".login-input").find("input").keydown(function(e){
					if(e.which == "9"){
						var inputId = $(this).attr("id");
						if(inputId == "loginId"){
							$("#password").focus();
						}else if(inputId == "password"){
							$("#check-num").focus();
						}else{
							return true;
						}
						return false;
					}
				});
				
				/** 点击验证码 **/
				$("#verifyCodeImg").click(function(){
					userLogin.fun.reloadVerifyCode();
				});
				
				$("#loginsubmit").removeAttr("disabled");
				
			},getByteLength:function(val) {
			    var len = 0;
			    for (var i = 0; i < val.length; i++) {
			        if (val[i].match(/[^x00-xff]/ig) != null) //全角
			            len += 2;
			        else
			            len += 1;
			    };
			    return len;
			} 
		}
	};
});

//切换验证码
function checkNumberImage(){
	  var imageNumber = document.getElementById("imageNumber");
	  imageNumber.src = domain.main+"/yanZhengMa.html?timestamp="+new Date().getTime();
}

//ajax 校验验证码
var yzm_result = "0";
function testYZM(){
	var yzm_input = $("#yzm").val();
	if("" == yzm_input || null == yzm_input){
		$("#login_errorTips").text("请填写验证码！").show();
		return false;
	}else{
		$.ajax({
			type: "GET",
		    url:domain.main + "/testYZM.html?input_code="+yzm_input,
		    async:false,
		    success:function(data){
		    	if(data == "110111"){
		    		$("#login_errorTips").text("验证码错误！").show();
		    		checkNumberImage();
		    	}else if(data == "110110"){
		    		$("#login_errorTips").text("验证码失效！").show();
		    		checkNumberImage();
		    	}else if(data == "000000"){
		    		yzm_result = "1";
		    	}
		    },
		    error:function(data){
		    	$("#login_errorTips").text("网络超时！").show();
	    		checkNumberImage();
		    },
		});
	}
}
//登录校验
function toIndex(){
	//登录名密码校验
	var person = new Object();
	var username = $("#username").val();
	var password = $("#password").val();
	var yzm_input = $("#yzm").val();
	var username_reg = /^(13|15|18|14|17)[0-9]{9}$/;
	if(null == username || "" == username){
		$("#login_errorTips").text("账户不能为空！").show();
		return false;
	}else if(!username_reg.test(username)){
		$("#login_errorTips").text("账户不合法！").show();
		return false;
	}else{
		person.loginName = username;
	}
	if(null == password || "" == password){
		$("#login_errorTips").text("密码不能为空！").show();
		return false;
	}else{
		person.password = password;
	}
	if(null == yzm_input || "" == yzm_input){
		$("#login_errorTips").text("验证码不能为空！").show();
		return false;
	}else if("0" == yzm_result){
		$("#login_errorTips").text("验证码错误！").show();
		return false;
	}else if("1" == yzm_result){
		person.yzm = yzm_input;
	}
	var data = $.toJSON(person);
	$("body").append('<form id="loginForm" action="" method="post"><input id="userInfo" name="userInfo" type="hidden"></form>');
	$("#userInfo").val(data); 
	$("#loginForm").attr("action", domain.main+"/toIndex.html"); 
	$("#loginForm").submit();
}





