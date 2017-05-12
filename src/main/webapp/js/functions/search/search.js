$(".listclass li").click(function(){
	$(this).addClass("on").siblings().removeClass("on");
})

$(".buyButton").click(function(){
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


$('#dialog .button').on('click', function () {
	var cart = $('.cart_header');
	var imgtodrag = $(this).siblings().eq(0);
	if (imgtodrag) {
		var imgclone = imgtodrag.clone().offset({
			top: imgtodrag.offset().top,
			left: imgtodrag.offset().left
		}).css({
			'opacity': '0.5',
			'position': 'absolute',
			'height': '150px',
			'width': '150px',
			'z-index': '100'
		}).appendTo($('body')).animate({
			'top': cart.offset().top + 10,
			'left': cart.offset().left + 10,
			'width': 75,
			'height': 75
		}, 1000, 'easeInOutExpo');
		setTimeout(function () {
			cart.effect('shake', { times: 2 }, 200);
		}, 1500);
		imgclone.animate({
			'width': 0,
			'height': 0
		}, function () {
			$(this).detach();
		});
	}
});

$(".cart_header").click(function(){
	window.open("toCart.html","_self");
})

