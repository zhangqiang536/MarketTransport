!
function(a) {
	a.jqtab = function(b, c, d, e) {
		a(c).find("li").hide(),
		a(b).find("li:first").addClass(d).show(),
		a(c).find("li:first").show(),
		a(b).find("li").bind(e,
		function() {
			a(this).addClass(d).siblings("li").removeClass(d);
			var e = a(b).find("li").index(this);
			return a(c).children().eq(e).show().siblings().hide(),
			!1
		})
	}
}(jQuery),
function(a){a.flexslider=function(c,b){var d=c;d.init=function(){d.vars=a.extend({},a.flexslider.defaults,b);d.data("flexslider",true);d.container=a(".slides",d);d.slides=a(".slides > li",d);d.count=d.slides.length;d.animating=false;d.currentSlide=d.vars.slideToStart;d.atEnd=(d.currentSlide==0)?true:false;d.eventType=("ontouchstart"in document.documentElement)?"touchstart":"click";d.cloneCount=0;d.cloneOffset=0;if(d.vars.controlsContainer!=""){d.controlsContainer=a(d.vars.controlsContainer).eq(a(".slides").index(d.container));d.containerExists=d.controlsContainer.length>0};if(d.vars.manualControls!=""){d.manualControls=a(d.vars.manualControls,((d.containerExists)?d.controlsContainer:d));d.manualExists=d.manualControls.length>0};if(d.vars.randomize){d.slides.sort(function(){return(Math.round(Math.random())-0.5)});d.container.empty().append(d.slides)};if(d.vars.animation.toLowerCase()=="slide"){d.css({overflow:"hidden"});if(d.vars.animationLoop){d.cloneCount=2;d.cloneOffset=1;d.container.append(d.slides.filter(":first").clone().addClass("clone")).prepend(d.slides.filter(":last").clone().addClass("clone"))};if(d.vars.direction=="horizontal"){d.container.width(((d.count+d.cloneCount)*d.width())+2000);d.newSlides=a(".slides > li",d);setTimeout(function(){d.newSlides.width(d.width()).css({"float":"left"}).show()},100);d.container.css({marginLeft:(-1*(d.currentSlide+d.cloneOffset))*d.width()+"px"})}else{d.container.height(((d.count+d.cloneCount)*d.height())+2000);d.newSlides=a(".slides > li",d);setTimeout(function(){d.newSlides.height(d.height()).css({"float":"left"}).show()},100);d.container.css({marginTop:(-1*(d.currentSlide+d.cloneOffset))*d.height()+"px"})}}else{d.slides.css({width:"100%","float":"left",marginRight:"-100%"}).filter(":first").fadeIn(400,function(){})};if(d.vars.controlNav){if(d.manualExists){d.controlNav=d.manualControls}else{var g=a('<ol class="flex-control-nav"></ol>');var k=1;for(var l=0;l<d.count;l++){g.append("<li><a>"+k+"</a></li>");k++;};if(d.containerExists){a(d.controlsContainer).append(g);d.controlNav=a(".flex-control-nav li a",d.controlsContainer)}else{d.append(g);d.controlNav=a(".flex-control-nav li a",d)}};d.controlNav.eq(d.currentSlide).addClass("active");d.controlNav.bind("hover",function(i){i.preventDefault();if(!a(this).hasClass("active")){d.flexAnimate(d.controlNav.index(a(this)),d.vars.pauseOnAction,0)}})};if(d.vars.directionNav){var f=a('<ul class="flex-direction-nav"><li><a class="prev" href="#">'+d.vars.prevText+'</a></li><li><a class="next" href="#">'+d.vars.nextText+"</a></li></ul>");if(d.containerExists){a(d.controlsContainer).append(f);d.directionNav=a(".flex-direction-nav li a",d.controlsContainer)}else{d.append(f);d.directionNav=a(".flex-direction-nav li a",d)};if(!d.vars.animationLoop){if(d.currentSlide==0){d.directionNav.filter(".prev").addClass("disabled")}else{if(d.currentSlide==d.count-1){d.directionNav.filter(".next").addClass("disabled")}}};d.directionNav.bind(d.eventType,function(i){i.preventDefault();var j=(a(this).hasClass("next"))?d.getTarget("next"):d.getTarget("prev");if(d.canAdvance(j)){d.flexAnimate(j,d.vars.pauseOnAction)}})};if(d.vars.keyboardNav&&a("ul.slides").length==1){a(document).keyup(function(i){if(d.animating){return}else{if(i.keyCode!=39&&i.keyCode!=37){return}else{if(i.keyCode==39){var j=d.getTarget("next")}else{if(i.keyCode==37){var j=d.getTarget("prev")}};if(d.canAdvance(j)){d.flexAnimate(j,d.vars.pauseOnAction)}}}})};if(d.vars.slideshow){if(d.vars.pauseOnHover&&d.vars.slideshow){d.hover(function(){if(d.directionNav){d.directionNav.filter(".prev").css('display','block');d.directionNav.filter(".next").css('display','block')};d.pause()},function(){if(d.directionNav){d.directionNav.filter(".prev").css('display','none');d.directionNav.filter(".next").css('display','none')};d.resume()})}else{if(d.directionNav){d.directionNav.filter(".prev").css('display','block');d.directionNav.filter(".next").css('display','block')}};if(d.vars.animationTimeout){d.animatedSlides=setInterval(d.animateSlides,d.vars.slideshowSpeed)}};if(d.vars.pausePlay){var e=a('<div class="flex-pauseplay"><span></span></div>');if(d.containerExists){d.controlsContainer.append(e);d.pausePlay=a(".flex-pauseplay span",d.controlsContainer)}else{d.append(e);d.pausePlay=a(".flex-pauseplay li a",d)};var h=(d.vars.slideshow)?"pause":"play";d.pausePlay.addClass(h).text(h);d.pausePlay.click(function(i){i.preventDefault();(a(this).hasClass("pause"))?d.pause():d.resume()})};if(d.vars.touchSwipe&&"ontouchstart"in document.documentElement){d.each(function(){var i,j=20;isMoving=false;function o(){this.removeEventListener("touchmove",m);i=null;isMoving=false};function m(s){if(isMoving){var p=s.touches[0].pageX,q=i-p;if(Math.abs(q)>=j){o();var r=(q>0)?d.getTarget("next"):d.getTarget("prev");if(d.canAdvance(r)){d.flexAnimate(r,d.vars.pauseOnAction)}}}};function n(p){if(p.touches.length==1){i=p.touches[0].pageX;isMoving=true;this.addEventListener("touchmove",m,false)}};if("ontouchstart"in document.documentElement){this.addEventListener("touchstart",n,false)}})};if(d.vars.animation.toLowerCase()=="slide"){d.sliderTimer;if(d.vars.direction=="horizontal"){a(window).resize(function(){d.newSlides.width(d.width());d.container.width(((d.count+d.cloneCount)*d.width())+2000);clearTimeout(d.sliderTimer);d.sliderTimer=setTimeout(function(){d.flexAnimate(d.currentSlide)},300)})}else{a(window).resize(function(){d.newSlides.height(d.height());d.container.height(((d.count+d.cloneCount)*d.height())+2000);clearTimeout(d.sliderTimer);d.sliderTimer=setTimeout(function(){d.flexAnimate(d.currentSlide)},300)})}};d.vars.start(d)};d.flexAnimate=function(f,e,z){if(!isNaN(z)){var animationDuration=z};if(!d.animating){d.animating=true;if(e){d.pause()};if(d.vars.controlNav){d.controlNav.removeClass("active").eq(f).addClass("active")};d.atEnd=(f==0||f==d.count-1)?true:false;if(!d.vars.animationLoop){if(f==0){d.directionNav.removeClass("disabled").filter(".prev").addClass("disabled")}else{if(f==d.count-1){d.directionNav.removeClass("disabled").filter(".next").addClass("disabled");d.pause();d.vars.end(d)}else{d.directionNav.removeClass("disabled")}}};d.vars.before(d);if(d.vars.animation.toLowerCase()=="slide"){if(d.vars.direction=="horizontal"){if(d.currentSlide==0&&f==d.count-1&&d.vars.animationLoop){d.slideString="0px"}else{if(d.currentSlide==d.count-1&&f==0&&d.vars.animationLoop){d.slideString=(-1*(d.count+1))*d.slides.filter(":first").width()+"px"}else{d.slideString=(-1*(f+d.cloneOffset))*d.slides.filter(":first").width()+"px"}};d.container.animate({marginLeft:d.slideString},animationDuration,function(){if(d.currentSlide==0&&f==d.count-1&&d.vars.animationLoop){d.container.css({marginLeft:(-1*d.count)*d.slides.filter(":first").width()+"px"})}else{if(d.currentSlide==d.count-1&&f==0&&d.vars.animationLoop){d.container.css({marginLeft:-1*d.slides.filter(":first").width()+"px"})}};d.animating=false;d.currentSlide=f;d.vars.after(d)})}else{if(d.currentSlide==0&&f==d.count-1&&d.vars.animationLoop){d.slideString="0px"}else{if(d.currentSlide==d.count-1&&f==0&&d.vars.animationLoop){d.slideString=(-1*(d.count+1))*d.slides.filter(":first").height()+"px"}else{d.slideString=(-1*(f+d.cloneOffset))*d.slides.filter(":first").height()+"px"}};d.container.animate({marginTop:d.slideString},animationDuration,function(){if(d.currentSlide==0&&f==d.count-1&&d.vars.animationLoop){d.container.css({marginTop:(-1*d.count)*d.slides.filter(":first").height()+"px"})}else{if(d.currentSlide==d.count-1&&f==0&&d.vars.animationLoop){d.container.css({marginTop:-1*d.slides.filter(":first").height()+"px"})}};d.animating=false;d.currentSlide=f;d.vars.after(d)})}}else{d.slides.eq(d.currentSlide).fadeOut(animationDuration);d.slides.eq(f).fadeIn(animationDuration,function(){d.animating=false;d.currentSlide=f;d.vars.after(d)})}}};d.animateSlides=function(){if(!d.animating){var e=(d.currentSlide==d.count-1)?0:d.currentSlide+1;d.flexAnimate(e)}};d.pause=function(){clearInterval(d.animatedSlides);if(d.vars.pausePlay){d.pausePlay.removeClass("pause").addClass("play").text("play")}};d.resume=function(){d.animatedSlides=setInterval(d.animateSlides,d.vars.slideshowSpeed);if(d.vars.pausePlay){d.pausePlay.removeClass("play").addClass("pause").text("pause")}};d.canAdvance=function(e){if(!d.vars.animationLoop&&d.atEnd){if(d.currentSlide==0&&e==d.count-1&&d.direction!="next"){return false}else{if(d.currentSlide==d.count-1&&e==0&&d.direction=="next"){return false}else{return true}}}else{return true}};d.getTarget=function(e){d.direction=e;if(e=="next"){return(d.currentSlide==d.count-1)?0:d.currentSlide+1}else{return(d.currentSlide==0)?d.count-1:d.currentSlide-1}};d.init()};a.flexslider.defaults={animation:"fade",direction:"horizontal",animationTimeout:true,slideshow:true,slideshowSpeed:3000,animationDuration:400,directionNav:true,controlNav:true,keyboardNav:false,touchSwipe:false,prevText:"&larr;",nextText:"&rarr;",pausePlay:false,randomize:false,slideToStart:0,animationLoop:true,pauseOnAction:true,pauseOnHover:true,controlsContainer:"",manualControls:"",start:function(){},before:function(){},after:function(){},end:function(){}};a.fn.flexslider=function(b){return this.each(function(){if(a(this).find(".slides li").length==1){a(this).find(".slides li").fadeIn(400)}else{if(a(this).data("flexslider")!=true){new a.flexslider(a(this),b)}}})}}(jQuery),
function(a){
	var b = '<div id="thickdesk" class="thickdiv" ></div><div class="pop-up"  id="pop-up"><div class="pop_in"><div id="pop-caption" class="caption" ><div id="pop-title" class="text"></div><div class="closebox"><a href="javasctipt:" id="pop-close" title="\u5173\u95ed"></a></div></div><div class="content" id="pop-body"></div></div></div>';
	a.fn.popbox = function(b) {
		b = b || {};
		var d = a.extend({},
		c, b);
		return this.each(function() {
			var c = this.nodeName.toLowerCase();
			"a" === c && d.ajaxTagA ? a(this).click(function() {
				var c = a.trim(a(this).attr("href"));
				if (c && 0 != c.indexOf("javascript:")) if (0 === c.indexOf("#")) a.popbox(a(c), b);
				else {
					a.popbox.loading();
					var d = new Image;
					d.onload = function() {
						var e = d.width,
						f = d.height;
						if (e > 0) {
							var g = a('<img src="' + c + '" width="' + e + '" height="' + f + '" />');
							b.protect = !1,
							a.popbox(g, b)
						}
					},
					d.onerror = function() {
						a.popbox.ajax(c, {},
						b)
					},
					d.src = c
				}
				return ! 1
			}) : a.popbox(a(this), b)
		})
	},
	a.popbox = function(d, e) {
		if (d) {
			var f = a.extend({},
			c, e || {}),
			g = a("#pop-up"),
			h = a("#thickdesk");
			g.size() ? (g.show(), h[f.bg ? "show": "hide"]()) : a("body").append(b),
			"object" == typeof d ? d.show() : d = a(d),
			a.o = {
				s: f,
				ele: d,
				bg: h.size() ? h: a("#thickdesk"),
				out: g.size() ? g: a("#pop-up"),
				tit: a("#pop-title"),
				bar: a("#pop-caption"),
				clo: a("#pop-close"),
				bd: a("#pop-body")
			},
			a.o.tit.html(f.title),
			a.o.clo.html(f.shut),
			a.o.bd.empty().append(d),
			a.isFunction(f.onshow) && f.onshow(),
			a.popbox.setSize(),
			a.popbox.setPosition(),
			f.fix && a.popbox.setFixed(),
			f.drag ? a.popbox.drag() : a(window).resize(function() {
				a.popbox.setPosition()
			}),
			f.bar ? a.popbox.barShow() : a.popbox.barHide(),
			f.bg ? a.popbox.bgShow() : a.popbox.bgHide(),
			f.titleclose ? a.popbox.titleShow() : a.popbox.titleHide(),
			f.btnclose ? a.o.clo.click(function() {
				return a.popbox.hide(),
				!1
			}) : a.popbox.closeBtnHide(),
			f.bgclose && a.popbox.bgClickable(),
			f.delay > 0 && setTimeout(a.popbox.hide, f.delay)
		}
	},
	a.extend(a.popbox, {
		setSize: function() {
			return a.o.bd.size() && a.o.ele.size() && a.o.bd.size() ? (a.o.out.css({
				width: a.o.s.width,
				"height:": a.o.s.height
			}), a.o.out) : void 0
		},
		setPosition: function(b) {
			if (b = b || !1, a.o.bg.size() && a.o.ele.size() && a.o.out.size()) {
				var c = a(window).width(),
				d = a(window).height(),
				e = a(window).scrollTop(),
				f = a(document).height();
				d > f && (f = d),
				a.o.bg.css("opacity", a.o.s.opacity);
				var g = a.o.out.outerHeight(),
				h = a.o.out.outerWidth(),
				i = e + (d - g) / 2,
				j = (c - h) / 2;
				return a.o.s.fix && window.XMLHttpRequest && (i = (d - g) / 2),
				b === !0 ? a.o.out.animate({
					top: i,
					left: j
				}) : a.o.out.css({
					top: i,
					left: j,
					zIndex: a.o.s.index
				}),
				a.o.out
			}
		},
		setFixed: function() {
			return a.o.out && a.o.out.size() ? (window.XMLHttpRequest ? a.popbox.setPosition().css({
				position: "fixed"
			}) : a(window).scroll(function() {
				a.popbox.setPosition()
			}), a.o.out) : void 0
		},
		bgClickable: function() {
			a.o.bg && a.o.bg.size() && a.o.bg.click(function() {
				a.popbox.hide()
			})
		},
		bgHide: function() {
			a.o.bg && a.o.bg.size() && a.o.bg.hide()
		},
		bgShow: function() {
			a.o.bg && a.o.bg.size() ? a.o.bg.show() : a('<div id="thickdesk"></div>').prependTo("body")
		},
		barHide: function() {
			a.o.bar && a.o.bar.size() && a.o.bar.hide()
		},
		barShow: function() {
			a.o.bar && a.o.bar.size() && a.o.bar.show()
		},
		titleHide: function() {
			a.o.tit && a.o.tit.size() && a.o.tit.hide()
		},
		titleShow: function() {
			a.o.tit && a.o.tit.size() && a.o.tit.show()
		},
		closeBtnHide: function() {
			a.o.clo && a.o.clo.size() && a.o.clo.hide()
		},
		hide: function() {
			return a.o.ele && a.o.out.size() && "none" !== a.o.out.css("display") && (a.o.out.fadeOut("fast",
			function() { ! a.o.s.protect || a.o.ele.hasClass("info") && !a.o.ele.attr("id") || a.o.ele.hide().appendTo(a("body")),
				a(this).remove(),
				a.isFunction(a.o.s.onclose) && a.o.s.onclose()
			}), a.o.bg.size() && a.o.bg.fadeOut("fast",
			function() {
				a(this).remove()
			})),
			!1
		},
		drag: function() {
			if (!a.o.out.size() || !a.o.bar.size()) return a(document).unbind("mouseover").unbind("mouseup"),
			void 0;
			var b = a.o.bar,
			c = a.o.out,
			d = !1,
			e = 0,
			f = 0,
			g = c.css("left"),
			h = c.css("top");
			b.mousedown(function(a) {
				d = !0,
				e = a.pageX,
				f = a.pageY
			}).css("cursor", "move"),
			a(document).mousemove(function(a) {
				if (d) {
					var b = a.pageX,
					i = a.pageY,
					j = b - e,
					k = i - f;
					c.css("left", parseInt(g) + j).css("top", parseInt(h) + k)
				}
			}),
			a(document).mouseup(function() {
				d = !1,
				g = c.css("left"),
				h = c.css("top")
			})
		},
		loading: function() {
			var b = a('<div class="info">\u52a0\u8f7d\u4e2d...</div>');
			a.popbox(b, {
				bar: !1
			})
		},
		ask: function(b, c, d, e) {
			var f = a('<div class="info">' + b + '<p><button id="popSubmitBtn" class="submit_btn">\u786e\u8ba4</button>&nbsp;&nbsp;<button id="popCancelBtn" class="cancel_btn">\u53d6\u6d88</button></p></div>');
			a.popbox(f, e),
			a("#popSubmitBtn").click(function() {
				a.isFunction(c) && c.call(this)
			}),
			a("#popCancelBtn").click(function() {
				d && a.isFunction(d) && d.call(this),
				a.popbox.hide()
			})
		},
		remind: function(b, c, d) {
			var e = a('<div class="info">' + b + '<p><button id="popSubmitBtn" class="submit_btn">\u786e\u8ba4</button</p></div>');
			a.popbox(e, d),
			a("#popSubmitBtn").click(function() {
				c && a.isFunction(c) && c.call(this),
				a.popbox.hide()
			})
		},
		ajax: function(b, c, d) {
			b && (a.popbox.loading(), d = d || {},
			d.protect = !1, a.ajax({
				url: b,
				data: c || {},
				success: function(b) {
					a.popbox(b, d)
				},
				error: function() {
					a.popbox.remind("\u52a0\u8f7d\u3002")
				}
			}))
		}
	});
	var c = {
		title: "\u5bf9\u8bdd\u6846",
		shut: "&times;",
		index: 10001,
		opacity: .5,
		width: "auto",
		height: "auto",
		bar: !0,
		bg: !0,
		btnclose: !0,
		titleclose: !0,
		fix: !1,
		bgclose: !1,
		drag: !1,
		ajaxTagA: !0,
		protect: "auto",
		onshow: a.noop,
		onclose: a.noop,
		delay: 0
	}
} (jQuery);
var slider = function() {
	function a(a, b, c) {
		for (var d = a.getElementsByTagName(b), e = 0, f = d.length, g = []; f > e; e++) d[e].className == c && g.push(d[e]);
		return 1 == g.length && (g = g[0]),
		g
	}
	function b(b, c, d, e, f) {

		this.slides = [],
		this.over = !1,
		this.S = this.S0 = c,
		this.iW = d,
		this.iH = e,
		this.oP = f,
		this.oc = document.getElementById(b),
		this.frm = a(this.oc, "div", "slide"),
		this.NF = this.frm.length,
		this.marginleft = this.NF == 5?"-122px":"-104px",		
		this.resize();
		for (var g = 0; g < this.NF; g++) this.slides[g] = new Slide(this, g);
		this.oc.parent = this,
		this.view = this.slides[0],
		this.Z = this.mx,
		this.oc.onmouseout = function() {
			return ! 1
		}
	}
	return b.prototype = {
		run: function() {
			this.Z += this.over ? .5 * (this.mn - this.Z) : .5 * (this.mx - this.Z),
			
			this.view.calc();
			for (var a = this.NF; a--;) this.slides[a].move()
		},
		resize: function() {
			this.wh = this.oc.clientWidth,
			this.ht = this.oc.clientHeight,
			this.wr = this.wh * this.iW,
			this.r = this.ht / this.wr,
			this.mx = this.wh / this.NF,
			this.mn = this.wh * (1 - this.iW) / (this.NF - 1)
		},
		mouseout: function() {}
	},
	Slide = function(b, c) {
		this.parent = b,
		this.N = c,
		this.x0 = this.x1 = c * b.mx,
		this.v = 0,
		this.loaded = !1,
		this.cpt = 0,
		this.start = new Date,
		this.obj = b.frm[c],
		this.img = a(this.obj, "img", "nb"),

		0 == c && (this.obj.style.borderLeft = "none"),
		this.obj.style.left = Math.floor(this.x0) + "px",		
		$(this.img).css("opacity", b.oP / 100),
		this.obj.parent = this,
		this.obj.onmouseover = function() {
			return this.parent.over(),
			!1
		}
	},
	Slide.prototype = {
		calc: function() {
			for (var a = this.parent,
			b = 0; b <= this.N; b++) a.slides[b].x1 = b * a.Z;
			for (var b = this.N + 1; b < a.NF; b++) a.slides[b].x1 = a.wh - (a.NF - b) * a.Z
		},
		move: function() {
			var a = this.parent,
			b = (this.x1 - this.x0) / a.S;
			this.N && Math.abs(b) > .5 && (this.obj.style.left = Math.floor(this.x0 += b) + "px"),
			this.loaded || this.img.complete && (this.img.style.visibility = "visible", this.loaded = !0)
		},
		over: function() {
			this.parent.resize(),
			this.parent.over = !0,
			$(this.parent.view.img).css("opacity", this.parent.oP / 100),
			this.parent.view = this,
			this.start = new Date,
			this.cpt = 0,
			this.pro = !1,
			this.calc(),			
			$(this.img).css("opacity", 1),
			$("#slider .slide img").animate({
				"margin-left": "0px"
			},
			0),
			$(this.img).animate({
				"margin-left": this.parent.marginleft
			},
			0)
			
		}
	},
	{
		init: function(a) {
			this.s1 = new b("slider", 6, 1.48 / a, .3125, 95),
			setInterval("slider.s1.run();", 16)
		}
	}
	
} ();