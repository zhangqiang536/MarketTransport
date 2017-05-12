function close_open(){
	if($(".fr-button").children().hasClass("fr-button-a")){
		$("#sx-show-close").hide();
		$("#sx-show-open").show();
		//js拼接标签太长可以后面加斜杠来换行
		$(".fr-button").html("<div class='fr-button-b'>\
				收起-</div>");
	}else{
		$("#sx-show-close").show();
		$("#sx-show-open").hide();
		$(".fr-button").html("<div class='fr-button-a'>展开+</div>");
	}
}

$(function(){
	$(".sort_detail").find("ul").find("li").click(function(){
		$(this).toggleClass("on");
	})
})

/*$(".content_body .goods .wantToBuy").click(function(){
	//$(this).parent().find() 获取当前点击加入购物车里面的商品信息
//	$(".buyTetailAlert").show();
	window.confirm("确定要买么？");
})
*/
$(".content_body .goods .wantToBuy").click(function(){
	var bh = $("body").height();
	var bw = $(".right-off").width();
	$("#fullbg").css({
		height:bh,
		width:bw,
		display:"block"
	});
	$("#dialog").show();
});
//关闭灰色 jQuery 遮罩
function closeBg() {
	$("#fullbg,#dialog").hide();
}
//飞入购物车效果
/*$(function() {
  var offset = $(".aaaa").offset();
  $(".content_body .goods .wantToBuy").click(function(event){
    var addcar = $(this);
    var img = addcar.parent().find('img').attr('src');
    var flyer = $('<img class="u-flyer" src="'+img+'">');
    flyer.fly({
      start: {
        left: event.pageX, //开始位置（必填）#fly元素会被设置成position: fixed
        top: event.pageY //开始位置（必填）
      },
      end: {
        left: offset.left+10, //结束位置（必填）
        top: offset.top+10, //结束位置（必填）
        width: 0, //结束时宽度
        height: 0 //结束时高度
      },
      onEnd: function(){ //结束回调
        $("#msg").show().animate({width: '250px'}, 200).fadeOut(1000); //提示信息
//        addcar.css("cursor","default").removeClass('orange').unbind('click');
//        this.destory(); //移除dom
      }
    });
  });
});
*/