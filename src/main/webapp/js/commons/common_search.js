$(function(){
	$(".search_button").click(function(){
		window.open("/toSearch.html", "_self");
		 /*var a = 1;
		 $.ajax({
			  type: "GET",
	             url: "/toSearch.html",
	             data: {},
	             dataType: "json",
	             success: function(data){
//	            	 alert(1);
	             },
	             
		}) */
	});
	
	$(".exitSys").click(function(){
		window.open("/exitSys.html","_self");
	})
})
