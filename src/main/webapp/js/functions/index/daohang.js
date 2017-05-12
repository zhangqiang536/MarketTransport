$(function(){
    $('.category .category-item').mouseover(function(){
        var index=$(this).index();
        $('.children').eq(index).css('display','block');

    }).mouseout(function(){
        var i=$(this).index();
        $('.children').eq(i).css('display','none');

    })
});

/*页面顶部轮播*/
$(function(){
    var length=$('.slider-main>li').length,
        startIndex=null,
        canAuto=false,
        t=3000,
        timer=null,
        currentIndex=0;
    $('.slider-main>li:not(:first)').hide();
    $('.slider-main,.btn,.index').hover(
        function(){
            stop();
        },
        function(){
            start();
        });
    $(".index>li").mouseenter(function(){
        startIndex=currentIndex;
        currentIndex=$(this).index();
        play(startIndex,currentIndex);
    });
    $('.pre').click(function(){
        startIndex=currentIndex;
        currentIndex=--currentIndex % length;
        play(startIndex,currentIndex);
    });
    $('.next').click(function(){
        startIndex=currentIndex;
        currentIndex=++currentIndex % length;
        play(startIndex,currentIndex);
    });

    function play(){
        if (startIndex === currentIndex) {
            return;
        }
        $('.slider-main>li').eq(startIndex).stop().fadeOut(500).
        parent().children().eq(currentIndex).stop().fadeIn(1000);
        $('.index>li').eq(currentIndex).addClass
        ('active').siblings().removeClass('active');
    }
    function start(){
        if(!canAuto){
            canAuto=true;
            timer=setInterval(function(){$('.next').triggerHandler('click');},t);
        }
    }
    function stop(){
        canAuto=false;
        clearInterval(timer);
    }
    start();
});