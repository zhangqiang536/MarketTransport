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

